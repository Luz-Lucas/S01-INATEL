Dim pin As Integer
Dim pindigitado As Integer

pin=4321

Input pindigitado

while pindigitado<>pin
    Print "PIN invalido. Tente novamente"
    Input pindigitado

Wend

Print "Transacao autorizada!"

Sleep