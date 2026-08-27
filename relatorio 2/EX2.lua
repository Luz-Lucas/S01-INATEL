io.write("Digite a quantidade de elementos (num): ")
local num = tonumber(io.read())

local tabela = {}
for i = 1, num do
    io.write("Digite num" .. i .. ": ")
    tabela[i] = tonumber(io.read())
end

io.write("Digite o número a ser buscado (num2): ")
local num2 = tonumber(io.read())

function contarOcorrencias(tabela, alvo)
    local cont = 0
    for i = 1, #tabela do
        if tabela[i] == alvo then
            cont = cont + 1
        end
    end
    return cont
end

local ocorrencias = contarOcorrencias(tabela, num2)
print("O número " .. num2 .. " aparece " .. ocorrencias .. " vez(es) na tabela.")