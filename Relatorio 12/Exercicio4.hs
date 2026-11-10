-- Tipo com opções
data Etapa = NaFila | NoBanho | Concluido
  deriving (Show, Eq)

-- Tipo com campos nomeados
data Atendimento = Atendimento
  { cliente :: String
  , servico :: String
  , valor :: Double
  , etapa :: Etapa
  }

-- Retorna texto
descrever :: Atendimento -> String
descrever a = cliente a ++ " - " ++ servico a ++ " - " ++ show (etapa a)

-- Retorna uma cópia com o campo alterado
concluir :: Atendimento -> Atendimento
concluir a = a { etapa = Concluido }

-- Filtra usando lambda, depois map e sum
arrecadado :: [Atendimento] -> Double
arrecadado xs = sum (map valor (filter (\x -> etapa x == Concluido) xs))

main :: IO ()
main = do
  let obj1 = Atendimento "Deus do Rio" "Banho de Ervas" 100.0 NaFila
      obj2 = Atendimento "Sem-Rosto" "Banho Simples" 50.0 NoBanho
      obj3 = Atendimento "Deus Rabanete" "Banho Especial" 200.0 NaFila
      lista1 = [obj1, obj2, obj3]

  -- Nova lista (a original continua igual)
  let lista2 = [concluir obj1, obj2, concluir obj3]

  -- Exibe as duas listas e os valores arrecadados
  mapM_ (putStrLn . descrever) lista1
  print (arrecadado lista1)
  mapM_ (putStrLn . descrever) lista2
  print (arrecadado lista2)
