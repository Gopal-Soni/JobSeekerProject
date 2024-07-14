<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<jsp:include page="/CheckCookie"></jsp:include>
<jsp:scriptlet>
	String name1 = (String)session.getAttribute("session_name");
	String email1 = (String)session.getAttribute("session_email");
</jsp:scriptlet>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<div class="reg_div_design">
		<form action="ContactUs" method="post"><br>
			<h2 style="color: #DA6B64">Contact Us</h2><br> 
			<input type="text" placeholder="Enter Name" name="name1" value="<jsp:expression>name1</jsp:expression>" class="reglog_tf_design" readonly="readonly" /><br><br>
			<input type="text" placeholder="Enter email" name="email1" value="<jsp:expression>email1</jsp:expression>" class="reglog_tf_design" readonly="readonly" /><br><br>
			<input type="text" placeholder="Enter Subject" name="subject1" class="reglog_tf_design" /><br><br>
			<textarea placeholder="Enter Message" name="message1" style="padding: 5px 10px; width: 350px; border-radius: 5px; border: 1px solid red;"></textarea><br>
			<input type="submit" value="Submit" class="btn btn-primary" /><br> <br><br>
		</form>
	</div>
</body>
</html>