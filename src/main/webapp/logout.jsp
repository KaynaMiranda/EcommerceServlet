<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    session.invalidate(); // Invalida a sessão
%>
<html>
<head>
    <title>Logout</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f9f9f9;
            color: #333;
            text-align: center;
            margin: 0;
            padding: 0;
        }

        h1 {
            font-size: 40px;
            color: #2c3e50;
            margin-top: 50px;
        }

        p {
            font-size: 18px;
            color: #7f8c8d;
            margin-top: 20px;
        }

        .button-container {
            margin-top: 30px;
        }

        .button-container a {
            display: inline-block;
            background-color: #3498db;
            color: white;
            padding: 15px 30px;
            font-size: 18px;
            text-decoration: none;
            border-radius: 5px;
            transition: background-color 0.3s;
        }

        .button-container a:hover {
            background-color: #2980b9;
        }
    </style>
</head>
<body>
    <h1>Você saiu com sucesso!</h1>
    <p>Obrigado por utilizar nosso sistema. Esperamos vê-lo novamente em breve.</p>
    <div class="button-container">
        <a href="index.jsp">Voltar ao Login</a>
    </div>
</body>
</html>
