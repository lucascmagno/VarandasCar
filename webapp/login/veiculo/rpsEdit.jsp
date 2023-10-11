<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="dao.*" %>
<%@page import="model.*" %>
<% 
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

	boolean ok = false;

	Veiculo editadoV = new Veiculo();
	Personaliza editadoA = new Personaliza();
	VeiculoDao editadoVDao = new VeiculoDao();
	PersonalizaDAO editadoADao = new PersonalizaDAO();
	
	editadoV.setId_veiculo(Integer.parseInt(request.getParameter("id")));
	editadoV.setId_cliente(id_cliente);
	editadoV.setMontadora(request.getParameter("montadora"));
	editadoV.setModelo(request.getParameter("modelo"));
	editadoV.setAno_fabrica(Integer.parseInt(request.getParameter("ano")));
	
	editadoA.setId_personaliza(editadoV.getId_veiculo());
	editadoA.setFk_veiculo(editadoV.getId_veiculo());
	editadoA.setPeca(request.getParameter("nome_peca"));
	editadoA.setDimensoes(request.getParameter("dimensoes"));
	editadoA.setCor(request.getParameter("cor"));
	editadoA.setObservacao(request.getParameter("descricao"));
	editadoA.setData_peca(request.getParameter("data"));
	
	out.println("id_personaliza: "+editadoA.getId_personaliza());
	out.println("<hr>");
	out.println("fk_veiculo: "+editadoA.getFk_veiculo());
	out.println("<hr>");
	out.println("peca: "+editadoA.getPeca());
	out.println("<hr>");
	out.println("dimensoes: "+editadoA.getDimensoes());
	out.println("<hr>");
	out.println("observacao: "+editadoA.getObservacao());
	out.println("<hr>");
	out.println("data_peca: "+editadoA.getData_peca());
	out.println("<hr>");
	
	if (editadoVDao.editarVeiculo(editadoV) && editadoADao.editarPeca(editadoA)){%>
		<script type="text/javascript">
			alert("Veículo Editado com Sucesso!")
			window.location.href = "../../paginas/personaliza.jsp""
		</script>
	<%}	else {%>
		<script type="text/javascript">
			alert("Ocorreu um erro ao editar o Veículo!!")
			window.location.href = "../../paginas/personaliza.jsp"
		</script>
	<%} %>