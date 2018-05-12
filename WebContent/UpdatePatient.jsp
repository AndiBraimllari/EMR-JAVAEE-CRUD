<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page import="connect_sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="CSS/patient.css">
<link rel="stylesheet" href="CSS/update_patient.css">
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
	
	<form method="post" name="update_patient" action="UpdatePatient.jsp">
		<div class="update_patient"><% Connect_SQL connection2 = new Connect_SQL(); %>
		<%String[] patientToUpdate = connection2.searchPatient(request.getParameter("name_search"));
		  String patientIDToUpdate = patientToUpdate[0];
		%>
		<div class="update_patient_name" align="center">
			<span>Emri: <input name="update_patient_name" value="<%if(patientToUpdate[1] != null) out.println(patientToUpdate[1]);%>"></input></span>
		</div><hr/>
		<div class="update_patient_ag" align="center">
			<span class="update_patient_gender">Gjinia: <input name="update_patient_gender" value="<%if(patientToUpdate[3] != null) out.println(patientToUpdate[3]);%>"></input></span>
			<span class="update_patient_age">Mosha: <input name="update_patient_age" value="<%if(patientToUpdate[2] != null) out.println(patientToUpdate[2]);%>"></input></span>
		</div>
		<input id="update_patient_btn" class="update_patient_button" type="submit" value="Perditeso"></input>
	
		</div>
	</form>
	<%int PNA = -1;
	try{PNA = Integer.parseInt(request.getParameter("update_patient_age"));} catch(Exception e){}
	String PNN = request.getParameter("update_patient_name");
	String PNG = request.getParameter("update_patient_gender");
	//if(PNN != null && PNN != "")
		if(connection2.updatePatient(patientIDToUpdate, PNN, PNA, PNG))
			//response.sendRedirect("Firstee.jsp");
			%>
	<script>
		//document.getElementById("update_patient_btn").addEventListener("click", function(){
			//window.location.href = "Firstee.jsp";
			//});
	</script>
</body>
</html>