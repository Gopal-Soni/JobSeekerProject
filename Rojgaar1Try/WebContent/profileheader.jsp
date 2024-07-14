<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <jsp:scriptlet>
		String name = (String)session.getAttribute("session_name");
		String profile_pic = (String)session.getAttribute("session_profilepic");
	</jsp:scriptlet>
    
<!DOCTYPE html>
<jsp:include page="/CheckCookie"></jsp:include>
<html>
<head>
<meta charset="ISO-8859-1">
<title> Welcome : <jsp:expression> name </jsp:expression> </title>
</head>
<body>
	<div class="row header_bg">
		<div class="col-md-4">
			<a href="index.jsp">
				<img alt="" src="image/chillies.png" height="60" />
				<span class="logo_text_design">Job Portal</span>
			</a>
		</div>
		<div class="col-md-6">
			<span style="color: white"> <a href="profile.jsp" style="text-decoration: none; color: white; font-size: 18px;"><img alt="img doesn't fetch properly" src="profilepics/<jsp:expression>profile_pic</jsp:expression>" height="45" style="border-radius: 30px" />&nbsp;<jsp:expression> name </jsp:expression></a> </span>				
		</div>
		<div class="col-md-2">
			 <a href="Logout" class="hyperlinks_design"> Logout </a>		
		</div>			
	</div>
</body>
</html>