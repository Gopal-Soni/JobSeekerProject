<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	
	<jsp:scriptlet>
		String name = (String) session.getAttribute("session_name");
		String city = (String) session.getAttribute("session_city");
	    /* String fields = (String) session.getAttribute("session_fields");  */
		String title = (String) session.getAttribute("session_title");
	    String gender = (String)session.getAttribute("session_gender");
	    String email = (String)session.getAttribute("session_email");
		if(title==null || title.equals(""))
		{
			title="";
		}
		String skills = (String) session.getAttribute("session_skills");
		if(skills==null || skills.equals(""))
	    {
			skills="";
	    }  
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
        <script type="text/javascript">
        	function changeGender()
        	{
        		document.getElementById('changegendertf').value = document.getElementById('changegender').value;
        	}
        	function changeCity()
        	{
        		document.getElementById('changecitytf').value = document.getElementById('changecity').value
        	}
        </script>
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
					<h2>Edit Personal Details</h2><br>
						<b><jsp:expression> session.getAttribute("session_name")</jsp:expression></b> ( <jsp:expression> session.getAttribute("session_email") </jsp:expression>)<br><br>
						<form action="EditProfileAbout" method="post">
						    <input type="text" value="<jsp:expression> email </jsp:expression>" class="textfield_design" readonly="readonly" /><br><br>
							<input type="text" value="<jsp:expression> name </jsp:expression>" name="name1" placeholder="Enter Name" class="textfield_design" /><br><br>
							<input type="text" value="<jsp:expression> title </jsp:expression>" name="title1" placeholder="Profile title" class="textfield_design"/><br><br>
 							<input type="text" value="<jsp:expression> city </jsp:expression>" name="city1" placeholder="Enter city" class="textfield_design" id="changecitytf" readonly="readonly"/>
 							<select onchange="changeCity()" id="changecity">
 								<option disabled="disabled">Select City</option>
 								<option value="Bangalore ">Bangalore</option>
							    <option value="Kochi">Kochi</option>
							    <option value="NCR">NCR</option>
								<option value="Mumbai">Mumbai</option>
								<option value="Chennai">Chennai</option>
								<option value="Pune">Pune</option>
								<option value="Hyderabad">Hyderabad</option>
								<option value="Jaipur">Jaipur</option>
								<option value="Kolkata">Kolkata</option>
								<option value="Indore">Indore</option>
								<option value="Ahmedabad">Ahmedabad</option>
								<option value="Chandigarh">Chandigarh</option>
 							</select><br><br>
 							<input type="text" value="<jsp:expression> gender </jsp:expression>" name="gender1" placeholder="Male/Female" class="textfield_design" id="changegendertf" readonly="readonly"/>
 							<select onchange="changeGender()" id="changegender">
 								<option disabled="disabled">Select Gender</option>
 								<option> Male </option>
 								<option> Female </option>
 							</select><br><br>
							<textarea placeholder="Skills(like: C, C++, Java)" name="skills1" style="padding: 5px 10px; width: 300px; height: 100px; border-radius: 5px; border: 1px solid red;" ><jsp:expression>skills</jsp:expression></textarea><br><br>  
							<input type="submit" value="Update" class="btn btn-danger" >
						</form>	
					</div>
				</div>
			</div>
			<div class="col-md-2"> </div>
		</div>
        <jsp:include page="footer.jsp"></jsp:include>
    </body>
</html>