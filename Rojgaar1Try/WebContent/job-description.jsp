<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.gopal.conncetion.DBConnection"%>
<%@page import="java.sql.Connection"%>
<%@page import="jdk.internal.org.objectweb.asm.tree.TryCatchBlockNode"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	
<jsp:declaration>
    String jobid;
</jsp:declaration>

<jsp:scriptlet>
    String email=(String)session.getAttribute("session_email");
    
    jobid=request.getParameter("jid");
</jsp:scriptlet>
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
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
</head>
<body>
	<div class="container-fluid">
	 	<jsp:scriptlet>
			if(email == null ? email == null : email.trim().equals("null"))
			{
		</jsp:scriptlet>
		
		    <jsp:include page="header.jsp"></jsp:include>			
			
		<jsp:scriptlet>
			}
			else
			{
		</jsp:scriptlet>
				
				<jsp:include page="profileheader.jsp"></jsp:include>
				
		<jsp:scriptlet>		
			}
		</jsp:scriptlet>
		
		<jsp:include page="menubar.jsp"></jsp:include>


		<div class="row">
			<div class="col-md-3">
				<ul>
					<li><a href=""> Infosys </a></li>
					<li><a href=""> Wipro </a></li>
					<li><a href=""> IBM </a></li>
					<li><a href=""> Google </a></li>
					<li><a href=""> Microsoft </a></li>
				</ul>
			</div>
			<div class="col-md-6"
				style="background-color: #FEF1F0; margin-top: 10px">
				<div class="row">
					
					<jsp:scriptlet>
							
					</jsp:scriptlet>
						
					<jsp:scriptlet>
					   String id="", job_profile="", company="", experience="", description="", date1="",
					   time1="", salary="", no_of_openings="", job_location="", time_venue="", c_email="",
					   c_person_name="", c_person_profile="", c_phone_no="" ;
						try
						{
							Connection con = DBConnection.getConnect();
							PreparedStatement ps = con.prepareStatement("select * from jobs where id=?");
							ps.setString(1, jobid);
							ResultSet rs = ps.executeQuery();
							if(rs.next())
							{
								job_profile = rs.getString("job_profile");
								company = rs.getString("company");
								experience = rs.getString("experience");
								description = rs.getString("description");
								date1 = rs.getString("date1");
								time1 = rs.getString("time1");
								salary = rs.getString("salary");
								no_of_openings = rs.getString("no_of_openings");
								job_location = rs.getString("job_location");
								time_venue = rs.getString("time_venue");
								c_email = rs.getString("c_email");
								c_person_name = rs.getString("c_person_name");
								c_person_profile = rs.getString("c_person_profile");
								c_phone_no = rs.getString("c_phone_no");
							}
							
						}
						catch(Exception e)
						{
							e.printStackTrace();
						}
					</jsp:scriptlet>
							<table class="table">
							
								<tr>
									<td></td>
									<td></td>
									<td><b><jsp:expression>job_profile</jsp:expression></b><span style="font-size: 12px; color: #57111d; float: right;">(<jsp:expression>date1</jsp:expression> & <jsp:expression>time1</jsp:expression>)</span><br> </td>
								</tr>
								<tr>
									<td><span class="glyphicon glyphicon-home" style="font-size: 15px;"></span></td>
									<td><b> <span style="color: #57111d">Company :</span></b> </td>
									<td><jsp:expression>company</jsp:expression></b></td>
								</tr>
								<tr>
									<td><span class="glyphicon glyphicon-briefcase" ></span></td>
									<td><b><span style="color: #57111d">Experience :</span></b></td>
									<td><jsp:expression>experience</jsp:expression></td>
								</tr>
								<tr>
									<td><span class="glyphicon glyphicon-list-alt"></span></td>
									<td><b><span style="color: #57111d">Job Description :</span></b></td>
									<td><jsp:expression>description</jsp:expression></td>
								</tr>
								<tr>
									<td><span class="glyphicon glyphicon-usd"></span></td>
									<td><b><span style="color: #57111d">Salary :</span></b></td>
									<td><jsp:expression>salary</jsp:expression></td>
								</tr>
								<tr>
									<td> <span class="glyphicon glyphicon-map-marker"> </span></td>
									<td> <b><span style="color: #57111d">Location :</span></b></td>
									<td><jsp:expression>job_location</jsp:expression></td>
								</tr>
								<tr>
									<td><span class="glyphicon glyphicon-th"></span></td>
									<td><b><span style="color: #57111d">No. of Openings :</span></b></td>
									<td><jsp:expression>no_of_openings</jsp:expression></td>
								</tr>
								<tr>
									<td><span class="glyphicon glyphicon-send"></span></td>
									<td><b><span style="color: #57111d">Time/venue :</span></b></td>
									<td><jsp:expression>time_venue</jsp:expression></td>
								</tr>
								<tr>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                </tr>
								<tr>
									<td></td>
									<td></td>
									<td><b>Company Details</b></td>
								</tr>
															
								<tr>
                                    <td><span class="glyphicon glyphicon-object-align-bottom"></span></td>
                                    <td><b><span style="color: #57111d">Company Name :</span></b></td>
                                    <td><jsp:expression>company</jsp:expression></td>
                                </tr>
							
						    	<tr>
						    		<td><span class="glyphicon glyphicon-envelope"> </span></td>
						    		<td><b><span style="color: #57111d">Company Email :</span></b></td>
						    		<td><jsp:expression>c_email</jsp:expression></td>
						    	</tr>
						    	<tr>
						    		<td><span class="glyphicon glyphicon-user"></span></td>
						    		<td><b><span style="color: #57111d">Person Name :</span></b></td>
						    		<td><jsp:expression>c_person_name</jsp:expression>(<jsp:expression>c_person_profile</jsp:expression>)<br></td>
						    	</tr>
						    	<tr>
						    		<td><span class="glyphicon glyphicon-phone-alt"> </span></td>
						    		<td><b><span style="color: #57111d">Company phone Number :</span></b></td>
						    		<td><jsp:expression>c_phone_no</jsp:expression></td>
						    	</tr>
						    		<jsp:scriptlet>
						    			if(email == null ? email == null : email.trim().equals("null"))
						    			{
						    				</jsp:scriptlet>
						    									    				
						    			    <tr>
						    			    	<td></td>
						    			    	<td></td>
						    			    	<td><a href="login.jsp" class="btn btn-primary" >login to Apply</a></td>
						    			    </tr>			
						    			    						    				
						    			    <jsp:scriptlet>
						    			}
						    			else
						    			{
						    				Connection con1 = null;
						    				try
						    				{
						    					con1 = DBConnection.getConnect();
						    					PreparedStatement ps1 = con1.prepareStatement("select * from applied_jobs where email=? and jobid=?");
						    					ps1.setString(1, email);
						    					ps1.setString(2, jobid);
						    					ResultSet rs1 = ps1.executeQuery();
						    					if(rs1.next())
						    					{
						    					 </jsp:scriptlet>
						    							
						    						<tr>
							    						<td></td>
							    						<td></td>
								    					<td>
								    						<span style="color: Black; padding: 3px;">Already applied to this job</span><br>
								    						<form action="DeleteMyJobApplication" method="post">
								    							<input type="hidden" value="<jsp:expression>jobid</jsp:expression>" name="jobid" />
								    							<input type="submit" value="Delete this Application" class="btn btn-danger" />
								    						</form>				    						
								    					</td>
							    				    </tr>
						    						
						    						<jsp:scriptlet>
						    					}
						    					else
						    					{
						    						</jsp:scriptlet>
						    							
						    						<tr>
								    					<td></td>
								    					<td></td>
								    					<td>
								    						<form action="ApplyForJob" method="post">
								    						    <input type="hidden" value="<jsp:expression>jobid</jsp:expression>" name="jobid" />
								    							<input type="submit" value="Apply" class="btn btn-primary" />				    						
								    						</form>
								    					</td>
						    				        </tr>
						    						
						    						<jsp:scriptlet>
						    				    }
						    				}
						    				catch(Exception e3)
						    				{
						    					e3.printStackTrace();
						    				}
						    				</jsp:scriptlet>
				                            
				                            <jsp:scriptlet>
						    			}
						    				</jsp:scriptlet>
						    
					</table>
				</div>
			</div>
			<div class="col-md-3">
				<ul>
					<li><a href=""> Infosys </a></li>
					<li><a href=""> Wipro </a></li>
					<li><a href=""> IBM </a></li>
					<li><a href=""> Google </a></li>
					<li><a href=""> Microsoft </a></li>
				</ul>
			</div>
		</div>

		<jsp:include page="footer.jsp"></jsp:include>
	</div>
</body>
</html>