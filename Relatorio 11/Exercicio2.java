import java.util.ArrayList;

// Classe base
class ItemDoCardapio {
    // Atributos privados
    private String nome;
    private double preco;

    // Construtor
    public ItemDoCardapio(String nome, double preco) {
        this.nome = nome;
        this.preco = preco;
    }

    // Getters
    public String getNome() {
        return nome;
    }

    public double getPreco() {
        return preco;
    }

    // Retorna o preço
    public double precoFinal() {
        return preco;
    }
}

// Classe filha
class ComboLeblanc extends ItemDoCardapio {
    // Construtor da filha
    public ComboLeblanc(String nome, double preco) {
        super(nome, preco);
    }

    // Sobrescrita do método
    @Override
    public double precoFinal() {
        return getPreco() * 0.9;
    }
}

// Classe que gerencia os objetos
class CafeLeblanc {
    // Atributo privado
    private ArrayList<ItemDoCardapio> cardapio;

    // Construtor
    public CafeLeblanc() {
        cardapio = new ArrayList<>();
    }

    // Adiciona objeto já criado
    public void adicionar(ItemDoCardapio item) {
        cardapio.add(item);
    }

    // Percorre a lista
    public void mostrarCardapio() {
        for (ItemDoCardapio x : cardapio) {
            System.out.println(x.getNome() + " - R$ " + String.format("%.2f", x.precoFinal()));
        }
    }
}

public class Exercicio2 {
    public static void main(String[] args) {
        ItemDoCardapio obj1 = new ItemDoCardapio("Café Coado", 12.00);
        ItemDoCardapio obj2 = new ItemDoCardapio("Curry da Casa", 30.00);
        ItemDoCardapio obj3 = new ComboLeblanc("Combo Café + Curry", 40.00);

        CafeLeblanc obj4 = new CafeLeblanc();
        obj4.adicionar(obj1);
        obj4.adicionar(obj2);
        obj4.adicionar(obj3);

        obj4.mostrarCardapio();
    }
}
