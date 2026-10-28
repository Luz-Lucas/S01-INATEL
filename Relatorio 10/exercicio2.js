// Classe usada na composição
class Pistola {
  // Construtor
  constructor(modelo) {
    this.modelo = modelo;
  }
}

// Classe base
class AgenteProtocolo {
  // Atributo público
  codinome;

  // Atributo privado
  #pistola;

  // Construtor
  constructor(codinome, modeloDaPistola) {
    this.codinome = codinome;
    this.#pistola = new Pistola(modeloDaPistola); // Objeto criado internamente
  }

  // Método abstrato
  usarHabilidade() {
    throw new Error("Método usarHabilidade() deve ser implementado pela classe filha.");
  }

  // Usa o retorno do método sobrescrito
  entrarEmCombate() {
    console.log(`${this.codinome} - ${this.#pistola.modelo} - ${this.usarHabilidade()}`);
  }
}

// Classe filha 1
class Controlador extends AgenteProtocolo {
  // Sobrescrita do método
  usarHabilidade() {
    return "Libera uma cortina de fumaça.";
  }
}

// Classe filha 2
class Iniciador extends AgenteProtocolo {
  // Sobrescrita do método
  usarHabilidade() {
    return "Revela a posição dos inimigos.";
  }
}

// Classe filha 3
class Duelista extends AgenteProtocolo {
  // Sobrescrita do método
  usarHabilidade() {
    return "Avança com uma investida rápida.";
  }
}

// Classe usada na agregação
class Esquadrao {
  // Atributo privado
  #agentes;

  // Construtor
  constructor(nome, agentes) {
    this.nome = nome;
    this.#agentes = agentes; // Objetos já criados
  }

  // Polimorfismo
  iniciarPartida() {
    console.log(`Esquadrão: ${this.nome}`);
    this.#agentes.forEach((x) => {
      x.entrarEmCombate();
    });
  }

  // Filtra pela classe
  listarControladores() {
    return this.#agentes.filter((x) => x instanceof Controlador);
  }
}

// main
const obj1 = new Controlador("Brimstone", "Classic");
const obj2 = new Controlador("Omen", "Ghost");
const obj3 = new Iniciador("Sova", "Sheriff");
const obj4 = new Duelista("Jett", "Frenzy");

const obj5 = new Esquadrao("Esquadrão Alfa", [obj1, obj2, obj3, obj4]);
obj5.iniciarPartida();

obj5.listarControladores().forEach((x) => {
  console.log(x.codinome);
});

// Objeto da classe base
const obj6 = new AgenteProtocolo("Fulano", "Classic");
// Gera erro (Error), por isso está comentado
// obj6.entrarEmCombate();
