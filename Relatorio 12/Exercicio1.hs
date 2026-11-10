-- Tipo com campos posicionais
data Cafe = Cafe String Double Int

-- Retorna texto (pattern matching no parâmetro)
descrever :: Cafe -> String
descrever (Cafe nome preco _) = nome ++ " - R$ " ++ show preco

-- Classifica usando guards
forca :: Cafe -> String
forca (Cafe _ _ intensidade)
  | intensidade >= 8 = "Forte"
  | intensidade >= 5 = "Equilibrado"
  | otherwise = "Suave"

-- Calcula usando if
precoDoPedido :: Bool -> Cafe -> Double
precoDoPedido leite (Cafe _ preco _) =
  if leite then preco + 2.0 else preco

main :: IO ()
main = do
  let obj1 = Cafe "Espresso" 8.0 9
      obj2 = Cafe "Café Coado" 6.5 6
      obj3 = Cafe "Café com Leite" 7.0 3
      lista = [obj1, obj2, obj3]

  -- Exibe cada elemento
  mapM_ (\x -> putStrLn (descrever x ++ " - " ++ forca x)) lista

  -- Exibe com e sem leite
  print (precoDoPedido True obj1)
  print (precoDoPedido False obj1)
