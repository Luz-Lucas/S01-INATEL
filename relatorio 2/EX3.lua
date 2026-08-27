io.write("Digite a quantidade de elementos (num): ")
local num = tonumber(io.read())

local tabela = {}
for i = 1, num do
    io.write("Digite num" .. i .. ": ")
    tabela[i] = tonumber(io.read())
end

io.write("Digite o limite (num2): ")
local num2 = tonumber(io.read())

function filtrarMaiores(tabela, limite)
    local nova = {}
    local cont = 0
    for i = 1, #tabela do
        if tabela[i] > limite then
            cont = cont + 1
            nova[cont] = tabela[i]
        end
    end
    return nova
end

local resultado = filtrarMaiores(tabela, num2)
for i = 1, #resultado do
    print(resultado[i])
end