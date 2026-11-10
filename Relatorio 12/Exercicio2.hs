-- Valor constante
pesoMaximo :: Double
pesoMaximo = 15.0

-- Gera erro (definição duplicada) e o programa nem compila, por isso está comentado
-- pesoMaximo = 20.0

-- Tipo com campos nomeados
data Encomenda = Encomenda
  { destinatario :: String
  , peso :: Double
  , frete :: Double
  }

-- Retorna texto usando as funções de campo
descrever :: Encomenda -> String
descrever e =
  destinatario e ++ " - " ++ show (peso e) ++ " kg - R$ " ++ show (frete e)

-- Filtra usando lambda
cabeNaVassoura :: [Encomenda] -> [Encomenda]
cabeNaVassoura xs = filter (\x -> peso x <= pesoMaximo) xs

-- Soma usando map e sum
totalDeFretes :: [Encomenda] -> Double
totalDeFretes xs = sum (map frete xs)

main :: IO ()
main = do
  let lista =
        [ Encomenda "Padaria" 5.0 10.0
        , Encomenda "Pintor" 20.0 30.0
        , Encomenda "Vovó" 3.5 8.0
        , Encomenda "Ferreiro" 18.0 25.0
        ]

  -- Exibe todas
  mapM_ (putStrLn . descrever) lista

  -- Exibe as que cabem
  mapM_ (putStrLn . descrever) (cabeNaVassoura lista)

  -- Exibe o total
  print (totalDeFretes (cabeNaVassoura lista))
