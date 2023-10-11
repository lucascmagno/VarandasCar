<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dao.*" %>
<%@ page import="model.*" %>
<%@ page import="java.util.ArrayList" %>
<% if (request.getParameter("id_veiculo") != null){
	int id_veiculo = Integer.parseInt(request.getParameter("id_veiculo"));
	
	Veiculo vei = new Veiculo ();
	Personaliza pec = new Personaliza();
	
	ArrayList<Object> vs = new ArrayList<Object>();
	ClienteDAO login = new ClienteDAO();
	Cliente user = new Cliente();
	Integer id_cliente = (Integer) session.getAttribute("id_cliente");
	try{
		if (id_cliente == -1 || id_cliente == null){
			response.sendRedirect("../../singin.jsp");
		} else {
			try {
				user = login.retornaUsuario(id_cliente);
				VeiculoDao v = new VeiculoDao();
				PersonalizaDAO a = new PersonalizaDAO();
				
				vei = v.VeiculoPorId(id_veiculo);
				pec = a.pecaPorVeiculo(id_veiculo);
				
			} catch (NullPointerException e) {
				 out.println("Erro");
			}
		}
	}catch (NullPointerException e) {
		response.sendRedirect("../../singin.jsp");
	}
%>    
<!DOCTYPE html>
<html lang="pt-br"><head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../../../src/dashboard.css">
    <script defer src="../../scripts/dashboard.js"></script>
    <link rel="shortcut icon" href="src/FaviconDashboard.svg" type="image/x-icon">
    <title>Veiculos | Varanda's Autopeças</title>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
	<script type="text/javascript" defer>
		function confirmDelete(){
		    if (confirm("Você quer realmente deletar este Veículo?")) {
			  window.location.href = "apagarVeiculo.jsp?id_veiculo=<%=id_veiculo%>";
			}
		}
	</script>
</head>
<body>
    <header class="menuLateral">
    	<a href="../../Pedidos.jsp"><span class="material-symbols-outlined" style="color:red;flex:wrap;">keyboard_double_arrow_left</span>&nbsp;<h2 class="sair">Voltar</h2></a>
        <img src="https://raw.githubusercontent.com/PedroMends30/img/main/LogoDashboard.svg" alt="">

        <div class="servicos">
            <h2>Serviços</h2>
            <a href="../../Pedidos.jsp" class="linkaction l1 active">Meus Pedidos</a>
            <a href="../../Personalizar.jsp" class="linkaction l2">Personalizar</a>
            <a href="../../Loja.jsp" class="linkaction l3">Loja</a>
            <a href="../../Conta.jsp" class="linkaction l4">Minha Conta</a>

        </div>

        <a href="../../../../Users/jsp/deslogar.jsp" class="sair">Sair</a>
    </header>
    <div class="alinhamento"></div>
    <main class="pagina">
		<div class="info">
			<h1 id="titulo">Editar Peça <img onclick="confirmDelete()" id="apagar" src="lixeira.svg"></h1>
						
			<div class="span-hight">
				<span class="profile">
					<h5 id="persona"><%=user.getNome() %></h5>
					<h6 id="member-status">Membro Gold</h6>
				</span> <span class="notifications"> <img src="src/SinoIcon.svg"
					alt="">
				</span>
			</div>
		</div>
		<section id="innerpagina">
			<form action="rpsEdit.jsp?id=<%=pec.getId_personaliza()%>" method="post">
				<div class="contentgrid">
					<h3>Veículo</h3>
					<div class="gridveiculo">
						<div class="contentinput">
							<label for="montadora">Editar Veículo</label>
							<input type="text" name="montadora" onblur="today()" required="" id="montadora" value="<%=vei.getMontadora()%>">
						</div>
						<div class="contentinput">
							<label for="modelo">Editar Modelo</label>
							<input type="text" name="modelo" required="" id="modelo" value="<%=vei.getModelo()%>">
						</div>
						<div class="contentinput">
							<label for="ano">Editar Ano de Lançamento</label>
							<input type="number" name="ano" max="2024" min="1960" required="" id="ano" placeholder="Digite o ano do veiculo" value="<%=vei.getAno_fabrica()%>">
						</div>
					</div>
				</div>
				<div class="contentgrid">
					<h3>Peça a ser Editada</h3>
					<div class="gridveiculo">
						<div class="contentinput">
							<label for="peca">Editar Nome</label>
							<input type="text" name="nome_peca" required="" id="peca" value="<%=pec.getPeca()%>">
						</div>
						<div class="contentinput">
							<label for="dimencoes">Editar Dimensões</label>
							<input type="text" name="volume" required="" id="dimencoes" value="<%=pec.getDimensoes()%>">
						</div>
						<div class="contentinput">
							<label for="cor">Editar Cor</label>
							<input type="color" name="cor" required="" id="cor" value="<%=pec.getCor()%>">
						</div>
					</div>
					<div class="contentinput textarea">
						<label for="descricao">Editar Descrição</label>
						<textarea id="descricao" name="descricao" required="" cols="30" rows="10" value="<%=pec.getObservacao()%>"></textarea>
					</div>
					<input type="hidden" id="data" name="data" value="<%=pec.getData_peca()%>">
					<div class="submit">
						<input type="hidden" name="id" value="<%=vei.getId_veiculo()%>">
						<input type="submit" class="SolicitarSubmit" value="Salvar Alterações">
					</div>
				</div>
			</form>
		</section>
    </main>


</body></html>
<% } else {
	response.sendRedirect("../../paginas/veiculos.jsp");
}%>