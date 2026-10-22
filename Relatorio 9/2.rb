# Classe base abstrata
class Instrumentista
  attr_reader :nome, :instrumento

  # Construtor
  def initialize(nome, instrumento)
    @nome = nome
    @instrumento = instrumento
  end

  # Método abstrato
  def interpretar(peca)
    raise NotImplementedError, "Implementar na classe filha"
  end
end

# Classe filha 1
class Solista < Instrumentista
  # Sobrescrita do método
  def interpretar(peca)
    puts "#{@nome} (#{@instrumento}) toca #{peca} e conduz a melodia principal."
  end
end

# Classe filha 2
class Acompanhador < Instrumentista
  # Sobrescrita do método
  def interpretar(peca)
    puts "#{@nome} (#{@instrumento}) toca #{peca} e acompanha o ritmo do solista."
  end
end

# Classe que gerencia os objetos
class Regente
  # Construtor
  def initialize(nome)
    @nome = nome
    @orquestra = []
  end

  # Adiciona ao array
  def convocar(instrumentista)
    @orquestra << instrumentista
  end

  # Percorre o array
  def reger(peca)
    puts "#{@nome} rege #{peca}"
    @orquestra.each do |x|
      x.interpretar(peca)
    end
  end

  # Retorna novo array
  def escalacao
    @orquestra.map do |x|
      "#{x.class}: #{x.nome}"
    end
  end
end

# main
obj1 = Solista.new("Kousei Arima", "Piano")
obj2 = Acompanhador.new("Kaori Miyazono", "Violino")
obj3 = Regente.new("Maestro Silva")

obj3.convocar(obj1)
obj3.convocar(obj2)
obj3.reger("Sonata nº 1")

obj3.escalacao.each do |x|
  puts x
end

# Objeto da classe base
obj4 = Instrumentista.new("Fulano", "Flauta")
# Gera erro (NotImplementedError), por isso está comentado
# obj4.interpretar("Sonata nº 1")
