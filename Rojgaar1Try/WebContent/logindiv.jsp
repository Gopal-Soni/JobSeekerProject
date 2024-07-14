<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>

<jsp:include page="/CheckCookie"></jsp:include>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<div class="row">
			<div class="col-md-3"></div>
			<div class="col-md-6">
				<div class="reg_div_design">
					<form action="login" method="post"><br>
						<h2 style="color: #DA6B64">Login Here</h2><br> 
						<input type="text" placeholder="Enter email" name="eml1" class="reglog_tf_design" /><br><br>
						<input type="password" placeholder="Enter Password" name="pas1" class="reglog_tf_design" /><br><br><br> 
						<input type="checkbox" name="rememberme1" value="rememberme" /> Remember Me <br><br>
						<input type="submit" value="Login" class="btn btn-primary" /><br> <br><br>
					</form>
				</div>
			</div>
			<div class="col-md-3"></div>
		</div>
</body>
</html>