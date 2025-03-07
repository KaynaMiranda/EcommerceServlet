<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html>
<head>
    <title>Home Ecommerce</title>
     <style>
        ul { 
            display: flex;
            gap: 12px;
        }
        li {
            list-style: none;
        }
        header {
            background-color: #003366;
            color: white;
            padding: 15px 20px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        .header-title {
            font-size: 24px;
            font-weight: bold;
        }
        .cart-button {
            background-color: #ffcc00;
            color: #003366;
            border: none;
            padding: 10px 15px;
            font-size: 16px;
            font-weight: bold;
            border-radius: 5px;
            cursor: pointer;
            text-decoration: none;
        }
        .cart-button:hover {
            background-color: #e6b800;
        }
         .container {
             display: flex;
             flex-wrap: wrap;
             gap: 20px;
         }
         .card {
             border: 1px solid #ddd;
             border-radius: 8px;
             padding: 16px;
             width: 250px;
             box-shadow: 2px 2px 10px rgba(0, 0, 0, 0.1);
         }
         .card img {
            height: 250px;
         }
         .card .container-comprar {
            width: 100%;
            display: flex;
            justify-content: center;
            align-items: center;
            gap: 10px
         }
         .card .container-comprar input {
            width: 2rem;
         }
        .card .container-comprar button {
            background-color: #ffcc00;
            color: #003366;
            border: none;
            padding: 10px 15px;
            font-size: 16px;
            font-weight: bold;
            border-radius: 5px;
            cursor: pointer;
            text-decoration: none;
            transition: background-color 0.3s ease;
        }

        .button:hover {
            background-color: #e6b800;
        }

         .card h3 { margin: 0; }
         .price { font-weight: bold; color: green; }
         .quantity { font-size: 14px; color: #555; }
     </style>
</head>
<body>
    <header class="header">
        <div class="header-title">TruckMaster Peças - Qualidade e Durabilidade para seu Caminhão!</div>
        <a href="carrinho.jsp" class="cart-button">🛒 Carrinho</a>
    </header>
    <h2>Lista de Produtos</h2>
        <div class="container">
            <ul>

            </ul>
        </div>

    <script>
        const url = "";
        const produtos = [];

        fetch(url)
            .then(res => produtos.push(res.json()))
            .catch(err => console.log(err));

        const lis = produtos.reduce((acc, {id, descricao, preco, quantidade}) => {
            return acc += `
                <li>
                    <div id="`+id+`" class="card">
                        <img src="./img.jpg" alt="">
                        <h3>`+descricao+`</h3>
                        <p class="price">Preço: R$ `+preco+`</p>
                        <p class="quantity">Quantidade: `+quantidade+`</p>
                        <div class="container-comprar">
                            <button>comprar</button>
                            <input type="number">
                        </div>
                    </div>
                </li>
            `;
        }, "");


        console.log(lis)
        document.querySelector("ul").innerHTML = lis == ""
            ? "<p>Nenhum produto disponível.</p>"
            : lis
    </script>
</body>
</html>