using System;

namespace Exercicio1
{
    public class CombatenteDeGondor
    {
        public string Nome { get; private set; }
        public string Povo { get; private set; }
        public string Posto { get; private set; }
        public string Armamento { get; private set; } = "Desarmado";

        public CombatenteDeGondor(string nome, string povo, string posto)
        {
            Nome = nome;
            Povo = povo;
            Posto = posto;
        }

        public void Equipar(string arma)
        {
            Armamento = arma;
        }

        public void ApresentarUnidade()
        {
            Console.WriteLine($"Nome: {Nome}");
            Console.WriteLine($"Povo: {Povo}");
            Console.WriteLine($"Posto: {Posto}");

            if (Armamento != "Desarmado")
                Console.WriteLine($"Armamento: {Armamento}");

            Console.WriteLine();
        }
    }

    public class Program
    {
        public static void Main(string[] args)
        {
            CombatenteDeGondor aragorn = new CombatenteDeGondor("Aragorn", "Dúnedain", "Capitão");
            CombatenteDeGondor gimli = new CombatenteDeGondor("Gimli", "Anão", "Guerreiro");
            CombatenteDeGondor pippin = new CombatenteDeGondor("Pippin", "Hobbit", "Guarda da Cidadela");

            aragorn.Equipar("Andúril");
            gimli.Equipar("Machado de batalha");

            aragorn.ApresentarUnidade();
            gimli.ApresentarUnidade();
            pippin.ApresentarUnidade();

            // ERRO CS0272: o set de 'Posto' é privado (private set),
            // então só pode ser alterado de dentro da própria classe.
            // pippin.Posto = "General";
        }
    }
}
