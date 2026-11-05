// Classe base abstrata
abstract class Morador {
    // Atributo privado
    private String nome;

    // Construtor
    public Morador(String nome) {
        this.nome = nome;
    }

    // Getter
    public String getNome() {
        return nome;
    }

    // Método abstrato
    public abstract void apresentar();
}

// Classe filha 1
class Mago extends Morador {
    // Atributo privado
    private String feitico;

    // Construtor da filha
    public Mago(String nome, String feitico) {
        super(nome);
        this.feitico = feitico;
    }

    // Sobrescrita do método
    @Override
    public void apresentar() {
        System.out.println("Eu sou " + getNome() + " e meu feitiço é " + feitico + ".");
    }
}

// Classe filha 2
class DemonioDoFogo extends Morador {
    // Construtor da filha
    public DemonioDoFogo(String nome) {
        super(nome);
    }

    // Sobrescrita do método
    @Override
    public void apresentar() {
        System.out.println("Eu sou " + getNome() + " e faço o castelo andar.");
    }
}

public class Exercicio1 {
    public static void main(String[] args) {
        // Variáveis do tipo da classe base
        Morador obj1 = new Mago("Howl", "Transformação");
        Morador obj2 = new DemonioDoFogo("Calcifer");

        // Polimorfismo
        obj1.apresentar();
        obj2.apresentar();

        // Gera erro de compilação (classe abstrata), por isso está comentado
        // Morador obj3 = new Morador("Fulano");
    }
}
