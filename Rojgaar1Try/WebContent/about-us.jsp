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
<title>About us</title>
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

		
		<!--  -----------------------search job div start--- -->
		<div class="row">
			<div class="col-md-2"></div>
			<div class="col-md-8 job_search_div">
				<h3>About Job Portal</h3>				
			</div>
			<div class="col-md-2"></div>
		</div>
		<!-- ------------------------Search job div ends--------- -->
        
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
			<p>This is Job portal demo website description</p><br><br>
			
			<h2>Our Mission</h2>
			<ul>
				<li>This is demo</li>
				<li>This is demo</li>
				<li>This is demo</li>
				<li>This is demo</li>
			</ul><br><br>
			
			<h2>Our Core Values</h2>
			<p>This is our core values description paragraph</p>
			
			<h2>Our Team</h2>
			<p>This is demo paragraph for our team</p>
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

		<jsp:include page="footer.jsp"></jsp:include>
	</div>
</body>
</html>