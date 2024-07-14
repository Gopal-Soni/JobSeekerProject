<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.gopal.conncetion.DBConnection"%>
<%@page import="java.sql.Connection"%>
<%@page import="jdk.internal.org.objectweb.asm.tree.TryCatchBlockNode"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	
<!DOCTYPE html>
	<jsp:include page="/CheckCookie"></jsp:include>
	<jsp:scriptlet>
		String email = (String)session.getAttribute("session_email");
	</jsp:scriptlet>
	
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" />
<link rel="stylesheet" type="text/css" href="css/style.css" />
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
</head>
<body>
	<div class="container-fluid">
	 	<jsp:scriptlet>
			if(email == null ? email == null : email.trim().equals("null"))
			{
		</jsp:scriptlet>
		
		    <jsp:include page="header.jsp"></jsp:include>			
			
		<jsp:scriptlet>
			}
			else
			{
		</jsp:scriptlet>
				
				<jsp:include page="profileheader.jsp"></jsp:include>
				
		<jsp:scriptlet>		
			}
		</jsp:scriptlet>
		
		<jsp:include page="menubar.jsp"></jsp:include>

		
        
		<div class="row">
			<div class="col-md-3">
				<ul>
					<li><a href=""> Infosys </a></li>
					<li><a href=""> Wipro </a></li>
					<li><a href=""> IBM </a></li>
					<li><a href=""> Google </a></li>
					<li><a href=""> Microsoft </a></li>
				</ul>
			</div>
			<div class="col-md-6" style="background-color: #FEF1F0; margin-top: 10px">
					<jsp:scriptlet>
						if(email == null ? email == null : email.trim().equals("null"))
						{
					</jsp:scriptlet>
							<jsp:include page="contact-us-nouser.jsp"></jsp:include>
					<jsp:scriptlet>
						}
						else
						{
					</jsp:scriptlet>
							<jsp:include page="contact-us-user.jsp"></jsp:include>
					<jsp:scriptlet>
						}
					</jsp:scriptlet>
			</div>
			<div class="col-md-3">
				<ul>
					<li><a href=""> Infosys </a></li>
					<li><a href=""> Wipro </a></li>
					<li><a href=""> IBM </a></li>
					<li><a href=""> Google </a></li>
					<li><a href=""> Microsoft </a></li>
				</ul>
			</div>
		</div>
		
		<div class="row">
			<div class="col-md-2"></div>
			<div class="col-md-8"><iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d14156.541379935741!2d77.46657364999999!3d27.49616595!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x39730e7d151ec199%3A0x9831b65b6fd8bd36!2sGovardhan%2C%20Uttar%20Pradesh!5e0!3m2!1sen!2sin!4v1713350170466!5m2!1sen!2sin" width="100%" height="300" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe></div>
			<div class="col-md-2"></div>

		
		</div>

		<jsp:include page="footer.jsp"></jsp:include>
	</div>
</body>
</html>