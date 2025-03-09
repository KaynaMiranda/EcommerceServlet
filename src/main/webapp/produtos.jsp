<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List, model.Produto" %>

<html>
<head>
    <title>Lista de Produtos</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
        /* Estilos CSS */
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

        .container {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            gap: 20px;
            margin-top: 20px;
        }

        .card {
            background: white;
            width: 300px;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
            text-align: center;
            transition: transform 0.3s;
        }

        .card:hover {
            transform: translateY(-5px);
        }

        .card h2 {
            font-size: 22px;
            color: #2c3e50;
            margin-bottom: 10px;
        }

        .card p {
            font-size: 16px;
            color: #7f8c8d;
            margin-bottom: 5px;
        }

        .preco {
            font-size: 18px;
            font-weight: bold;
            color: #27ae60;
            margin-top: 10px;
        }

        .btn-adicionar {
            display: inline-block;
            padding: 10px 15px;
            background-color: #3498db;
            color: white;
            border: none;
            border-radius: 5px;
            text-decoration: none;
            font-size: 14px;
            cursor: pointer;
            margin-top: 10px;
            transition: background-color 0.3s;
        }

        .btn-adicionar:hover {
            background-color: #2980b9;
        }

        .button-sair {
            display: inline-block;
            padding: 12px 20px;
            background-color: #e74c3c;
            color: white;
            border: none;
            border-radius: 5px;
            text-decoration: none;
            font-size: 16px;
            cursor: pointer;
            margin-top: 20px;
            transition: background-color 0.3s;
            position: fixed;
            top: 20px;
            left: 20px;
        }

        .button-sair:hover {
            background-color: #c0392b;
        }

        .btn-carrinho {
            position: fixed;
            bottom: 20px;
            right: 20px;
            background-color: #f1c40f;
            color: #333;
            padding: 15px 20px;
            font-size: 18px;
            font-weight: bold;
            text-decoration: none;
            border-radius: 50px;
            box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.2);
            transition: background-color 0.3s;
        }

        .btn-carrinho:hover {
            background-color: #f39c12;
        }

    </style>
</head>
<body>
    <h1>Lista de Produtos</h1>

    <div class="container">
        <%
            List<Produto> produtos = (List<Produto>) application.getAttribute("produtos");
            if (produtos != null && !produtos.isEmpty()) {
                for (Produto produto : produtos) {
        %>
            <div class="card">
                <h2><%= produto.getNome() %></h2>
                <p><%= produto.getDescricao() %></p>
                <p class="preco">R$ <%= produto.getPreco() %></p>
                <p>Estoque disponível: <%= produto.getQuantidade() %></p>

                <form action="carrinho" method="post" onsubmit="return showAlert()">
                    <input type="hidden" name="idProduto" value="<%= produto.getId() %>">
                    <input type="hidden" name="nomeProduto" value="<%= produto.getNome() %>">
                    <input type="hidden" name="descricaoProduto" value="<%= produto.getDescricao() %>">
                    <input type="hidden" name="precoProduto" value="<%= produto.getPreco() %>">

                    <!-- Select para escolher a quantidade -->
                    <label for="quantidadeProduto">Quantidade:</label>
                    <select name="quantidadeProduto" id="quantidadeProduto">
                        <% for (int i = 1; i <= produto.getQuantidade(); i++) { %>
                            <option value="<%= i %>"><%= i %></option>
                        <% } %>
                    </select>
                    <button type="submit" class="btn-adicionar">Adicionar ao Carrinho</button>
                </form>
            </div>

        <%
                }
            } else {
        %>
            <p>Nenhum produto cadastrado.</p>
        <% } %>

    </div>

    <script>
        function showAlert() {
            alert("Produto adicionado ao carrinho com sucesso!");
            return true;
        }
    </script>

    <a href="carrinho.jsp" class="btn-carrinho">🛒 Carrinho</a>
    <a href="logout.jsp" class="button-sair"><i class="fas fa-sign-out-alt"></i></a>
</body>
</html>
