<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	
	<jsp:scriptlet>
		String name = (String)session.getAttribute("session_name");
	</jsp:scriptlet>
	<jsp:scriptlet>
		if(name==null || name.equals(""))
		{
			response.sendRedirect("login.jsp");
		}
	</jsp:scriptlet>
	
<!DOCTYPE html>
<jsp:include page="/CheckCookie"></jsp:include>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">        
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" />
        <link rel="stylesheet" type="text/css" href="css/style.css" />
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js"></script>
        <title> Profile Page </title>
    </head>
    <body>
    	<jsp:include page="profileheader.jsp"></jsp:include>
		<jsp:include page="menubar.jsp"></jsp:include>
		
		<div class="row">
			<div class="col-md-2"> </div>
			<div class="col-md-8"> 
				<div class="row" style="border: 1px solid red; box-shadow: 0px 0px 2px red; border-radius: 3px">
					<div class="col-md-2">
						<img alt="" src="image/chillies.png" height="100">
					</div>
					<div class="col-md-10">
					<h1> Experience Details </h1>
						<form action="AddExperienceDetails" method="post">
						    <b><jsp:expression> session.getAttribute("session_name")</jsp:expression></b> ( <jsp:expression> session.getAttribute("session_email") </jsp:expression>)<br><br>
							Company : <br> <input type="text" value="" name="company1" placeholder="Eg. Apple" class="textfield_design" /><br><br>
							Location : <br> <input type="text" value="" name="location1" placeholder="Eg. Noida" class="textfield_design"/><br><br>
 							Year : <br> <input type="text" value="" name="year1" placeholder="Eg. 2001-2004" class="textfield_design"/><br><br>
 							Title : <br> <input type="text" value="" name="jobtitle1" placeholder="Eg. Jr. Java Developer" class="textfield_design"/><br><br>
							Description : <br> <textarea name="description1" placeholder="Your certifications, Activities , Achievements and project" style="padding: 5px 10px; width: 300px; height: 100px; border-radius: 5px; border: 1px solid red;" ></textarea><br><br>  
							<input type="submit" value="Add Experience" class="btn btn-danger" >
						</form>	
					</div>
				</div>
			</div>
			<div class="col-md-2"> </div>
		</div>
        <jsp:include page="footer.jsp"></jsp:include>
    </body>
</html>