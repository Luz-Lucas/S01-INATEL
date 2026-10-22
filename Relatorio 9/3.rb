# Classe que será usada na composição
class PhoneWave
  # Imprime mensagem
  def enviar_dmail(mensagem)
    puts "D-Mail: #{mensagem}"
    puts "Mensagem enviada para o passado!"
  end
end

# Classe usada na agregação
class MembroDoLab
  attr_reader :numero, :nome

  # Construtor
  def initialize(numero, nome)
    @numero = numero
    @nome = nome
  end
end

# Classe principal
class LaboratorioDeGadgets
  # Construtor
  def initialize
    @phonewave = PhoneWave.new # Objeto criado internamente
    @membros = []
  end

  # Adiciona objeto já criado
  def admitir(membro)
    @membros << membro
    puts "Membro admitido: ##{membro.numero} - #{membro.nome}"
  end

  # Percorre o array e usa o objeto interno
  def experimento(mensagem)
    @membros.each do |x|
      puts "Presente: ##{x.numero} - #{x.nome}"
    end
    @phonewave.enviar_dmail(mensagem)
  end
end

# main
obj1 = MembroDoLab.new(1, "Okabe Rintaro")
obj2 = MembroDoLab.new(2, "Mayuri Shiina")

obj3 = LaboratorioDeGadgets.new
obj3.admitir(obj1)
obj3.admitir(obj2)
obj3.experimento("Mensagem de teste")

# Composição: o objeto interno é criado pela própria classe e depende dela.
# Neste programa, o PhoneWave é criado dentro do LaboratorioDeGadgets.
# Agregação: o objeto é criado fora e apenas recebido pela classe.
# Neste programa, os MembroDoLab são criados na main e passados ao laboratório.
