-- Tipo com campos nomeados
data Esboco = Esboco
  { titulo :: String
  , tecnica :: String
  , horas :: Int
  }

-- Pattern matching na lista
esbocoMaisRecente :: [Esboco] -> String
esbocoMaisRecente [] = "O caderno está vazio."
esbocoMaisRecente (e:_) = titulo e ++ " (" ++ tecnica e ++ ")"

-- Recursão sem length
contarEsbocos :: [Esboco] -> Int
contarEsbocos [] = 0
contarEsbocos (_:xs) = 1 + contarEsbocos xs

-- Recursão sem sum nem map
horasDesenhando :: [Esboco] -> Int
horasDesenhando [] = 0
horasDesenhando (e:xs) = horas e + horasDesenhando xs

main :: IO ()
main = do
  let obj1 =
        [ Esboco "Gárgula" "Nanquim" 5
        , Esboco "Ruínas" "Grafite" 8
        , Esboco "Floresta" "Carvão" 3
        ]

  -- Exibe os dados do caderno
  putStrLn (esbocoMaisRecente obj1)
  print (contarEsbocos obj1)
  print (horasDesenhando obj1)

  -- Caderno vazio
  putStrLn (esbocoMaisRecente [])

  -- Novo caderno com mais um esboço na frente (o anterior continua igual)
  let obj2 = Esboco "Castelo" "Nanquim" 6 : obj1
  putStrLn (esbocoMaisRecente obj2)
  print (contarEsbocos obj2)
  print (contarEsbocos obj1)

  -- Gera erro ao executar (lista vazia), por isso está comentado
  -- putStrLn (titulo (head []))
