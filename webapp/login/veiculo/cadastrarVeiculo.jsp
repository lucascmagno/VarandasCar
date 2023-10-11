<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dao.*" %>
<%@ page import="model.*" %>
<% 
	VeiculoDao vdao = new VeiculoDao();
	Veiculo v = new Veiculo();
	
	Integer idCliente = (Integer) session.getAttribute("id_cliente");
	if (idCliente != null) {
	    v.setId_cliente(idCliente.intValue());
	} else {
	    %><script>
		alert("Realiza o login novamente para cadastrar veículos")
		window.location.href="../../paginas/veiculos.jsp";
		</script>
	<%
	}

	v.setMontadora(request.getParameter("montadora"));
	v.setModelo(request.getParameter("modelo"));
	v.setAno_fabrica(Integer.parseInt(request.getParameter("ano")));
	

	if (vdao.inserirVeiculo(v)){%>	
	<script>
		alert("Pedido cadastrado com sucesso")
		window.location.href="../../paginas/personalizar.jsp";
	</script>
	<%} else {%>
	<script type="text/javascript">
		alert("Ocorreu um erro ao inserir novo pedido")
		window.location.href="../../paginas/personalizar.jsp";
	</script>
		
	<%}%>