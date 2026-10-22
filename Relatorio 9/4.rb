# Módulo de contrato
module Depoente
  def depor
    raise NotImplementedError, "Implementar na classe que incluir"
  end
end

# Módulo com implementação pronta
module Detivel
  def ser_detido
    puts "#{nome} foi levado pela Scotland Yard."
  end
end

# Classe base
class Envolvido
  attr_reader :nome

  # Construtor
  def initialize(nome)
    @nome = nome
  end
end

# Classe filha 1
class TestemunhaOcular < Envolvido
  include Depoente

  # Implementação do contrato
  def depor
    puts "#{@nome} viu um vulto saindo pela janela."
  end
end

# Classe filha 2
class SuspeitoDoCrime < Envolvido
  include Depoente
  include Detivel

  # Implementação do contrato
  def depor
    puts "#{@nome} diz que estava em casa no momento do crime."
  end
end

# Classe que recebe objetos prontos
class Investigacao
  # Construtor
  def initialize(caso)
    @caso = caso
    @envolvidos = []
  end

  # Adiciona ao array
  def registrar(envolvido)
    @envolvidos << envolvido
  end

  # Polimorfismo
  def ouvir_todos
    puts "Caso: #{@caso}"
    @envolvidos.each do |x|
      x.depor
    end
  end

  # Filtra objetos que têm o método
  def acionar_scotland_yard
    lista = @envolvidos.select do |x|
      x.respond_to?(:ser_detido)
    end
    lista.each do |x|
      x.ser_detido
    end
  end
end

# main
obj1 = TestemunhaOcular.new("Sra. Hudson")
obj2 = SuspeitoDoCrime.new("Moriarty")
obj3 = SuspeitoDoCrime.new("Sebastian Moran")

obj4 = Investigacao.new("O Mistério da Baker Street")
obj4.registrar(obj1)
obj4.registrar(obj2)
obj4.registrar(obj3)

obj4.ouvir_todos
obj4.acionar_scotland_yard
