package com.gopal.backend;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class Logout extends HttpServlet 
{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
	{
		Cookie[] ck = req.getCookies();
		for(Cookie cookie: ck)
		{
			cookie.setMaxAge(0);
			resp.addCookie(cookie);
		}
		HttpSession session = req.getSession();
		session.invalidate();
		
		resp.sendRedirect("login.jsp");
	}
}
