<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="model.Usuario" %>
<html>
<head>
    <title>Painel do Administrador</title>
    <link rel="stylesheet" type="text/css" href="styles.css">
</head>
<body>
    <h1>Painel do Administrador</h1>
    <p>Bem-vindo, <%= ((Usuario) session.getAttribute("usuarioLogado")).getUsername() %>!</p>

    <h2>Cadastrar Novo Produto</h2>
    <form action="produtos" method="post">
        Nome: <input type="text" name="nome" required/><br/>
        Descrição: <input type="text" name="descricao" required/><br/>
        Preço: <input type="text" name="preco" required/><br/>
        Quantidade: <input type="text" name="quantidade" required/><br/>
        <input type="submit" value="Cadastrar Produto"/>
    </form>

    <h2>Gerenciar Produtos</h2>
    <a href="produtos.jsp">Ver Produtos Cadastrados</a>
    <br/>
    <a href="logout.jsp">Sair</a>
</body>
</html>