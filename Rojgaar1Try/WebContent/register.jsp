<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<jsp:include page="/CheckCookie"></jsp:include>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" />
<link rel="stylesheet" type="text/css" href="css/style.css" />
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js"></script>
<script>
	function val(v) 
	{
		document.getElementById(v).innerHTML="";		
	}
	function validation()
	{
		/* alert("yes, Programm is working properly"); */
		var flag=true;
		var name2 = document.regform.name1.value;
		var email2 = document.regform.email1.value;
		var pass2 = document.regform.pass1.value;
		var gender2 = document.regform.gender1.value;
		var fields2 = document.regform.field1.value;
		var city2 = document.regform.city1.value;
		
		var name_pattern = /^[a-zA-Z ]{3,30}$/;
		var email_pattern = /^([a-zA-Z0-9])(([a-zA-Z0-9])*([\._\+-])*([a-zA-Z0-9]))*@(([a-zA-Z0-9\-])+(\.))+([a-zA-Z]{2,4})+$/;
		var password_pattern = /^(?=.*[0-9])(?=.*[!@#$%^&*])[a-zA-Z0-9!@#$%^&*]{6,16}$/;
		
		
		
		if(!name2.match(name_pattern))
		{
			document.getElementById('name_error').innerHTML="Name is not properly formated";
			flag=false;
		}
		if(name2==="")
		{
			document.getElementById('name_error').innerHTML="Name cannot be empty";
			flag=false;
		}
		
		if(!email2.match(email_pattern))
		{
			document.getElementById('email_error').innerHTML="Email is not properly formated";
			flag=false;
		}
		if(email2==="")
		{
			document.getElementById('email_error').innerHTML="Email cannot be empty";
			flag=false;
		}
		
		if(!pass2.match(password_pattern))
		{
			document.getElementById('password_error').innerHTML="Password is not properly formated(should contain special characters and symbols and numbers)";
			flag=false;
		}
		if(pass2==="")
		{
			document.getElementById('password_error').innerHTML="password cannot be empty";
			flag=false;
		}
		/* if(gender2==="")
		{
			document.getElementById('gender_error').innerHTML="Please select Gender";
			flag=false;
		} */
		
 		/* if(fields2==="")
		{
			document.getElementById('fields_error').innerHTML="Please select fields";
			flag=false;
		}  */
		if(city2==="")
		{
			document.getElementById('city_error').innerHTML="Please select city";
			flag=false;
		}
		return flag;
			
		
		/* if(name2==="")
		{
			alert("Name cannot be empty");
			document.getElementById('name-error').innerHTML="Name cannot be empty";
			return false;			
		}
		else if(email2==="")
		{
			alert("Email cannot be empty");
			return false;
		}
		else if(pass2==="")
		{
			alert("password cannot be empty");
			return false;
		}
		else if(gender2==="")
		{
			alert("Please select the gender");
			return false;
		}
	    else if(fields2==="")
		{
			alert("Please select atleast one field ");
			return false;
		}
		else if(city2==="Select City")
		{
			alert("Please select the city");
			return false;
		}
		else
		{
			document.regform.action="reg";
			document.regform.submit();
		} */
	}
</script>
</head>
<body>
	<div class="container-fluid">
		<jsp:include page="header.jsp"></jsp:include>
		<jsp:include page="menubar.jsp"></jsp:include>
		<br> <br> <br>
		<div class="row">
			<div class="col-md-3"></div>
			<div class="col-md-6">
				<div class="reg_div_design">
					<form method="post" name="regform" onsubmit="return validation()" action="reg"><br>
						<h2 style="color: #DA6B64">Register Here</h2><br>
						<input type="text" placeholder="Enter Name" name="name1" class="reglog_tf_design" onkeyup="val('name_error')"/> <br> <span id="name_error" style="color: red"></span> <br><br> 
						<input type="text" placeholder="Enter Email" name="email1" class="reglog_tf_design" onkeyup="val('email_error')"/> <br> <span id="email_error" style="color: red"></span> <br><br>
						<input type="password" placeholder="Enter Password" name="pass1" class="reglog_tf_design" onkeyup="val('password_error')"/> <br> <span id="password_error" style="color: red"></span> <br><br>
						<b>Select Gender : </b> <input type="radio" name="gender1" value="Male"	style="color: red;"/>Male 
						<input type="radio" name="gender1" value="Female" />Female <br><span id="gender_error" style="color: red"></span><br><br> 
						<b>Select Fields : </b> <input type="checkbox" name="field1" value="Information Technology" /> Information Technology <br>
						<input type="checkbox" name="field1" value="Marketing" />
						Marketing <input type="checkbox" name="field1" value="Finance" />
						Finance <span id="fields_error" style="color: red"></span><br><br> 
						<select name="city1" class="reglog_tf_design">
							<option>Select City</option>
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
						</select><br><span id="city_error" style="color: red"></span><br><br> 
						<input type="submit" value="Register" class="btn btn-primary" /><br><br><br><br>
					</form>
				</div>
			</div>
			<div class="col-md-3"></div>
		</div>
		<br> <br> <br> <br> <br> <br> <br>
		<jsp:include page="footer.jsp"></jsp:include>
	</div>
</body>
</html>