<%@page import="com.gopal.conncetion.DBConnection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	
	<jsp:declaration>  
		String school="", degree="", year="", grade="", description="";
	</jsp:declaration>
	
	<jsp:scriptlet>
		String name = (String) session.getAttribute("session_name");
/*  		String city = (String) session.getAttribute("session_city");
	    String fields = (String) session.getAttribute("session_fields"); 
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
	    }  */ 
		
		String id = request.getParameter("id");
		
		try
		{
			Connection con = DBConnection.getConnect();
			
			PreparedStatement ps = con.prepareStatement("select * from education where id=?");
			ps.setString(1, id);
			ResultSet rs = ps.executeQuery();
			while(rs.next())
			{
				school=rs.getString("school");
				degree=rs.getString("degree");
				year=rs.getString("year");
				grade=rs.getString("grade");
				description=rs.getString("description");
			}
		}
		catch(Exception e)
		{
			
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
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js"></script>
        <title> Educational Details </title>
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
					<h2>Edit Educational Details</h2>
						<b><jsp:expression> session.getAttribute("session_name")</jsp:expression></b> ( <jsp:expression> session.getAttribute("session_email") </jsp:expression>)<br><br>
						<form action="EditEducationDetails" method="post">
								<input type="hidden" value="<jsp:expression>id</jsp:expression>" name="id1" />
						    School/College : <br> <input type="text" value="<jsp:expression>school</jsp:expression>" name="school1" placeholder="School/college" class="textfield_design" /><br><br>
							Degree : <br> <input type="text" value="<jsp:expression>degree</jsp:expression>" name="degree1" placeholder="Eg. Btec,BCA" class="textfield_design"/><br><br>
 							Year : <br> <input type="text" value="<jsp:expression>year</jsp:expression>" name="year1" placeholder="Eg. 2001-2004" class="textfield_design"/><br><br>
 							Grade : <br> <input type="text" value="<jsp:expression>grade</jsp:expression>" name="grade1" placeholder="Eg. 90" class="textfield_design"/>%<br><br>
							Description : <br> <textarea name="description1" placeholder="Your certifications, Activities and Achievements" style="padding: 5px 10px; width: 300px; height: 100px; border-radius: 5px; border: 1px solid red;" ><jsp:expression>description</jsp:expression></textarea><br><br>  
							<input type="submit" value="Update Education" class="btn btn-danger" />
							<input type="submit" value="Delete Education" class="btn btn-danger" />
						</form>	
					</div>
				</div>
			</div>
			<div class="col-md-2"> </div>
		</div>
        <jsp:include page="footer.jsp"></jsp:include>
    </body>
</html>