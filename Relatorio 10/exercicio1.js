// Classe base
class Pokemon {
  // Atributos públicos
  apelido;
  tipo;

  // Atributo privado
  #vida;

  // Construtor
  constructor(apelido, tipo, vidaInicial) {
    this.apelido = apelido;
    this.tipo = tipo;
    this.#vida = vidaInicial;
  }

  // Getter (sem setter)
  get vida() {
    return this.#vida;
  }

  // Reduz a vida sem deixar negativa
  sofrerDano(pontos) {
    this.#vida -= pontos;
    if (this.#vida < 0) {
      this.#vida = 0;
    }
    console.log(`${this.apelido} ficou com ${this.#vida} de vida.`);
  }

  // Ataque genérico
  atacar(alvo) {
    console.log(`${this.apelido} usa um ataque genérico em ${alvo.apelido}!`);
    alvo.sofrerDano(10);
  }
}

// Classe filha 1
class Squirtle extends Pokemon {
  // Construtor da filha
  constructor(apelido, vidaInicial) {
    super(apelido, "Água", vidaInicial);
  }

  // Sobrescrita do método
  atacar(alvo) {
    console.log(`${this.apelido} usa Jato d'Água em ${alvo.apelido}!`);
    alvo.sofrerDano(20);
  }
}

// Classe filha 2
class Bulbasaur extends Pokemon {
  // Construtor da filha
  constructor(apelido, vidaInicial) {
    super(apelido, "Planta", vidaInicial);
  }

  // Sobrescrita do método
  atacar(alvo) {
    console.log(`${this.apelido} usa Chicote de Vinha em ${alvo.apelido}!`);
    alvo.sofrerDano(15);
  }
}

// main
const obj1 = new Squirtle("Squirtle do Ash", 50);
const obj2 = new Bulbasaur("Bulbasaur do Ash", 30);

// Ataques
obj2.atacar(obj1);
obj1.atacar(obj2);
obj1.atacar(obj2);

// Imprime usando o getter
console.log(obj1.vida);
console.log(obj2.vida);

// Gera erro (SyntaxError) e o programa nem roda, por isso está comentado
// console.log(obj1.#vida);
