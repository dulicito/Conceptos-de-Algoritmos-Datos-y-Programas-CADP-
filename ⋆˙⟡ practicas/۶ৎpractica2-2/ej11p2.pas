{11. Realizar un programa modularizado que lea una secuencia de caracteres y
verifique si cumple con el patrón A%B*, donde:

- A es una secuencia de caracteres en la que no existe el carácter ‘$’.
- B es una secuencia con la misma cantidad de caracteres que aparecen en A y en
la que aparece a lo sumo 3 veces el carácter ‘@’.
- Los caracteres % y * seguro existen

Nota: en caso de no cumplir, informar que parte del patrón no se cumplió.}

Program ej11p2;

Procedure VerificarSecuencia(secuencia: String);

Var 
  i, lenA, lenB, cantArroba: Integer;
  cumple: Boolean;
Begin
  i := 1;
  lenA := 0;
  lenB := 0;
  cantArroba := 0;
  cumple := True;

  // Verificar A (antes de % y sin '$')



//uso "#0" para compilarlo en la maleducada, en papel con poner "#" esta bien creo 

  While (secuencia[i] <> #0) And (secuencia[i] <> '%') Do
    Begin
      If secuencia[i] = '$' Then
        Begin
          cumple := False;
          WriteLn('El caracter $ aparece en la parte A');
        End;
      lenA := lenA + 1;
      i := i + 1;
    End;

  // Verificar que exista %
  If (secuencia[i] = #0) Or (secuencia[i] <> '%') Then
    Begin
      cumple := False;
      WriteLn('Falta el caracter %.');
    End
  Else
    i := i + 1;

  // Verificar B (después de % y antes de *)
  While (cumple) And (secuencia[i] <> #0) And (secuencia[i] <> '*') Do
    Begin
      If secuencia[i] = '@' Then
        cantArroba := cantArroba + 1;
      lenB := lenB + 1;
      i := i + 1;
    End;

  // Verificar que exista *
  If (cumple) And ((secuencia[i] = #0) Or (secuencia[i] <> '*')) Then
    Begin
      cumple := False;
      WriteLn('Falta el caracter *');
    End;

  // Verificar cantidad de caracteres en B
  If (cumple) And (lenA <> lenB) Then
    Begin
      cumple := False;
      WriteLn('La cantidad de caracteres en B no coincide con A');
    End;

  // Verificar cantidad de '@' en B
  If (cumple) And (cantArroba > 3) Then
    Begin
      cumple := False;
      WriteLn('En B aparece más de 3 veces el caracter @.');
    End;

  // Verificar que no haya más caracteres después de *
  If (cumple) And (secuencia[i+1] <> #0) Then
    Begin
      cumple := False;
      WriteLn('La secuencia tiene caracteres adicionales despues de *')
      ;
    End;

  If cumple Then
    WriteLn('La secuencia cumple con el patron A%B*.');
End;

Var 
  secuencia: String;
Begin
  Write('Ingrese la secuencia de caracteres: ');
  ReadLn(secuencia);
  secuencia := secuencia + #0;
  // Carácter nulo para marcar el fin
  VerificarSecuencia(secuencia);
End.
