use std::io;

fn calcular_pontuacao(prova1: f64, prova2: f64, redacao: f64) -> f64 {
    let npt = (prova1 + prova2) / 2.0;
    let pf = npt * 0.6 + redacao * 0.4;

    if pf >= 60.0 {
        println!("Parabéns! Candidato aprovado no processo seletivo.");
    } else {
        println!("Infelizmente o candidato não atingiu a pontuação mínima de aprovação.");
    }

    pf
}

fn main() {
    let mut prova1 = String::new();
    println!("Digite a nota da Prova Teórica 1:");
    io::stdin().read_line(&mut prova1).expect("Erro ao ler");
    let prova1: f64 = prova1.trim().parse().expect("Digite um número válido");

    let mut prova2 = String::new();
    println!("Digite a nota da Prova Teórica 2:");
    io::stdin().read_line(&mut prova2).expect("Erro ao ler");
    let prova2: f64 = prova2.trim().parse().expect("Digite um número válido");

    let mut redacao = String::new();
    println!("Digite a nota da Redação:");
    io::stdin().read_line(&mut redacao).expect("Erro ao ler");
    let redacao: f64 = redacao.trim().parse().expect("Digite um número válido");

    let resultado = calcular_pontuacao(prova1, prova2, redacao);
    println!("Pontuação Final: {:.2}", resultado);
}