// Classe usada na composição
class FichaDeCriatura {
  // Construtor
  constructor(criatura, nivelDePerigo) {
    this.criatura = criatura;
    this.nivelDePerigo = nivelDePerigo;
  }

  // Retorna texto
  descrever() {
    return `${this.criatura} - Nível de perigo: ${this.nivelDePerigo}`;
  }
}

// Classe principal 1
class DiarioMisterioso {
  // Atributo privado
  #fichas = [];

  // Construtor
  constructor(numero) {
    this.numero = numero;
  }

  // Cria o objeto internamente e adiciona ao array
  anotar(criatura, nivelDePerigo) {
    const ficha = new FichaDeCriatura(criatura, nivelDePerigo);
    this.#fichas.push(ficha);
  }

  // Percorre o array
  exibirFichas() {
    console.log(`Diário nº ${this.numero}`);
    this.#fichas.forEach((x) => {
      console.log(x.descrever());
    });
  }
}

// Classe usada na agregação
class Funcionario {
  // Construtor
  constructor(nome, cargo) {
    this.nome = nome;
    this.cargo = cargo;
  }
}

// Classe principal 2
class CabanaDoMisterio {
  // Atributo privado
  #funcionarios = [];

  // Construtor
  constructor(dono) {
    this.dono = dono;
  }

  // Adiciona objeto já criado
  contratar(funcionario) {
    this.#funcionarios.push(funcionario);
  }

  // Percorre o array
  abrirAsPortas() {
    console.log(`Cabana do Mistério, de ${this.dono}, aberta!`);
    this.#funcionarios.forEach((x) => {
      console.log(`${x.nome} - ${x.cargo}`);
    });
  }
}

// main
const obj1 = new DiarioMisterioso(3);
obj1.anotar("Gnomos", 5);
obj1.anotar("Multi-Urso", 9);
obj1.anotar("Zumbis", 7);
obj1.exibirFichas();

const obj2 = new Funcionario("Soos", "Faz-tudo");
const obj3 = new Funcionario("Wendy", "Caixa");

const obj4 = new CabanaDoMisterio("Stan");
obj4.contratar(obj2);
obj4.contratar(obj3);
obj4.abrirAsPortas();

// Composição: o objeto interno é criado pela própria classe e depende dela.
// Neste programa, a FichaDeCriatura é criada dentro do método anotar() do DiarioMisterioso
// e só existe dentro dele.
// Agregação: o objeto é criado fora e apenas recebido pela classe.
// Neste programa, os Funcionarios são criados no main e passados para a CabanaDoMisterio,
// e continuam existindo fora dela.
