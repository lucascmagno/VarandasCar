<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../style/style.css">
    <script defer src="../scripts/valida.js"></script>
    <script defer src="../scripts/email-v.js"></script>
    <link rel="shortcut icon" href="../imagens/favicon.svg" type="image/x-icon">
    <title>Criar Conta | Varanda's Autopeças</title>
</head>
<body class="body-login">
    <form id="formAddUsuer" action="controle/addUser.jsp">
        <div class="singup">
            <div class="header-form">
                <h3>Crie sua Conta</h3>
            </div>
            <label for="nomeup">
                Nome Completo
                <input type="text" required placeholder="Digite seu nome" onblur="ValidaNome()" name="nome" id="nomeup">
                <span class="ErroAlert" id="erro0"></span>
            </label>
            <label for="emailup">
                Email
                <input type="email" required placeholder="seuemail@exemplo.com" name="email" id="emailup">
                <span class="ErroAlert" id="erro1"></span>
            </label>
            <label for="foneup">
                Telefone
                <input type="tel" required placeholder="(xx) xxxxx-xxxx" oninput="ValidaFone()" name="fone" id="foneup">
                <span class="ErroAlert" id="erro2"></span>
            </label>
            
            <label for="senhaup" class="senha">
                Crie uma Senha
                <input type="password" required placeholder="Digite a senha" onblur="ValidaSenha()" name="senha" id="senhaup">
                <img src="../imagens/VerSenha.svg" class="IconSenha" onclick="VerSenha()">
                <span class="ErroAlert" id="erro3"></span>
            </label>
            <input type="submit" id="submitbtx" onclick="ValidaNovoUsuer()" value="Criar Conta"
            >
            <a href="singin.jsp">Já tenho uma Conta</a>
        </div>
    </form>
    <a href="index.html" class="close-login"><img src="../imagens/Close.svg" alt=""></a>
</body>
</html>