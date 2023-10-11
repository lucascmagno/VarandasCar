<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dao.*" %>
<%@ page import="model.*" %>
<% 
	boolean ok = false;
	ClienteDAO login = new ClienteDAO();
	Cliente user = new Cliente();
	Integer id_cliente = (Integer) session.getAttribute("id_cliente");
	try{
		if (id_cliente == -1 || id_cliente == null){
			response.sendRedirect("../singin.jsp");
		} else {
			try {
				user = login.retornaUsuario(id_cliente);
				
			} catch (NullPointerException e) {
				 out.println("Erro");
			}
		}
	}catch (NullPointerException e) {
		response.sendRedirect("../singin.jsp");
	}
	
	
	if (request.getParameter("id_veiculo") != null){
		VeiculoDao delete = new VeiculoDao();
		ok = delete.apagarVeiculo(Integer.parseInt(request.getParameter("id_veiculo")));
	}
	
	if(ok){%>
	<script type="text/javascript">
		alert("Veículo Deletado com sucesso")
		window.location.href="../../paginas/veiculos.jsp"
	</script>
	
	<%} else {%>
	<script type="text/javascript">
		alert("Erro ao apagar Veículo")
		window.location.href="../../paginas/veiculos.jsp"
	</script>
	<%}%>