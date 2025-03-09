package model;

import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

public class Carrinho {
    private List<Produto> produtos;

    public Carrinho() {
        produtos = new ArrayList<>();
    }

    public double calcularTotal() {
        double total = 0;
        for (Produto produto : produtos) {
            total += produto.getPreco() * produto.getQuantidade();
        }
        return total;
    }

    public void atualizarQuantidade(UUID idProduto, int novaQuantidade) {
        for (Produto p : produtos) {
            if (p.getId().equals(idProduto)) {
                p.setQuantidade(novaQuantidade);
                return;
            }
        }
    }

    public void removerProduto(UUID idProduto) {
        for (int i = 0; i < produtos.size(); i++) {
            if (produtos.get(i).getId().equals(idProduto)) {
                produtos.remove(i);
                break;
            }
        }
    }


    public void adicionarProduto(Produto produto) {
        produtos.add(produto);
    }

    public List<Produto> getProdutos() {
        return produtos;
    }
}
