package com.gopal.backend;

import java.io.File;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import org.apache.commons.fileupload.FileItemFactory;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.gopal.conncetion.DBConnection;

public class UpdateResume extends HttpServlet
{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
	{
		String file_name = null;
		try 
		{
			DiskFileItemFactory factory = new DiskFileItemFactory();
			ServletFileUpload sfu = new ServletFileUpload(factory);
			List<FileItem> items = sfu.parseRequest(req);
			FileItem item = items.get(0);
			String file_path = item.getName();
			File file = new File(file_path);
			file_name = file.getName();
			
			File f1 = new File(PathDetails.RESUME_PATH+file_name);
			item.write(f1);
		}
		catch (Exception e)
		{
			e.printStackTrace();
		}
		
		
		Connection con = null;
		HttpSession session = req.getSession();
		String email = (String)session.getAttribute("session_email");
		try 
		{
			con = DBConnection.getConnect();
			con.setAutoCommit(false);
			PreparedStatement ps = con.prepareStatement("select * from resumes where email=?");
			ps.setString(1, email);
			
			ResultSet rs = ps.executeQuery();
			if(rs.next())
			{
				PreparedStatement ps2 = con.prepareStatement("update resumes set path=? where email=?");
				ps2.setString(1, file_name);
				ps2.setString(2, email);
				
				int i = ps2.executeUpdate();
				if(i>0)
				{
					con.commit();
					resp.sendRedirect("profile.jsp");
				}
				else
				{
					con.commit();
					RequestDispatcher rd1 = req.getRequestDispatcher("error.jsp");
					rd1.include(req, resp);
					
					RequestDispatcher rd2 = req.getRequestDispatcher("upload-resume.jsp");
					rd2.include(req, resp);
				}
				
			}
			else
			{
				PreparedStatement ps3 = con.prepareStatement("insert into resumes(email, path) values(?,?)");
				ps3.setString(1, email);
				ps3.setString(2, file_name);
				
				int i = ps3.executeUpdate();
				if(i>0)
				{
					con.commit();
					
					resp.sendRedirect("profile.jsp");
				}
				else
				{
					con.rollback();
					
					RequestDispatcher rd1 = req.getRequestDispatcher("error.jsp");
					rd1.include(req, resp);
					
					RequestDispatcher rd2 = req.getRequestDispatcher("upload-resume.jsp");
					rd2.include(req, resp);
				}
			}
		} 
		catch (Exception e)
		{
			e.printStackTrace();
			try 
			{
				con.rollback();
			}
			catch (Exception ee2)
			{
				ee2.printStackTrace();
			}
			
			RequestDispatcher rd1 = req.getRequestDispatcher("error.jsp");
			rd1.include(req, resp);
			
			RequestDispatcher rd2 = req.getRequestDispatcher("upload-resume.jsp");
			rd2.include(req, resp);
		}
		finally
		{
			try 
			{
				con.close();
			} 
			catch(Exception e2) 
			{
				e2.printStackTrace();
			}			
		}
	}
}