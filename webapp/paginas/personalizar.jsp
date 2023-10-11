<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="dao.*" %>
<%@ page import="model.*" %>
 
<%
    ArrayList<Veiculo> listaVeiculos = null; // Declare a variável fora do bloco try
    VeiculoDao vdao = new VeiculoDao();
    
    ClienteDAO login = new ClienteDAO();
    Cliente user = new Cliente();
    Integer id_cliente = (Integer) session.getAttribute("id_cliente");
    try {
        if (id_cliente == -1 || id_cliente == null) {
            response.sendRedirect("../login/singin.jsp");
        } else {
            try {
                user = login.retornaUsuario(id_cliente);
                listaVeiculos = vdao.veiculosUser(id_cliente); 
            } catch (NullPointerException e) {
                out.println("Erro ao acessar os dados do veículo.");
            }
        }
    } catch (NullPointerException e) {
        response.sendRedirect("../login/singin.jsp");
    }
%>

<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../style/dashboard.css">
    <link rel="shortcut icon" href="../imagens/FaviconDashboard.svg" type="image/x-icon">
    <title>Personalizar | Varanda's Autopeças</title>
</head>
<body>
    <header class="menuLateral">
        <img src="../imagens/LogoDashboard.svg" alt="">

        <div class="servicos">
            <h2>Serviços</h2>
            <a href="dashboard.jsp" class="linkaction l1">Dashboard</a>
            <a href="#" class="linkaction l2 active">Personalizar</a>
            <a href="veiculos.jsp" class="linkaction l3">Veículos</a>
            <a href="conta.jsp" class="linkaction l4">Minha Conta</a>

        </div>

        <a href="../login/controle/deslogar.jsp" class="sair">Sair</a>
    </header>
    <div class="alinhamento"></div>
    <main class="pagina">
        <div class="info">
            <form action="" class="search-bar" method="get">
                <img src="../imagens/Search.svg" class="search-icon" alt="">
                <input type="search" name="serach" id="serach" placeholder="Buscar por Veículos, Peças e mais..." id="">
            </form>
            <div class="span-hight">
                <span class="profile">
                    <h5 id="persona"><%=user.getNome()%></h5>
                    <h6 id="member-status">Membro Gold</h6>
                </span>
                <span class="notifications">
                    <img src="../imagens/SinoIcon.svg" alt="">
                </span>
            </div>
        </div>
        <section id="innerpagina">
        	<form action="#">
        		<div class="contentgrid">
        			<div class="contentbutton">
						<h3>Veículos</h3>
						<a href="veiculos.jsp" class="addveiculo"><img src="../imagens/AdicionarVeiculo.svg" alt="">Adicionar Veículo</a>
					</div>
        			<div class="contentveiculos">
        			<%
					if (listaVeiculos != null) {
				    for (Veiculo veiculo : listaVeiculos) {
				%>
						    
                <div class="veiculo">
				    <p class="montadora" style="margin-right: 5px;"><%= veiculo.getMontadora() %></p><br>
				    <p class="modelo" style="margin-right: 5px;"><%= veiculo.getModelo() %></p><br>
				    <p class="ano" style="margin-right: 5px;"><%= veiculo.getAno_fabrica() %></p>
				    
				</div>

						<%
						    }
						} else {
						    out.println("A lista de veículos está vazia ou nula.");
						}
						%>
	        		</div>
        		</div>
        		<div class="contentgrid">
        			<h3>Peça a ser Personalizada</h3>
        			<div class="gridveiculo">
        				<div class="contentinput">
        					<label for="peca">Qual Peça será personalizada?</label>
        					<input type="text" required id="peca" placeholder="Ex. Disco de Freio">
        				</div>
        				<div class="contentinput">
        					<label for="dimencoes">Quais as dimenções da Peça?</label>
        					<input type="text" required id="dimencoes" placeholder="Ex. 40cm x 40cm">
        				</div>
        				<div class="contentinput">
        					<label for="cor">Qual a cor da Peça?</label>
        					<input type="text" required id="cor" placeholder="Ex. Vermelho">
        				</div>
        			</div>
        			<div class="contentinput textarea">
        				<label for="descricao">Descrição</label>
        				<textarea id="descricao" required cols="30" rows="10" placeholder="Descreva como a Peça será personalizada"></textarea>
        			</div>
        			<div class="submit">
        				<input type="submit" class="SolicitarSubmit" value="Solicitar Orçamento">
        			</div>
        		</div>
        	</form>

        </section>
    </main>
 <script>
    // Função para filtrar os veículos com base no texto de pesquisa
    function filtrarVeiculos() {
        var input = document.getElementById('serach');
        var filtro = input.value.toLowerCase(); // Converter para minúsculas para tornar a pesquisa insensível a maiúsculas e minúsculas
        var veiculos = document.querySelectorAll('.veiculo'); // Selecionar todos os elementos de veículo

        veiculos.forEach(function (veiculo) {
            var montadora = veiculo.querySelector('.montadora').textContent.toLowerCase();
            var modelo = veiculo.querySelector('.modelo').textContent.toLowerCase();
            var ano = veiculo.querySelector('.ano').textContent.toLowerCase();

            // Verificar se o texto de pesquisa corresponde a qualquer parte das informações do veículo
            if (montadora.includes(filtro) || modelo.includes(filtro) || ano.includes(filtro)) {
                veiculo.style.display = 'flex'; // Mostrar o veículo
            } else {
                veiculo.style.display = 'none'; // Ocultar o veículo
            }
        });
    }

    // Adicione um ouvinte de eventos para chamar a função de filtragem sempre que o usuário digitar na barra de pesquisa
    document.getElementById('serach').addEventListener('keyup', filtrarVeiculos);
</script>
</body>
</html>