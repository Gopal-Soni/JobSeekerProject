package com.gopal.backend;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.gopal.conncetion.DBConnection;

public class Register extends HttpServlet 
{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
	{
		resp.setContentType("text/html");	
		PrintWriter out = resp.getWriter();
		
		String name2 = req.getParameter("name1");
		String email2 = req.getParameter("email1");
		String pass2 = req.getParameter("pass1");
		String gender2 = req.getParameter("gender1");
		String[] field2 = req.getParameterValues("field1");
		String city2 = req.getParameter("city1");
		
		
			String fields2 = "";
			for(String s : field2)
			{
				fields2 = fields2+","+s;
			}
		
		
		Connection con = null;
		try
		{
			con = DBConnection.getConnect();
			con.setAutoCommit(false);
			
//			System.out.println("Yes, Program is Working");
			PreparedStatement ps = con.prepareStatement("insert into register(name, email, password, gender, field, city) values(?,?,?,?,?,?)");
			ps.setString(1, name2);
			ps.setString(2, email2);
			ps.setString(3, pass2);
			ps.setString(4, gender2);
			ps.setString(5, fields2);
			ps.setString(6, city2);
			int i = ps.executeUpdate();
			
			PreparedStatement ps1 = con.prepareStatement("insert into about_user(email, about, skills) values(?,?,?)");
			ps1.setString(1, email2);
			ps1.setString(2, "");
			ps1.setString(3, "");
			int i1 = ps1.executeUpdate();

			PreparedStatement ps2 = con.prepareStatement("insert into profile_pics(email, path) values(?,?)");
			ps2.setString(1, email2);
			ps2.setString(2, "profilepicIcon1.png");
			int i2 = ps2.executeUpdate();
			if(i>0 && i1>0 && i2>0)
			{
				con.commit();
				  HttpSession session = req.getSession(); 
				  session.setAttribute("session_name", name2); 
				  session.setAttribute("session_email", email2);
				  session.setAttribute("session_gender", gender2);
				  session.setAttribute("session_city", city2);
				  session.setAttribute("session_fields", field2);
				  
				  session.setAttribute("session_title", "");
				  session.setAttribute("session_skills", "");
				  
				  session.setAttribute("session_profilepic", "profilepicIcon1.png");
				 
				resp.sendRedirect("profile.jsp");
				out.println("User registered successfully");
			}
			else
			{
				con.rollback();
				out.println("Failed");
			}
			
		} 
		catch (Exception e) 
		{
			try 
			{
				con.rollback();				
			} 
			catch (Exception e2)
			{
				e2.printStackTrace();
			}
			e.printStackTrace();
		}
		finally
		{
			try 
			{
			    con.close();
			} 
			catch (Exception e2)
			{
				e2.printStackTrace();
			}
		}
	}
}
