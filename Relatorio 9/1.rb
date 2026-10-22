# Classe base
class CoquetelAfterlife
  # Leitura apenas
  attr_reader :nome

  # Construtor
  def initialize(nome, preco)
    @nome = nome
    @_preco = preco
  end

  # Getter manual
  def preco
    @_preco
  end

  # Setter manual com validação
  def preco=(valor)
    if valor >= 5 && valor <= 200
      @_preco = valor
    else
      puts "Preço inválido!"
    end
  end

  # Retorna texto
  def ficha
    "#{@nome} - R$ #{@_preco}"
  end
end

# Classe filha
class DrinkDeLenda < CoquetelAfterlife
  attr_reader :lenda

  # Construtor da filha
  def initialize(nome, preco, lenda)
    super(nome, preco)
    @lenda = lenda
  end

  # Sobrescrita do método
  def ficha
    super + " - Homenagem a #{@lenda}"
  end
end

# main
obj1 = CoquetelAfterlife.new("Cosmo Night", 30)
obj2 = DrinkDeLenda.new("Silverhand Shot", 120, "Johnny Silverhand")
obj3 = DrinkDeLenda.new("Dragon Fire", 90, "Jackie Welles")

# Array de objetos
lista = [obj1, obj2, obj3]

# Percorre o array
lista.each do |x|
  puts x.ficha
end

# Testa o setter
obj2.preco = 500
obj2.preco = 80
puts obj2.ficha

# Gera erro (NoMethodError), por isso está comentado
# obj1.nome = "Novo nome"
