<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../style/dashboard.css">
    <script defer src="../scripts/veiculos.js"></script>
    <link rel="shortcut icon" href="../imagens/FaviconDashboard.svg" type="image/x-icon">
    <title>Nome do Pedido | Varanda's Autopeças</title>
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

        <a href="singin.html" class="sair">Sair</a>
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
                    <h5 id="persona">João da Silva Souza Pacheco</h5>
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
						<h3>Alterar Veículo</h3>
					</div>
        			<div class="contentveiculos">
	        		</div>
        		</div>
        		<div class="contentgrid">
        			<h3>Editar Pedido</h3>
        			<div class="gridveiculo">
        				<div class="contentinput">
        					<label for="peca">Qual Peça será personalizada?</label>
        					<input type="text" required id="peca" value="Ex. Disco de Freio">
        				</div>
        				<div class="contentinput">
        					<label for="dimencoes">Quais as dimenções da Peça?</label>
        					<input type="text" required id="dimencoes" value="Ex. 40cm x 40cm">
        				</div>
        				<div class="contentinput">
        					<label for="cor">Qual a cor da Peça?</label>
        					<input type="text" required id="cor" value="Ex. Vermelho">
        				</div>
        			</div>
        			<div class="contentinput textarea">
        				<label for="descricao">Descrição</label>
        				<textarea id="descricao" required cols="30" rows="10" value="Descreva como a Peça será personalizada"></textarea>
        			</div>
        			<div class="submit">
        				<input type="submit" class="SolicitarSubmit" value="Alterar Pedido">
        			</div>
        		</div>
        	</form>

        </section>
    </main>
</body>
</html>