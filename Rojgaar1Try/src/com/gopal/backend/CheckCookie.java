package com.gopal.backend;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class CheckCookie extends HttpServlet 
{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
	{
		HttpSession session = req.getSession();
		
		String email=(String)session.getAttribute("session_email");
		
		if(email == null ? email == null : email.trim().equals("null"))
		{
			Cookie[] ck = req.getCookies();
			if(ck != null)
			{
				for(Cookie cookie : ck)
				{
					if(cookie.getName().equals("cookie_email"))
					{
						email = cookie.getValue();
						
						req.setAttribute("email1", email);
						
						RequestDispatcher rd = req.getRequestDispatcher("GetUserData");
						rd.include(req, resp);
					}
				}
			}
			else
			{
				resp.sendRedirect("index.jsp");
			}
			System.out.println("i am on CheckCookie page: "+email);
		}
		
	}
}
