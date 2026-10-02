using System;
using System.Collections.Generic;

namespace Exercicio2
{
    public class Pokemon
    {
        public string Especie { get; private set; }
        public int Nivel { get; private set; }

        public Pokemon(string especie, int nivel)
        {
            Especie = especie;
            Nivel = nivel;
        }

        public virtual void Atacar()
        {
            Console.WriteLine($"{Especie} (Nv. {Nivel}) usou Investida!");
        }
    }

    public class TipoPlanta : Pokemon
    {
        public TipoPlanta(string especie, int nivel) : base(especie, nivel) { }

        // Sobrescreve sem chamar o pai
        public override void Atacar()
        {
            Console.WriteLine($"{Especie} (Nv. {Nivel}) usou Folha Navalha!");
        }
    }

    public class TipoEletrico : Pokemon
    {
        public TipoEletrico(string especie, int nivel) : base(especie, nivel) { }

        // Chama primeiro o ataque do pai e depois solta a descarga
        public override void Atacar()
        {
            base.Atacar();
            Console.WriteLine($"{Especie} soltou uma Descarga Elétrica!");
        }
    }

    public class Program
    {
        public static void Main(string[] args)
        {
            List<Pokemon> batalha = new List<Pokemon>
            {
                new Pokemon("Eevee", 15),
                new TipoPlanta("Bulbasaur", 18),
                new TipoEletrico("Pikachu", 25)
            };

            foreach (Pokemon p in batalha)
            {
                p.Atacar();
                Console.WriteLine();
            }
        }
    }
}
