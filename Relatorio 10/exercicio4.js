// Classe base
class UsuarioDeNen {
  // Construtor
  constructor(nome) {
    this.nome = nome;
  }

  // Ataque genérico
  atacar(alvo) {
    console.log(`${this.nome} lança um ataque de aura contra ${alvo.nome}!`);
  }
}

// Classe filha 1
class Intensificador extends UsuarioDeNen {
  // Sobrescrita do método
  atacar(alvo) {
    console.log(`${this.nome} reforça o punho com aura e acerta ${alvo.nome}!`);
  }
}

// Classe filha 2
class Transmutador extends UsuarioDeNen {
  // Sobrescrita do método
  atacar(alvo) {
    console.log(`${this.nome} transforma a aura em eletricidade e atinge ${alvo.nome}!`);
  }
}

// Classe filha 3
class Materializador extends UsuarioDeNen {
  // Sobrescrita do método
  atacar(alvo) {
    console.log(`${this.nome} materializa uma arma de aura e golpeia ${alvo.nome}!`);
  }
}

// Classe usada na agregação
class Aranha {
  // Construtor
  constructor(nome, numero) {
    this.nome = nome;
    this.numero = numero;
  }
}

// Classe principal
class TrupeFantasma {
  // Atributo privado
  #aranhas;

  // Construtor com valor padrão
  constructor(cidade, aranhas = []) {
    this.cidade = cidade;
    this.#aranhas = aranhas; // Objetos já criados
  }

  // Percorre o array
  revelarAranhas() {
    console.log(`Cidade: ${this.cidade}`);
    this.#aranhas.forEach((x) => {
      console.log(`Nº ${x.numero} - ${x.nome}`);
    });
  }

  // Busca no array
  buscarAranha(numero) {
    return this.#aranhas.find((x) => x.numero === numero);
  }
}

// main
const obj1 = new Aranha("Chrollo", 0);
const obj2 = new Aranha("Feitan", 2);

const obj3 = new TrupeFantasma("Yorknew", [obj1, obj2]);
obj3.revelarAranhas();
const obj4 = obj3.buscarAranha(2);

// Array com um objeto de cada tipo
const lista = [
  new Intensificador("Gon"),
  new Transmutador("Killua"),
  new Materializador("Kurapika"),
];

// Polimorfismo
lista.forEach((x) => {
  x.atacar(obj4);
});
