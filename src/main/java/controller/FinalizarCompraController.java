package controller;


import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Carrinho;

import java.io.IOException;

@WebServlet("/finalizarCompra")
public class FinalizarCompraController extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Obtém o carrinho da sessão
        HttpSession session = request.getSession();
        Carrinho carrinho = (Carrinho) session.getAttribute("carrinho");

        if (carrinho != null && !carrinho.getProdutos().isEmpty()) {
            // Limpa todos os produtos do carrinho
            carrinho.getProdutos().clear(); // Remove todos os itens da lista
            session.setAttribute("carrinho", carrinho); // Atualiza o carrinho na sessão

            // Adiciona uma mensagem de sucesso para exibir ao usuário
            session.setAttribute("compraFinalizada", "Compra finalizada com sucesso!");
        } else {
            // Se o carrinho estiver vazio, avisa o usuário
            session.setAttribute("erroCarrinho", "O carrinho está vazio. Não é possível finalizar a compra.");
        }

        // Redireciona para a página de produtos
        response.sendRedirect("produtos.jsp");
    }
}



