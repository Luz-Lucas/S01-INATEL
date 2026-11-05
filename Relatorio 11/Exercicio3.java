import java.util.HashMap;

// Interface (contrato)
interface Sobrenatural {
    void manifestar();
}

// Classe 1
class Alienigena implements Sobrenatural {
    // Atributo privado
    private String nome;

    // Construtor
    public Alienigena(String nome) {
        this.nome = nome;
    }

    // Implementação do contrato
    @Override
    public void manifestar() {
        System.out.println(nome + " surge flutuando e emite uma luz estranha.");
    }
}

// Classe 2
class EspiritoYoukai implements Sobrenatural {
    // Atributo privado
    private String nome;

    // Construtor
    public EspiritoYoukai(String nome) {
        this.nome = nome;
    }

    // Implementação do contrato
    @Override
    public void manifestar() {
        System.out.println(nome + " aparece sussurrando e atravessa a parede.");
    }
}

// Classe que gerencia os objetos
class MapaDeAvistamentos {
    // Atributo privado
    private HashMap<String, Sobrenatural> avistamentos;

    // Construtor
    public MapaDeAvistamentos() {
        avistamentos = new HashMap<>();
    }

    // Guarda no mapa usando o local como chave
    public void registrar(String local, Sobrenatural ser) {
        avistamentos.put(local, ser);
    }

    // Busca no mapa
    public void investigar(String local) {
        Sobrenatural ser = avistamentos.get(local);
        if (ser == null) {
            System.out.println(local + " está tranquilo.");
        } else {
            ser.manifestar();
        }
    }
}

public class Exercicio3 {
    public static void main(String[] args) {
        Sobrenatural obj1 = new Alienigena("Serpoianos");
        Sobrenatural obj2 = new EspiritoYoukai("Turbo Vovó");

        MapaDeAvistamentos obj3 = new MapaDeAvistamentos();
        obj3.registrar("Túnel Abandonado", obj1);
        obj3.registrar("Escola", obj2);

        obj3.investigar("Túnel Abandonado");
        obj3.investigar("Escola");
        obj3.investigar("Parque");
    }
}
