io.write("Digite o expoente inicial (M): ")
local num1 = tonumber(io.read())

io.write("Digite o expoente final (N): ")
local num2 = tonumber(io.read())

io.write("Digite a base: ")
local base = tonumber(io.read())

function gerarTabelaPotencias(inicio, fim, base)
    for expoente = inicio, fim do
        local resultado = base ^ expoente
        print(base .. "^" .. expoente .. " = " .. resultado)
    end
end

gerarTabelaPotencias(num1, num2, base)