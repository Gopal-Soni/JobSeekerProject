package com.gopal.backend;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gopal.conncetion.DBConnection;

public class JobSearchByTechnology extends HttpServlet 
{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
	{
		PrintWriter out = resp.getWriter();
		String tech1 = req.getParameter("technology");
		Connection con = null;
		String id, job_profile, company, experience, description, date1, time1;
		try
		{
			con = DBConnection.getConnect();
			PreparedStatement ps = con.prepareStatement("Select * from jobs where job_profile LIKE '%"+tech1+"%'");
			//ps.setString(1, tech1);
			ResultSet rs = ps.executeQuery();
			while(rs.next())
			{
				id = rs.getString("id");
				job_profile = rs.getString("job_profile");
				company = rs.getString("company");
				experience = rs.getString("experience");
				description = rs.getString("description");
				date1 = rs.getString("date1");
				time1 = rs.getString("time1");
				
				/*
				 * out.print(id); out.print(job_profile); out.print(company);
				 * out.print(experience); out.print(description); out.print(date1);
				 * out.print(time1);
				 */
				out.println("<div class=\"col-md-12 display_job-div\">\r\n" + 
						"						    	<b>"+job_profile+"</b><span style=\"font-size: 12px; color: #57111d; float: right;\">("+date1+" & "+time1+"</span><br> \r\n" + 
						"						    	<span class=\"glyphicon glyphicon-home\"></span> <span style=\"color: #57111d\"> Company : </span>"+company+"<br> \r\n" + 
						"						    	<span class=\"glyphicon glyphicon-book\"></span><span style=\"color: #57111d\"> Experience : </span> "+experience+"<br>\r\n" + 
						"						    	<span class=\"glyphicon glyphicon-file\"></span><span style=\"color: #57111d\">Description :</span> "+description+"<br>\r\n" + 
						"						    	<a href=\"job-description.jsp?jid="+id+"\"> See Full Details </a>\r\n" + 
						"					        </div>");
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
				con.close();
			}
			catch (Exception e2)
			{
				e2.printStackTrace();
			}			
		}
	}
}
