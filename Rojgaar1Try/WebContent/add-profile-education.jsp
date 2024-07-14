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
        <script type="text/javascript">
        	function submitFunction(val)
        	{
        		if(val ==='update')
        		{
        			document.editeduform.action="EditEducationDetails";
        			document.editeduform.submit();
        		}
        		if(val === 'delete')
        		{
        			document.editeduform.action="DeleteEducationDetails";
        			document.editeduform.submit();
        		}
        	}
        </script>
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
					<h1> Education Details </h1>
						<form name="editeduform" method="post">
						    <b><jsp:expression> session.getAttribute("session_name")</jsp:expression></b> ( <jsp:expression> session.getAttribute("session_email") </jsp:expression>)<br><br>
							School/College : <br> <input type="text" value="" name="school1" placeholder="School" class="textfield_design" /><br><br>
							Degree : <br> <input type="text" value="" name="degree1" placeholder="Eg. Btec,BCA" class="textfield_design"/><br><br>
 							Year : <br> <input type="text" value="" name="year1" placeholder="Eg. 2001-2004" class="textfield_design"/><br><br>
 							Grade : <br> <input type="text" value="" name="grade1" placeholder="Eg. 90" class="textfield_design"/>%<br><br>
							Description : <br> <textarea name="description1" placeholder="Your certifications, Activities and Achievements" style="padding: 5px 10px; width: 300px; height: 100px; border-radius: 5px; border: 1px solid red;" ></textarea><br><br>  
							<input type="submit" value="Add Education" class="btn btn-danger" onclick="submitFunction('update')" />
							<input type="submit" value="Delete Education" class="btn btn-danger" onclick="submitFunction('delete')" />
						</form>	
					</div>
				</div>
			</div>
			<div class="col-md-2"> </div>
		</div>
        <jsp:include page="footer.jsp"></jsp:include>
    </body>
</html>