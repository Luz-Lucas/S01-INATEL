using System;
using System.Collections.Generic;

namespace Exercicio4
{
    public class EntidadeCosmica
    {
        public string Nome { get; private set; }
        public string Origem { get; private set; } = "Desconhecida";

        public EntidadeCosmica(string nome)
        {
            Nome = nome;
        }

        public void DefinirOrigem(string origem)
        {
            Origem = origem;
        }

        public virtual void Manifestar()
        {
            Console.WriteLine($"Entidade: {Nome}");
            if (Origem != "Desconhecida")
                Console.WriteLine($"Origem: {Origem}");
        }
    }

    public class Profundo : EntidadeCosmica
    {
        public Profundo(string nome) : base(nome) { }

        // Sobrescreve sem chamar o pai
        public override void Manifestar()
        {
            Console.WriteLine($"{Nome} emerge das águas escuras, coaxando cânticos a Dagon...");
        }
    }

    public class MiGo : EntidadeCosmica
    {
        public MiGo(string nome) : base(nome) { }

        // Chama o pai antes
        public override void Manifestar()
        {
            base.Manifestar();
            Console.WriteLine($"{Nome} zumbe e bate as asas membranosas, carregando cilindros cerebrais.");
        }
    }

    public class Pesquisador
    {
        public string Nome { get; private set; }
        private List<EntidadeCosmica> catalogo = new List<EntidadeCosmica>();

        public Pesquisador(string nome)
        {
            Nome = nome;
        }

        public void Catalogar(EntidadeCosmica e)
        {
            catalogo.Add(e);
        }

        public void LerCatalogo()
        {
            Console.WriteLine($"Catálogo do pesquisador {Nome} - Universidade Miskatonic\n");
            foreach (EntidadeCosmica e in catalogo)
            {
                e.Manifestar();
                Console.WriteLine();
            }
        }
    }

    public class Program
    {
        public static void Main(string[] args)
        {
            EntidadeCosmica azathoth = new EntidadeCosmica("Azathoth");
            Profundo profundo = new Profundo("Profundo de Innsmouth");
            MiGo migo = new MiGo("Mi-Go");

            migo.DefinirOrigem("Yuggoth");

            Pesquisador armitage = new Pesquisador("Henry Armitage");
            armitage.Catalogar(azathoth);
            armitage.Catalogar(profundo);
            armitage.Catalogar(migo);

            armitage.LerCatalogo();
        }
    }
}
