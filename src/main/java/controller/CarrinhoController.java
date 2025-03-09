package controller;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpSession;
import model.Carrinho;
import model.Produto;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


import java.io.IOException;
import java.util.UUID;

@WebServlet("/carrinho")
public class CarrinhoController extends HttpServlet {

    // Adicionar produto ao carrinho
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Carrinho carrinho = (Carrinho) session.getAttribute("carrinho");
        if (carrinho == null) {
            carrinho = new Carrinho();
            session.setAttribute("carrinho", carrinho);
        }

        String idProduto = request.getParameter("idProduto");
        String nomeProduto = request.getParameter("nomeProduto");
        String descricaoProduto = request.getParameter("descricaoProduto");
        String precoProduto = request.getParameter("precoProduto");
        String quantidadeProduto = request.getParameter("quantidadeProduto");

        Produto produto = new Produto();
        produto.setId(UUID.fromString(idProduto));
        produto.setNome(nomeProduto);
        produto.setDescricao(descricaoProduto);
        produto.setPreco(Double.parseDouble(precoProduto));
        produto.setQuantidade(Integer.parseInt(quantidadeProduto));

        carrinho.adicionarProduto(produto);

        response.sendRedirect("produtos.jsp");
    }

    // Remover produto do carrinho
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String idProduto = request.getParameter("idProduto");
        HttpSession session = request.getSession();
        Carrinho carrinho = (Carrinho) session.getAttribute("carrinho");

        if (carrinho != null && idProduto != null) {
            carrinho.removerProduto(UUID.fromString(idProduto));
        }

        response.sendRedirect("carrinho.jsp");
    }

    // Atualizar a quantidade do produto no carrinho
    protected void doPut(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String idProduto = request.getParameter("idProduto");
        String quantidade = request.getParameter("quantidade");

        HttpSession session = request.getSession();
        Carrinho carrinho = (Carrinho) session.getAttribute("carrinho");

        if (carrinho != null && idProduto != null && quantidade != null) {
            carrinho.atualizarQuantidade(UUID.fromString(idProduto), Integer.parseInt(quantidade));
        }

        response.sendRedirect("carrinho.jsp");
    }
}


