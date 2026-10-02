using System;
using System.Collections.Generic;

namespace Exercicio3
{
    public class Grimorio
    {
        public string FeiticoFavorito { get; private set; } = "Nenhum";

        public void DefinirFeiticoFavorito(string feitico)
        {
            FeiticoFavorito = feitico;
        }

        public void Abrir()
        {
            Console.WriteLine($"O grimório se abre... Feitiço favorito: {FeiticoFavorito}");
        }
    }

    public class Companheiro
    {
        public string Nome { get; private set; }
        public string Funcao { get; private set; }

        public Companheiro(string nome, string funcao)
        {
            Nome = nome;
            Funcao = funcao;
        }

        public void Apresentar()
        {
            Console.WriteLine($"- {Nome} ({Funcao})");
        }
    }

    public class Maga
    {
        public string Nome { get; private set; }
        public Grimorio Grimorio { get; private set; }
        private List<Companheiro> companheiros = new List<Companheiro>();

        public Maga(string nome)
        {
            Nome = nome;
            Grimorio = new Grimorio(); // Composição: o grimório nasce junto com a maga
        }

        public void Recrutar(Companheiro c)
        {
            companheiros.Add(c); // Agregação: o companheiro já existia antes
        }

        public void MostrarGrupo()
        {
            Console.WriteLine($"Grupo de {Nome}:");
            foreach (Companheiro c in companheiros)
                c.Apresentar();
            Console.WriteLine();
        }
    }

    public class Program
    {
        public static void Main(string[] args)
        {
            Companheiro fern = new Companheiro("Fern", "Maga");
            Companheiro stark = new Companheiro("Stark", "Guerreiro");

            Maga frieren = new Maga("Frieren");
            frieren.Recrutar(fern);
            frieren.Recrutar(stark);

            frieren.Grimorio.DefinirFeiticoFavorito("Feitiço para fazer flores brotarem");

            frieren.MostrarGrupo();
            frieren.Grimorio.Abrir();

            /*
             * COMPOSIÇÃO: o Grimorio é criado dentro do construtor da Maga.
             * Ele não existe fora dela; se a Maga deixar de existir, o
             * Grimorio também deixa (relação forte, "parte de").
             *
             * AGREGAÇÃO: os objetos Companheiro são criados na Main, antes
             * da Maga, e apenas recebidos por Recrutar(). Eles existem de
             * forma independente; se a Maga deixar de existir, Fern e
             * Stark continuam existindo (relação fraca, "tem um").
             */
        }
    }
}
