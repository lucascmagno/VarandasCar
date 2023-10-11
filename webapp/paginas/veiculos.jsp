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
    <title>Veículos | Varanda's Autopeças</title>
</head>
<body>
    <header class="menuLateral">
        <img src="../imagens/LogoDashboard.svg" alt="">

        <div class="servicos">
            <h2>Serviços</h2>
            <a href="dashboard.jsp" class="linkaction l1">Dashboard</a>
            <a href="personalizar.jsp" class="linkaction l2 ">Personalizar</a>
            <a href="#" class="linkaction l3 active">Veiculos</a>
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
                    <h5 id="persona"><%=user.getNome() %></h5>
                    <h6 id="member-status">Membro Gold</h6>
                </span>
                <span class="notifications">
                    <img src="../imagens/SinoIcon.svg" alt="">
                </span>
            </div>
        </div>
        <section id="innerpagina">
				<div class="contentgrid">
					<h3>Veículos Adicionados</h3>
					<div class="contentveiculos">
				<%
					if (listaVeiculos != null) {
				    for (Veiculo veiculo : listaVeiculos) {
				%>
						    
                <div class="veiculo">
				    <p class="montadora" style="margin-right: 5px;"><%= veiculo.getMontadora() %></p><br>
				    <p class="modelo" style="margin-right: 5px;"><%= veiculo.getModelo() %></p><br>
				    <p class="ano" style="margin-right: 50px;"><%= veiculo.getAno_fabrica() %></p>
				    <a href="../login/veiculo/apagarVeiculo.jsp?id_veiculo=<%= veiculo.getId_veiculo()%>"><img alt="" src="../imagens/delete.svg"></a>
				</div>

						<%
						    }
						} else {
						    out.println("A lista de veículos está vazia ou nula.");
						}
						%>
	        		</div>
	        		
				</div>
        	<form action="../login/veiculo/inserirVeiculo.jsp">
        		<div class="contentgrid">
        			<h3>Adicionar Veículo</h3>
        			<div class="gridveiculo">
	        			<div class="contentinput">
	        				<label for="montadora">Qual a montadora do Veículo?</label>
	        				<input type="text" required name="montadora" id="montadora" placeholder="Ex. Fiat">
	        			</div>
		        		<div class="contentinput">
		        			<label for="modelo">Qual o Modelo?</label>
		        			<input type="text" required name="modelo" id="modelo" placeholder="Ex. Uno">
		        		</div>
		        		<div class="contentinput">
		        			<label for="ano">Qual o Ano de Fabricação?</label>
		        			<input type="number" max="2024" min="1960" required name="ano" id="ano" placeholder="Digite o ano do veiculo" value="2023">
		        		</div>
        			
        		</div>
				<div class="submit">
        				<input type="submit" class="SolicitarSubmit" value="Adicionar Veículo">
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