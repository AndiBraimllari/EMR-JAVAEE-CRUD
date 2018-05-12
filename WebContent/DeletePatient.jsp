<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page import="connect_sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="CSS/patient.css">
<link rel="stylesheet" href="CSS/delete_patient.css">
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
	
	<form method="post" name="delete_patient" action="DeletePatient.jsp">
		<div class="delete_patient"><% Connect_SQL connection3 = new Connect_SQL(); %>
		<%String[] patientToDelete = connection3.searchPatient(request.getParameter("name_search"));
		String patientIDToDelete = patientToDelete[0];
		%>
		<div class="delete_patient_name" align="center">
			<span><%if(patientToDelete[1] != null) out.println(patientToDelete[1]);%> </span>
		</div><hr/>
		<div class="delete_patient_ag" align="center">
			<span class="delete_patient_gender">Gjinia: <%if(patientToDelete[3] != null) out.println(patientToDelete[3]);%></span>
			<span class="delete_patient_age">Mosha: <%if(patientToDelete[2] != null) out.println(patientToDelete[2]);%></span>
		</div>
		<input class="delete_patient_button" type="submit" value="Fshi" ></input>
	
		</div>
	</form>
	<%connection3.deletePatient(patientIDToDelete); %>
</body>
</html>