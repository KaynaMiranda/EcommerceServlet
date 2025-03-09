<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Login</title>
    <link rel="stylesheet" type="text/css" href="styles.css">

    <style>

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }

        .login-container {
            background-color: #fff;
            padding: 40px;
            border-radius: 8px;
            box-shadow: 0 2px 15px rgba(0, 0, 0, 0.1);
            width: 100%;
            max-width: 400px;
            text-align: center;
        }

        h1 {
            color: #333;
            margin-bottom: 20px;
        }

        input[type="text"],
        input[type="password"] {
            width: 100%;
            padding: 12px;
            margin: 10px 0;
            border: 1px solid #ccc;
            border-radius: 4px;
            font-size: 16px;
        }

        input[type="submit"] {
            background-color: #4CAF50;
            color: white;
            border: none;
            padding: 12px;
            cursor: pointer;
            border-radius: 4px;
            font-size: 16px;
            transition: background-color 0.3s;
            width: 100%;
        }

        input[type="submit"]:hover {
            background-color: #45a049;
        }

        .error-message {
            color: red;
            margin-top: 15px;
            font-size: 14px;
        }

        p {
            margin-top: 20px;
        }

        a {
            color: #007BFF;
            text-decoration: none;
            font-weight: bold;
        }

        a:hover {
            text-decoration: underline;
        }


    </style>

</head>
<body>
    <div class="login-container">
        <h1>Login</h1>
        <form action="login" method="post">
            <input type="text" name="username" placeholder="Nome de Usuário" required/>
            <input type="password" name="password" placeholder="Senha" required/>
            <input type="submit" value="Entrar"/>
        </form>
        <% if (request.getAttribute("erro") != null) { %>
            <div class="error-message"><%= request.getAttribute("erro") %></div>
        <% } %>
        <p style="text-align: center;">Não tem uma conta? <a href="cadastro.jsp">Cadastrar</a></p>
    </div>
</body>
</html>