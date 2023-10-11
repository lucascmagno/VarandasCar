<%@ page language="java" contentType="text/html; charset=UTF-8" 
	pageEncoding="UTF-8"%>
<%@ page import="dao.ClienteDAO" %>
<%@ page import="model.Cliente" %>
<% 
	boolean ok = false;

	Cliente novo = new Cliente();
	novo.setNome(request.getParameter("nome"));
	novo.setEmail(request.getParameter("email"));
	novo.setTelefone(request.getParameter("fone"));
	novo.setSenha(request.getParameter("senha"));
	
	ClienteDAO dao = new ClienteDAO();
	ok = dao.inserirUsuario(novo);
	if (ok){%>
	<script type="text/javascript">
		alert("Usuario cadastrado com sucesso");
		window.location.href = "../paginas/dashboard.jsp";
		
	</script>
	<%}else{%>
	<script type="text/javascript">
		alert("Erro ao cadastrar Usuario!!");
		window.location.href = "../singup.jsp";
	</script>
	<%}%>