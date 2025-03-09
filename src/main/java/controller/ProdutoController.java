package controller;

import model.Produto;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/produtos")
public class ProdutoController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Recupera a lista de produtos do ServletContext
        List<Produto> produtos = (List<Produto>) getServletContext().getAttribute("produtos");

        // Se a lista ainda não existir, cria uma nova e armazena no contexto da aplicação
        if (produtos == null) {
            produtos = new ArrayList<>();
            getServletContext().setAttribute("produtos", produtos);
        }

        // Passa a lista de produtos para a página JSP
        request.setAttribute("produtos", produtos);

        request.getRequestDispatcher("produtos.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String nome = request.getParameter("nome");
        String descricao = request.getParameter("descricao");
        double preco = Double.parseDouble(request.getParameter("preco"));
        int quantidade = Integer.parseInt(request.getParameter("quantidade"));

        Produto produto = new Produto(nome, descricao, preco, quantidade);

        // Recupera a lista de produtos do contexto da aplicação
        List<Produto> produtos = (List<Produto>) getServletContext().getAttribute("produtos");
        if (produtos == null) {
            produtos = new ArrayList<>();
            getServletContext().setAttribute("produtos", produtos);
        }

        // Adiciona o novo produto à lista
        produtos.add(produto);

        // Redireciona para a página de cadastro
        request.getRequestDispatcher("cadastro.jsp").forward(request, response);
    }
}


