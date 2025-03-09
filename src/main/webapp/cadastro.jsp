<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List, model.Produto, model.Usuario" %>
<html>
<head>
    <title>Cadastrar Produto</title>
    <style>
        /* Resetando margens e padding */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Arial', sans-serif;
            background-color: #f4f7f6;
            color: #333;
            padding: 20px;
            text-align: center;
        }

        h1 {
            font-size: 36px;
            color: #2c3e50;
            margin-bottom: 20px;
        }

        p {
            font-size: 18px;
            color: #7f8c8d;
            margin-bottom: 40px;
        }

        form {
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            padding: 20px;
            width: 100%;
            max-width: 400px;
            margin: 0 auto;
        }

        form h2 {
            font-size: 24px;
            margin-bottom: 20px;
            color: #2c3e50;
        }

        label {
            display: block;
            text-align: left;
            margin: 10px 0 5px;
            font-weight: bold;
            color: #34495e;
        }

        input[type="text"] {
            width: 100%;
            padding: 10px;
            margin: 5px 0 15px;
            border: 1px solid #ccc;
            border-radius: 4px;
            font-size: 16px;
        }

        input[type="submit"] {
            width: 100%;
            padding: 12px;
            background-color: #3498db;
            color: white;
            border: none;
            border-radius: 4px;
            font-size: 18px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        input[type="submit"]:hover {
            background-color: #2980b9;
        }

        a {
            display: inline-block;
            margin-top: 15px;
            color: #3498db;
            text-decoration: none;
            font-size: 16px;
        }

        a:hover {
            text-decoration: underline;
        }

        .links-container {
            margin-top: 30px;
        }
    </style>
</head>
<body>

    <h1>Cadastrar Novo Produto</h1>
    <p>Bem-vindo, <%= ((Usuario) session.getAttribute("usuarioLogado")).getUsername() %>!</p>

    <form action="produtos" method="post" onsubmit="return showAlert()";>
        <h2>Cadastro de Produto</h2>

        <label for="nome">Nome:</label>
        <input type="text" name="nome" id="nome" required/>

        <label for="descricao">Descrição:</label>
        <input type="text" name="descricao" id="descricao" required/>

        <label for="preco">Preço:</label>
        <input type="text" name="preco" id="preco" required/>

        <label for="quantidade">Quantidade:</label>
        <input type="text" name="quantidade" id="quantidade" required/>

        <input type="submit" value="Cadastrar Produto"/>
    </form>

    <script>
        function showAlert() {
            alert("Produto cadastrando com sucesso!");
            return true;
        }
    </script>
       <div class="links-container">
           <a href="logout.jsp">Sair</a>
       </div>
   </body>
</html>