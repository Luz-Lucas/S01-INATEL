function calcularMedia(a, b)
    return (a + b) / 2
end

function encontrarMaior(a, b)
    if a > b then
        return a
    else
        return b
    end
end

function calcularDiferencaAbsoluta(a, b)
    if a > b then
        return a - b
    else
        return b - a
    end
end

function analisarNumeros(n1, n2, operacao)
    if operacao == "media" then
        return calcularMedia(n1, n2)
    elseif operacao == "maior" then
        return encontrarMaior(n1, n2)
    elseif operacao == "diferenca" then
        return calcularDiferencaAbsoluta(n1, n2)
    else
        return "Operação inválida!"
    end
end

io.write("Digite num: ")
local num = tonumber(io.read())

io.write("Digite num2: ")
local num2 = tonumber(io.read())

io.write("Digite a operação (media, maior, diferenca): ")
local operacao = io.read()

local resultado = analisarNumeros(num, num2, operacao)
print(resultado)