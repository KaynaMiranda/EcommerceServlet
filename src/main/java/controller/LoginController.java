package controller;

import model.Usuario;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/login")
public class LoginController extends HttpServlet {
    private List<Usuario> usuarios = new ArrayList<>();

    @Override
    public void init() throws ServletException {
        // Adicionando usuários fictícios
        usuarios.add(new Usuario("admin", "admin123", "admin"));
        usuarios.add(new Usuario("user", "user123", "user"));
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        for (Usuario usuario : usuarios) {
            if (usuario.getUsername().equals(username) && usuario.getPassword().equals(password)) {
                HttpSession session = request.getSession();
                session.setAttribute("usuarioLogado", usuario);

                if ("admin".equals(usuario.getRole())) {
                    response.sendRedirect("cadastro.jsp"); // Redireciona para a página do administrador
                } else {
                    response.sendRedirect("produtos.jsp"); // Redireciona para a lista de produtos
                }
                return;
            }
        }

        request.setAttribute("erro", "Usuário ou senha inválidos");
        request.getRequestDispatcher("index.jsp").forward(request, response);
    }
}