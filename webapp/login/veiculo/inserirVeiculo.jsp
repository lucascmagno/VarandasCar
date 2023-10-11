<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dao.*" %>
<%@ page import="model.*" %>
<% 
	VeiculoDao vdao = new VeiculoDao();
	Veiculo v = new Veiculo();
	PersonalizaDAO adao = new PersonalizaDAO();
	Personaliza auto = new Personaliza();
	
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
	
	auto.setPeca(request.getParameter("peca"));
	auto.setFk_veiculo((vdao.idVeiculoAutoPeca()));
	auto.setData_peca(request.getParameter("data"));
	auto.setCor(request.getParameter("cor"));
	auto.setDimensoes(request.getParameter("dimensoes"));
	auto.setObservacao(request.getParameter("observacao"));

	if (vdao.inserirVeiculo(v) && adao.inserirPeca(auto)){%>	
	<script>
		alert("Pedido cadastrado com sucesso")
		window.location.href="../../paginas/veiculos.jsp";
	</script>
	<%} else {%>
	<script type="text/javascript">
		alert("Carro cadastrado com sucesso")
		window.location.href="../../paginas/veiculos.jsp";
	</script>
		
	<%}%>