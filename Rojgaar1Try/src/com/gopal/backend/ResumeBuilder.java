package com.gopal.backend;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.gopal.conncetion.DBConnection;
import com.itextpdf.text.BaseColor;
import com.itextpdf.text.Document;
import com.itextpdf.text.Font;
import com.itextpdf.text.FontFactory;
import com.itextpdf.text.Image;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.Phrase;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;

public class ResumeBuilder extends HttpServlet 
{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
	{
		
		//----------------------------------------
		try
		{
			HttpSession session = req.getSession();
			String name2 = (String)session.getAttribute("session_name");
			String email2 = (String)session.getAttribute("session_email");
			String profilepic2 = (String)session.getAttribute("session_profilepic");
			//----------------------------------------
			
			String address2 = req.getParameter("address1");
			String career2 = req.getParameter("career1");
			String hobbies2 = req.getParameter("hobbies1");
			String dob2 = req.getParameter("dob1");
			String gendermaritial2 = req.getParameter("gendermaritial1");
			String language2 = req.getParameter("language1");
			
			String resume_pdf_name = email2+".pdf";
			Document document = new Document();
			PdfWriter writer = PdfWriter.getInstance(document, new FileOutputStream(PathDetails.RESUME_BUILDER_PATH+resume_pdf_name));
			document.open();
			
			//---------title----------
			String font_name="Arial";
			float font_size = 18;
			int style = Font.BOLD;
			Paragraph title = new Paragraph("Resume", FontFactory.getFont(font_name, font_size, style, BaseColor.RED));
			document.add(title);
			//----------------------------------------
			
			Paragraph emptyspace = new Paragraph(" ");
			document.add(emptyspace);
			
			//---------------image, name & email--------------
			Image image1 = Image.getInstance(PathDetails.PROFILE_PIC_PATH+profilepic2);
			image1.scaleAbsolute(100f, 130f);
			document.add(image1);
			
			Paragraph namee = new Paragraph(name2);
			document.add(namee);
			
			int email_font_size = 8;
			Paragraph emaill = new Paragraph("("+email2+")", FontFactory.getFont(font_name, email_font_size));
			document.add(emaill);
			//-----------------------------------------
			document.add(emptyspace);
			//----------------career objective---------
			
			String co_font_name="Arial";
			float co_font_size = 14;
			int co_style = Font.ITALIC;
			Paragraph careertitle = new Paragraph("Career Objective", FontFactory.getFont(co_font_name, co_font_size, co_style, BaseColor.PINK));
			document.add(careertitle);
			
			Paragraph career = new Paragraph(career2);
			document.add(career);
			//----------------------------------------
			document.add(emptyspace);
			
			//-------------educational qualification-
			
			Paragraph eduquatitle = new Paragraph("Educational Qualification", FontFactory.getFont(co_font_name, co_font_size, co_style, BaseColor.PINK));
			document.add(eduquatitle);
			
			PdfPTable table = new PdfPTable(4);
			table.setSpacingBefore(20);
			
			PdfPCell c1 = new PdfPCell(new Phrase("Year"));
			table.addCell(c1);
			
			PdfPCell c2 = new PdfPCell(new Phrase("School/College"));
			table.addCell(c2);
			
			PdfPCell c3 = new PdfPCell(new Phrase("Degree"));
			table.addCell(c3);
			
			PdfPCell c4 = new PdfPCell(new Phrase("Grade"));
			table.addCell(c4);
			
			Connection con1 = null;
			String yearr1="", schoolll="", degreee1="", gradee1="";
			try 
			{
				con1 = DBConnection.getConnect();
				PreparedStatement ps = con1.prepareStatement("select * from education where email=?");
				ps.setString(1, email2);
				ResultSet rs = ps.executeQuery();
				while(rs.next())
				{
					yearr1 = rs.getString("year");
					schoolll = rs.getString("school");
					degreee1 = rs.getString("degree");
					gradee1 = rs.getString("grade");
					
					table.addCell(yearr1);
					table.addCell(schoolll);
					table.addCell(degreee1);
					table.addCell(gradee1);
				}
			} 
			catch (Exception e)
			{
				e.printStackTrace();
			}
			finally
			{
				try
				{
					con1.close();
				} 
				catch (Exception e2)
				{
					e2.printStackTrace();
				}				
			}
			
			
			document.add(table);
			//----------------------------------
			
			document.add(emptyspace);
			
			//----experience qualification-------
			
			Paragraph exptitle = new Paragraph("Experience", FontFactory.getFont(co_font_name, co_font_size, co_style, BaseColor.PINK));
			document.add(exptitle);
			
			PdfPTable table2 = new PdfPTable(4);
			
			table2.setSpacingBefore(20);
			
			PdfPCell exc1 = new PdfPCell(new Phrase("Year"));
			table2.addCell(exc1);
			
			PdfPCell exc2 = new PdfPCell(new Phrase("School/College"));
			table2.addCell(exc2);
			
			PdfPCell exc3 = new PdfPCell(new Phrase("Degree"));
			table2.addCell(exc3);
			
			PdfPCell exc4 = new PdfPCell(new Phrase("Grade"));
			table2.addCell(exc4);
			
			Connection con2 = null;
			String exyearr1="", company1="", location1="", jobtitle1="";
			try 
			{
				con2 = DBConnection.getConnect();
				PreparedStatement ps = con2.prepareStatement("select * from experience where email=?");
				ps.setString(1, email2);
				ResultSet rs = ps.executeQuery();
				while(rs.next())
				{
					exyearr1 = rs.getString("year");
					company1 = rs.getString("company");
					location1 = rs.getString("location");
					jobtitle1 = rs.getString("job_title");
					
					table2.addCell(exyearr1);
					table2.addCell(company1);
					table2.addCell(location1);
					table2.addCell(jobtitle1);
				}
			} 
			catch (Exception e)
			{
				e.printStackTrace();
			}
			finally
			{
				try
				{
					con2.close();
				} 
				catch (Exception e2)
				{
					e2.printStackTrace();
				}				
			}
			
			document.add(table2);
			
			//-------------------------------------
			
			
			document.add(emptyspace);
			
			//--------------------hobbies------------
			
			Paragraph hobbies = new Paragraph("Hobbies", FontFactory.getFont(co_font_name, co_font_size, co_style, BaseColor.PINK));
			document.add(hobbies);
			
			Paragraph myhobbies = new Paragraph(hobbies2);
			document.add(myhobbies);
			
			//----------------------------------------
			
			document.add(emptyspace);
			
			//--------------------Personal Info-------
			
			Paragraph perindo = new Paragraph("Personal Information", FontFactory.getFont(co_font_name, co_font_size, co_style, BaseColor.PINK));
			document.add(perindo);
			
			Paragraph dob = new Paragraph("Date of Birth : "+dob2);
			document.add(dob);
			
			Paragraph genmar = new Paragraph("Gender / Marital Status : "+gendermaritial2);
			document.add(genmar);
			
			Paragraph langpro = new Paragraph("Language Proficiency : "+language2);
			document.add(langpro);
			
			Paragraph addr = new Paragraph("Address : "+address2);
			document.add(addr);
			
			//----------------------------------------
			
			document.add(emptyspace);
			
			//--------------------Declaration---------
			
			Paragraph decl = new Paragraph("Declaration", FontFactory.getFont(co_font_name, co_font_size, co_style, BaseColor.PINK));
			document.add(decl);
			
			Paragraph mydescl = new Paragraph("I do hereby declare that the above information is true to the best of my knowledge. : ");
			document.add(dob);
			
			//----------------------------------------
			
			document.add(emptyspace);
			
			//--------------------lname---------------
			
			Paragraph lname = new Paragraph("Name : "+name2);
			document.add(lname);
			
			Date d = new Date();
			SimpleDateFormat sdf1 = new SimpleDateFormat("dd/mm/yyyy");
			
			Paragraph ldate = new Paragraph("Date : "+sdf1.format(d));
			document.add(ldate);
			
			//----------------------------------------
			
			// last step : close the document
			document.close();
			
			resp.sendRedirect("profile.jsp");
		}
		catch (Exception e)
		{
			e.printStackTrace();
		}
	}
}
