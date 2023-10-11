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
    <link rel="shortcut icon" href="../imagens/favicon.svg" type="image/x-icon">
    <title>Login | Varanda's Autopeças</title>
</head>
<body class="body-login">
    <div class="imglogin hiddem-pocket">
        <img src="../imagens/Supra.png" alt="">
    </div>
    <form action="controle/logar.jsp">
        <div class="singin">
            <div class="header-form">
                <h3>Entrar</h3>
                <h2>Faça login com seu email e senha</h2>
            </div>
            <label for="emailin">
                Seu Email
                <input type="email" required placeholder="Digite seu email"  name ="emailin" id="emailin">
            </label>
            <label for="senhain" class="senha">
                Senha
                <input type="password" required placeholder="Digite sua senha" name="senhain" id="senhain" >
            </label>
            <input type="submit" value="Entrar">
            <a href="singup.jsp">Crie uma Conta</a>
        </div>
    </form>
    <a href="../index.html" class="close-login"><img src="../imagens/Close.svg" alt=""></a>
</body>
</html>