<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List, model.Produto" %>
<%@ page import="model.Carrinho" %>

<html>
<head>
    <title>Carrinho de Compras</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&family=Open+Sans:wght@300;400;600&display=swap" rel="stylesheet"> <!-- Fontes -->

    <style>
        body {
            font-family: 'Roboto', sans-serif;
            background-color: #f4f4f9;
            margin: 0;
            padding: 0;
        }

        h1 {
            text-align: center;
            font-size: 36px;
            font-weight: 700;
            color: #333;
            margin-top: 30px;
        }

        .container {
            display: flex;
            flex-direction: column;
            align-items: center;
            margin-top: 20px;
            width: 80%;
            margin: 0 auto;
        }

        .card {
            background: #ffffff;
            width: 100%;
            max-width: 500px;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0px 8px 16px rgba(0, 0, 0, 0.1);
            margin-bottom: 15px;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }

        .card:hover {
            transform: translateY(-5px);
            box-shadow: 0px 12px 24px rgba(0, 0, 0, 0.1);
        }

        .preco {
            font-size: 20px;
            font-weight: 600;
            color: #27ae60;
        }

        .quantidade {
            font-size: 16px;
            color: #777;
            margin-top: 10px;
        }

        .btn-remover,
        .btn-finalizar,
        .btn-continuar {
            font-size: 16px;
            font-weight: 500;
            padding: 12px 20px;
            border-radius: 8px;
            border: none;
            cursor: pointer;
            transition: background-color 0.3s ease, transform 0.2s ease;
            text-decoration: none;
            display: inline-block;
            text-align: center;
            width: 100%;
            max-width: 200px;
            margin-top: 10px;
        }

        .btn-remover {
            background-color: #e74c3c;
            color: white;
        }

        .btn-remover:hover {
            background-color: #c0392b;
            transform: scale(1.05);
        }

        .btn-finalizar {
            background-color: #2ecc71;
            color: white;
        }

        .btn-finalizar:hover {
            background-color: #27ae60;
            transform: scale(1.05);
        }

        .btn-continuar {
            background-color: #3498db;
            color: white;
        }

        .btn-continuar:hover {
            background-color: #2980b9;
            transform: scale(1.05);
        }

        .total {
            font-size: 24px;
            font-weight: 700;
            color: #333;
            margin-top: 30px;
            display: flex;
            justify-content: space-between;
            width: 100%;
            max-width: 500px;
        }

        .total p {
            margin: 0;
        }

        /* Estilos de Responsividade */
        @media (max-width: 768px) {
            .container {
                width: 95%;
            }

            .card {
                width: 100%;
            }

            .total {
                flex-direction: column;
                align-items: center;
            }

            .btn-remover,
            .btn-finalizar,
            .btn-continuar {
                width: 100%;
                max-width: none;
            }
        }
    </style>
</head>
<body>

    <h1>Carrinho de Compras</h1>

    <div class="container">
        <%
            // Obtém o carrinho da sessão
            Carrinho carrinho = (Carrinho) session.getAttribute("carrinho");
            if (carrinho != null && !carrinho.getProdutos().isEmpty()) {
                List<Produto> produtos = carrinho.getProdutos();
                for (Produto produto : produtos) {
        %>
            <div class="card">
                <h3><%= produto.getNome() %></h3>
                <p><%= produto.getDescricao() %></p>
                <p class="preco">R$ <%= produto.getPreco() %></p>
                <p class="quantidade">Quantidade: <%= produto.getQuantidade() %></p>
                <a href="carrinho?carrinhoAction=remover&idProduto=<%= produto.getId() %>" class="btn-remover">Remover</a>
            </div>
        <%
                }
            } else {
        %>
            <p>Seu carrinho está vazio.</p>
        <% } %>

        <div class="total">
            <p>Total: R$ <%= carrinho != null ? carrinho.calcularTotal() : 0 %></p>
        </div>

        <!-- Botão de Finalizar Compra -->
        <form method="POST" action="carrinho">
            <input type="hidden" name="acao" value="finalizarCompra">
            <button type="submit" class="btn-finalizar" onclick="return finalizarCompra()">Finalizar Compra</button>
        </form>

        <!-- Botão de Continuar Comprando -->
        <a href="produtos.jsp" class="btn-continuar">Continuar Comprando</a>
    </div>

    <script>
        function finalizarCompra() {
            // Fazendo uma requisição para o servidor para limpar o carrinho
            fetch('finalizarCompra', {
                method: 'POST', // Método POST para remover o carrinho
            })
            .then(response => {
                if (response.ok) {
                    // Redireciona para a página de produtos após a compra ser finalizada
                    window.location.href = 'produtos.jsp';
                } else {
                    alert('Erro ao finalizar compra.');
                }
            })
            .catch(error => {
                console.error('Erro ao fazer a requisição:', error);
            });
        }
    </script>

</body>
</html>
