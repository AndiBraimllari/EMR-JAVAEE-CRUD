<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page import="connect_sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="CSS/patient.css">
<link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet">
<script type="text/javascript" src="jQuery/jquery.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Pacienti</title>
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
	<div class="patient"><% Connect_SQL connection = new Connect_SQL(); %>
	<%String[] patientFound = connection.searchPatient(request.getParameter("name_search")); %>
		<div class="patient_name" align="center">
			<span><%if(patientFound[1] != null) out.println(patientFound[1]); %></span>
		</div><hr/>
		
		
		
		<div class="patient_ag" align="center">
			<span class="patient_gender">Gjinia: <%if(patientFound[3] != null) out.println(patientFound[3]);%></span>
			<span class="patient_age">Mosha: <%if(patientFound[2] != null) out.println(patientFound[2]); %></span>
		</div>
	</div>
</body>
<div class="footer"></div>
</html>