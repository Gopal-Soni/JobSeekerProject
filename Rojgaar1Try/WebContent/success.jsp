<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<jsp:include page="/CheckCookie"></jsp:include>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Success</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" />
<link rel="stylesheet" type="text/css" href="css/style.css" />
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"></script>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js"></script>
</head>
<body>
	<jsp:scriptlet>
		String message = (String)request.getAttribute("success_message");
	</jsp:scriptlet>
	<div class="alert alert-success alert-dismissible" style="text-align: center;" role="alert">
		<strong> Success : </strong> <jsp:expression>message</jsp:expression>
		<button type="button" class="close" data-dismiss="alert" aria-label="Close">
			<span aria-hidden="true">&times;</span></button>
	</div>
	
</body>
</html>