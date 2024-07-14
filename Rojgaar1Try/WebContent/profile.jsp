<%@page import="com.gopal.backend.PathDetails"%>
<%@page import="java.io.File"%>
<%@page import="com.gopal.conncetion.DBConnection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	
	<jsp:declaration>Connection con=null;</jsp:declaration>
	
	<jsp:scriptlet>
		String name = (String)session.getAttribute("session_name");
		String emaill = (String)session.getAttribute("session_email");
    	String gender = (String)session.getAttribute("session_gender");
     	String city = (String)session.getAttribute("session_city");
/*         String fields = (String)session.getAttribute("session_fields");
    	if(fields==null || fields.equals(""))
    	{
        	fields="--- Not Available ---";
    	}  */ 
    	String profile_pic = (String)session.getAttribute("session_profilepic");
    	String title = (String)session.getAttribute("session_title");
    	String skills = (String)session.getAttribute("session_skills"); 
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
        
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        
        <title> Welcome:<jsp:expression> name </jsp:expression> </title>
    </head>
    <body>
    	<jsp:include page="profileheader.jsp"></jsp:include>
		<jsp:include page="menubar.jsp"></jsp:include>
		
		<div class="row">
			<div class="col-md-2"> </div>
			<div class="col-md-8"> 
				<div class="row" style="border: 1px solid red; box-shadow: 0px 0px 2px red; border-radius: 3px">
					<div class="col-md-2">
						<a href="edit-profile-pic.jsp" style="font-size: 12px; float: right;"><span class="glyphicon glyphicon-pencil"></span></a>
						<img src="profilepics/<jsp:expression>profile_pic</jsp:expression>" height="150" style="border-radius: 100px"/>
					</div>
					<div class="col-md-10">
						<h3 style="color: #780221"><jsp:expression>name</jsp:expression><a href="edit-profile-about.jsp" style="font-size: 12px; float: right;"><span class="glyphicon glyphicon-pencil"></span></a> </h3>
					    <span class="profile_details_title">Title : </span> <jsp:expression>title</jsp:expression><br><br>
						<span class="profile_details_title">Skills : </span><jsp:expression>skills</jsp:expression><br><br> 
						<span class="profile_details_title">Gender : </span> <jsp:expression>gender</jsp:expression> <br><br>
					    <span class="profile_details_title">City : </span> <jsp:expression>city</jsp:expression> <br> <br>
					         
					</div> 
					
				 </div><br><br>
				 <div class="row" style="border: 1px solid red; box-shadow: 0px 0px 2px red; border-radius: 3px">
				 	<div class="col-md-12">
				 		<h4> Education Details <a href="add-profile-education.jsp" style="font-size: 12px; float: right;"><span class="glyphicon glyphicon-plus"></span></a> </h4>
				 		<jsp:scriptlet>
				 			String school="", degree="", grade="", year="", id="";
				 			String email=(String)session.getAttribute("session_email");
				 			
				 			
				 			try
				 			{
				 				con = DBConnection.getConnect();
				 				
				 				PreparedStatement ps = con.prepareStatement("select * from education where email=?");
				 				ps.setString(1, email);
				 				ResultSet rs = ps.executeQuery();
				 				while(rs.next())
				 				{
				 					school = rs.getString("school");
				 					degree = rs.getString("degree");
				 					grade = rs.getString("grade");
				 					year = rs.getString("year");
				 					id = rs.getString("id");
				 					
				 		</jsp:scriptlet>				 			
				 			
				 			<div class="row" style="background-color: #ffe6e6">
				 				<div class="col-md-2">&nbsp;&nbsp;&nbsp;&nbsp;<img src="image/school.png" height="70"></div>
				 				<div class="col-md-10">
				 					<a href="edit-profile-education.jsp?id=<jsp:expression>id</jsp:expression>" style="font-size: 12px; float: right"><span class="glyphicon glyphicon-pencil"></span></a>
				 					<b><span class="glyphicon glyphicon-home">&nbsp;</span><jsp:expression>school</jsp:expression><br></b>
				 					<span class="glyphicon glyphicon-book">&nbsp;</span><jsp:expression>degree</jsp:expression>&nbsp;&nbsp;<span style="color: #450e1c;">(<jsp:expression>year</jsp:expression>)</span><br>
				 					<span class="glyphicon glyphicon-file">&nbsp;</span><jsp:expression>grade</jsp:expression>%<br>
				 				</div>
				 			</div><br>
				 			
				 		<jsp:scriptlet>
				 				}
				 			}
				 			catch (Exception e) 
				 			{
				 				e.printStackTrace();
				 			}
				 			finally
				 			{
				 				try 
				 				{
				 					con.close();			 				
				 				} 
				 				catch (Exception e2)
				 				{
				 					e2.printStackTrace();
				 				}
				 			}
				 			
				 		</jsp:scriptlet>
				 	</div>
				 </div><br><br>
				 
				 <div class="row" style="border: 1px solid red; box-shadow: 0px 0px 2px red; border-radius: 3px">
				 	<div class="col-md-12">
				 		<h4> Experience Details <a href="add-profile-experience.jsp" style="font-size: 12px; float: right;"><span class="glyphicon glyphicon-plus"></span></a> </h4>
				 		<jsp:scriptlet>
				 			String company1="", location1="", jobtitle1="", year1="", id1="";
				 			
				 		
				 			try
				 			{
				 			    con = DBConnection.getConnect();
				 				
				 			    PreparedStatement ps = con.prepareStatement("select * from experience where email=?");
				 				ps.setString(1, email);
				 				ResultSet rs1 = ps.executeQuery();
				 				while(rs1.next())
				 				{
				 					id1 = rs1.getString("id");
				 					company1 = rs1.getString("company");
				 					location1 = rs1.getString("location");
				 					year1 = rs1.getString("year");
				 					jobtitle1 = rs1.getString("job_title");
				 					
				 		</jsp:scriptlet>				 			
				 			
				 			<div class="row" style="background-color: #ffe6e6">
				 				<div class="col-md-2"> &nbsp;&nbsp;&nbsp;&nbsp; <img src="image/school.png" height="70"></div>
				 				<div class="col-md-10">
				 					<a href="edit-profile-experience.jsp?id=<jsp:expression>id1</jsp:expression>" style="font-size: 12px; float: right"><span class="glyphicon glyphicon-pencil"></span></a>
				 					<b><span class="glyphicon glyphicon-home">&nbsp;</span><jsp:expression> company1 </jsp:expression><br></b>
				 					<span class="glyphicon glyphicon-book">&nbsp;</span><jsp:expression> location1 </jsp:expression>&nbsp;&nbsp;<span style="color: #450e1c;">(<jsp:expression> year1 </jsp:expression>)</span><br>
				 					<span class="glyphicon glyphicon-file">&nbsp;</span><jsp:expression> jobtitle1 </jsp:expression><br>
				 				</div>
				 			</div><br>
				 			
				 		<jsp:scriptlet>
				 				}
				 			}
				 			catch(Exception e)
				 			{
				 				out.println(e);
				 			}
				 			finally
				 			{
				 				try 
				 				{
				 					
				 					con.close();			 				
				 				} 
				 				catch (Exception e2)
				 				{
				 					e2.printStackTrace();
				 				}
				 			}
				 		</jsp:scriptlet>
				 	</div>
				 </div><br><br>
				 
				 <div class="row" style="border: 1px solid red; box-shadow: 0px 0px 2px red; border-radius: 3px">
				 	<div class="col-md-12">
				 		<h4> Resume Details </h4>
				 		<div class="row" style="background-color: #ffe6e6">
				 		<div class="col-md-12">
				 			<a href="upload-resume.jsp"><span class="glyphicon glyphicon-plus"></span> Upload Resume</a>
				 			<jsp:scriptlet>
				 			    String file_name = null;
				 				try
				 				{
				 					con = DBConnection.getConnect();
				 					PreparedStatement ps = con.prepareStatement("select * from resumes where email=?");
				 					ps.setString(1, email);
				 					ResultSet rs = ps.executeQuery();
				 					if(rs.next())
				 					{
				 						file_name = rs.getString("path");
				 						</jsp:scriptlet>
				 						 &nbsp; &nbsp; <a href="DownloadResume?fn=<jsp:expression>file_name</jsp:expression>" class="btn btn-success"> Download Resume </a>
				 			<jsp:scriptlet>
				 					}
				 				}
				 				catch(Exception e)
				 				{
				 					e.printStackTrace();
				 				}
				 			</jsp:scriptlet>
				 		</div>
				 	</div>
				 	<div class="row">
				 		<div class="col-md-12">
				 			<a href="resume-builder-details.jsp"><span class="glyphicon glyphicon-pencil"></span> Resume Builder</a>
				 			<jsp:scriptlet>
				 				File f = new File(PathDetails.RESUME_BUILDER_PATH+emaill);
				 				if(f.exists())
				 				{
				 			</jsp:scriptlet>
				 				&nbsp; &nbsp; <a href="DownloadResumeBuilder?fn=<jsp:expression>emaill</jsp:expression>" class="btn btn-success"> Download Resume </a>
				 			<jsp:scriptlet>
				 					
				 			
				 				}
				 			</jsp:scriptlet>
				 		</div>
				 	</div>
				 	</div>
				 	
				 </div><br><br>
				 
				 <div class="row"style="background-color: #d1bec3">
				 	<div class="col-md-2"> </div>
				 	<div class="col-md-8"> 
				 		<input type="submit" value="Follow" />
				 	</div>
				 	<div class="col-md-2"> </div>
				 </div>
			</div>
		</div>
        <jsp:include page="footer.jsp"></jsp:include>
    </body>
</html>