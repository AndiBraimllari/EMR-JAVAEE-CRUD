<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page import="connect_sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="CSS/patient.css">
<link rel="stylesheet" href="CSS/new_patient.css">
<link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet">
<script type="text/javascript" src="jQuery/jquery.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Pacient i ri</title>
</head>
<body>
	<div class="header_div">
	<ul>
		<li class="search_patient_li"><a href="Firstee.jsp">Pacienti</a></li>
		<li class="new_patient_li"><a href="NewPatient.jsp">Pacient i ri</a></li>
		<li class="update_patient_li"><a href="UpdatePatient.jsp">Perditeso pacient</a></li>
		<li class="delete_patient_li"><a href="DeletePatient.jsp">Fshi pacient</a></li>
		<li>
			<form method="post">
				<input name="name_search" type="text" placeholder="Kerko nje pacient..." class="search_input"></input>
				<input class="submit_search" type="submit" value="Kerko"></input>
			</form>
		</li>
	</ul>
	</div>
	
	<form method="post" name="new_patient" action="NewPatient.jsp">
	<div class="new_patient"><% Connect_SQL connection1 = new Connect_SQL(); %>
	
		<div class="new_patient_name" align="center">
			<span>Emri: <input name="new_patient_name"></input></span>
		</div><hr/>
		
		<div class="new_patient_ag" align="center">
			<span class="new_patient_gender">Gjinia: <input name="new_patient_gender"></input></span>
			<span class="new_patient_age">Mosha: <input name="new_patient_age"></input></span>
		</div>
		<input class="create_patient_button" type="submit" value="Krijo" ></input>
	</div>
	</form>
	<%String patientName = request.getParameter("new_patient_name");
	int patientAge = -1;
	try{patientAge = Integer.parseInt(request.getParameter("new_patient_age"));}catch(Exception e){}
	String patientGender = request.getParameter("new_patient_gender");%>
	<% if(patientName != null && patientName != ""){ 
				if((connection1.insertPatient(patientName, patientAge, patientGender)))
					response.sendRedirect("Firstee.jsp");
			}
				%>
</body>
</html>