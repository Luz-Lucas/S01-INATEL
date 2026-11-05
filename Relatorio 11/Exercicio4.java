import java.util.ArrayList;

// Classe base abstrata
abstract class Monstro {
    // Atributo privado
    private String nome;

    // Construtor
    public Monstro(String nome) {
        this.nome = nome;
    }

    // Getter
    public String getNome() {
        return nome;
    }

    // Método abstrato
    public abstract String receita();
}

// Classe filha 1
class Slime extends Monstro {
    // Construtor da filha
    public Slime(String nome) {
        super(nome);
    }

    // Sobrescrita do método
    @Override
    public String receita() {
        return "Cozido em fogo baixo com ervas.";
    }
}

// Classe filha 2
class Mandragora extends Monstro {
    // Construtor da filha
    public Mandragora(String nome) {
        super(nome);
    }

    // Sobrescrita do método
    @Override
    public String receita() {
        return "Frita em tempura crocante.";
    }
}

// Classe usada na composição
class Panela {
    // Atributo privado
    private String material;

    // Construtor
    public Panela(String material) {
        this.material = material;
    }

    // Getter
    public String getMaterial() {
        return material;
    }
}

// Classe principal
class Cozinheiro {
    // Atributos privados
    private String nome;
    private Panela panela;
    private ArrayList<Monstro> ingredientes;

    // Construtor
    public Cozinheiro(String nome, String materialDaPanela) {
        this.nome = nome;
        this.panela = new Panela(materialDaPanela); // Objeto criado internamente
        this.ingredientes = new ArrayList<>();
    }

    // Adiciona objeto já criado
    public void adicionarIngrediente(Monstro monstro) {
        ingredientes.add(monstro);
    }

    // Percorre a lista
    public void servirBanquete() {
        System.out.println("Cozinheiro: " + nome + " - Panela de " + panela.getMaterial());
        for (Monstro x : ingredientes) {
            System.out.println(x.getNome() + ": " + x.receita());
        }
    }
}

public class Exercicio4 {
    public static void main(String[] args) {
        Monstro obj1 = new Slime("Slime Verde");
        Monstro obj2 = new Mandragora("Mandrágora Gritante");

        Cozinheiro obj3 = new Cozinheiro("Senshi", "Ferro");
        obj3.adicionarIngrediente(obj1);
        obj3.adicionarIngrediente(obj2);
        obj3.servirBanquete();

        // Composição: o objeto interno é criado pela própria classe e depende dela.
        // Neste programa, a Panela é criada dentro do construtor do Cozinheiro
        // e só existe junto com ele.
        // Agregação: o objeto é criado fora e apenas recebido pela classe.
        // Neste programa, os Monstros são criados na main e passados ao Cozinheiro,
        // e continuam existindo fora dele.
    }
}
