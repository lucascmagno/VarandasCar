<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="dao.ClienteDAO" %>
<%  
 	ClienteDAO d = new ClienteDAO();
 	
 	boolean ok = d.verificaCampo("email", request.getParameter("email"));

	if(ok){
%>
	{
		"name_disponibility":false
	}
<%} else {%>
	{
		"name_disponibility":true
	}
<%}%>