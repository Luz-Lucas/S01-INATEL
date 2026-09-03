use std::io;

fn imprimir_terminados_em(digito: i32, limite_inferior: i32, limite_superior: i32) {
    println!("--- Números no intervalo terminados em {} ---", digito);
    for numero in limite_inferior..=limite_superior {
        if numero % 10 == digito {
            println!("{}", numero);
        }
    }
}

fn main() {
    let mut digito = String::new();
    println!("Digite o dígito final desejado (0 a 9):");
    io::stdin().read_line(&mut digito).expect("Erro ao ler");
    let digito: i32 = digito.trim().parse().expect("Digite um número válido");

    let mut limite_inferior = String::new();
    println!("Digite o limite inferior:");
    io::stdin().read_line(&mut limite_inferior).expect("Erro ao ler");
    let limite_inferior: i32 = limite_inferior.trim().parse().expect("Digite um número válido");

    let mut limite_superior = String::new();
    println!("Digite o limite superior:");
    io::stdin().read_line(&mut limite_superior).expect("Erro ao ler");
    let limite_superior: i32 = limite_superior.trim().parse().expect("Digite um número válido");

    imprimir_terminados_em(digito, limite_inferior, limite_superior);
}