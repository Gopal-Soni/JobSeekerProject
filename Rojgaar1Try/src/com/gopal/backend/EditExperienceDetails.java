package com.gopal.backend;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.gopal.conncetion.DBConnection;

public class EditExperienceDetails extends HttpServlet 
{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
	{
		resp.setContentType("text/html");
		PrintWriter out = resp.getWriter();
		
		String id2 = req.getParameter("id1");
		String company2 = req.getParameter("company1");
		String location2 = req.getParameter("location1");
		String year2 = req.getParameter("year1");
		String job_title2 = req.getParameter("job_title1");
		String description2 = req.getParameter("description1");
		
		Connection con = null;
		PreparedStatement ps = null;
		try
		{
			con = DBConnection.getConnect();
			con.setAutoCommit(false);
			
			ps = con.prepareStatement("update experience set company=?, location=?, year=?, job_title=?, description=? where id=?");
			ps.setString(1, company2);
			ps.setString(2, location2);
			ps.setString(3, year2);
			ps.setString(4, job_title2);
			ps.setString(5, description2);
			ps.setString(6, id2);
			int i = ps.executeUpdate();
			if(i>0)
			{
				con.commit();
				resp.sendRedirect("profile.jsp");
				/* out.println("Successfully Inserted"); */
			}
			else
			{
				con.rollback();
				/* out.println("Failed"); */
				RequestDispatcher rd1 = req.getRequestDispatcher("error.jsp");
				rd1.include(req, resp);
				
				RequestDispatcher rd2 = req.getRequestDispatcher("edit-profile-experience.jsp");
				rd2.include(req, resp);
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
			/* out.println(e); */
			RequestDispatcher rd1 = req.getRequestDispatcher("error.jsp");
			rd1.include(req, resp);
			
			RequestDispatcher rd2 = req.getRequestDispatcher("edit-profile-experience.jsp");
			rd2.include(req, resp);
		}
		finally 
		{
			try 
			{
				ps.close();
				con.close();
			}
			catch (Exception e3)
			{
				e3.printStackTrace();			
			}			
		}
	}
}
