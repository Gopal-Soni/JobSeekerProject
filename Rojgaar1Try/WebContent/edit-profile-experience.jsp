<%@page import="com.gopal.conncetion.DBConnection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	
	<jsp:declaration>  
		String company="", location="", year="", job_title="", description="", id="";
	</jsp:declaration>
	
	<jsp:scriptlet>
		String name = (String) session.getAttribute("session_name");
		
	    id = request.getParameter("id");
		
		try
		{
			Connection con = DBConnection.getConnect();
			
			PreparedStatement ps = con.prepareStatement("select * from experience where id=?");
			ps.setString(1, id);
			ResultSet rs = ps.executeQuery();
			while(rs.next())
			{
				company=rs.getString("company");
				location=rs.getString("location");
				year=rs.getString("year");
				job_title=rs.getString("job_title");
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
        <script type="text/javascript">
        	function submitFunction(val)
        	{
        		if(val==='update')
        		{
        			document.editexpform.action="EditExperienceDetails";
        			document.action.submit();
        	    }
        		if(val==='delete')
        		{
        			document.editexpform.action="DeleteExperienceDetails";
        			document.action.submit();        			
        		}
        		
        	}
        </script>
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
					<h2>Edit Experience Details</h2>
						<b><jsp:expression> session.getAttribute("session_name")</jsp:expression></b> ( <jsp:expression> session.getAttribute("session_email") </jsp:expression>)<br><br>
						<form name="editexpform" method="post">
							<input type="hidden" value="<jsp:expression>id</jsp:expression>" name="id1" />
						    Company : <br> <input type="text" value="<jsp:expression>company</jsp:expression>" name="company1" placeholder="Company Name" class="textfield_design" /><br><br>
							Location : <br> <input type="text" value="<jsp:expression>location</jsp:expression>" name="location1" placeholder="Eg. Delhi" class="textfield_design"/><br><br>
 							Year : <br> <input type="text" value="<jsp:expression>year</jsp:expression>" name="year1" placeholder="Eg. 2001-2004" class="textfield_design"/><br><br>
 							Job Title : <br> <input type="text" value="<jsp:expression>job_title</jsp:expression>" name="job_title1" placeholder="Eg. Sr. Developer" class="textfield_design"/><br><br>
							Description : <br> <textarea name="description1" placeholder="Your certifications, Activities and Achievements" style="padding: 5px 10px; width: 300px; height: 100px; border-radius: 5px; border: 1px solid red;" ><jsp:expression>description</jsp:expression></textarea><br><br>  
							<input type="submit" value="Update Education" class="btn btn-danger" onclick="submitFunction('update')" />
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