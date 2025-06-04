{5. 
a. Realizar un módulo que reciba un par de números (numA,numB) y retorne si 
numB es el doble de numA.
b. Utilizando el módulo realizado en el inciso a., realizar un programa que lea
secuencias de pares de números hasta encontrar el par (0,0), e informe la 
cantidad total de pares de números leídos y la cantidad de pares en las que numB 
es el doble de numA.}

Program ej5p2;

Function esDoble(numA, numB: integer): boolean;
Begin
  esDoble := (numB = 2 * numA);
End;

Var 
  numA, numB: integer;
  totalPares, paresDobles: integer;

Begin
  totalPares := 0;
  paresDobles := 0;

  Repeat
    readln(numA, numB);  { Leer un par de números }
    If (numA <> 0) Or (numB <> 0) Then
      Begin
        totalPares := totalPares + 1;
        If esDoble(numA, numB) Then
          paresDobles := paresDobles + 1;
      End;
  Until (numA = 0) And (numB = 0);

  writeln('Total de pares leidos: ', totalPares);
  writeln('Cantidad de pares donde B es el doble de A: ', paresDobles);
End.
