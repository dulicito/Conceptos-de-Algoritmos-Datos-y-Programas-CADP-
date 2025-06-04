{10. Realizar un programa modularizado que lea una secuencia de caracteres y
verifique si cumple con el patrón A$B#, donde:

- A es una secuencia de sólo letras vocales
- B es una secuencia de sólo caracteres alfabéticos sin letras vocales
- los caracteres $ y # seguro existen

Nota: en caso de no cumplir, informar que parte del patrón no se cumplió.}


Program ej10p2;

Function EsVocal(c: Char): Boolean;
Begin
  EsVocal := (c = 'a') Or (c = 'e') Or (c = 'i') Or (c = 'o') Or (c = 'u') Or
             (c = 'A') Or (c = 'E') Or (c = 'I') Or (c = 'O') Or (c = 'U');
End;

Function EsConsonante(c: Char): Boolean;
Begin
  EsConsonante := ((c >= 'a') And (c <= 'z') Or (c >= 'A') And (c <= 'Z')) And
                  Not EsVocal(c);
End;

Procedure VerificarSecuencia(secuencia: String);

Var 
  i: Integer;
  cumple: Boolean;
Begin
  i := 1;
  cumple := True;

  // Verificar A (vocales)
  While (secuencia[i] <> #0) And EsVocal(secuencia[i]) Do
    i := i + 1;

  // Verificar $
  If (secuencia[i] <> #0) And (secuencia[i] = '$') Then
    i := i + 1
  Else
    Begin
      cumple := False;
      WriteLn('Error: Falta el caracter $.');
    End;

  // Verificar B (consonantes)
  While (cumple) And (secuencia[i] <> #0) And EsConsonante(secuencia[i]) Do
    i := i + 1;

  // Verificar #
  If (cumple) And (secuencia[i] <> #0) And (secuencia[i] = '#') Then
    i := i + 1
  Else If cumple Then
         Begin
           cumple := False;
           WriteLn('Falta el caracter #.');
         End;

  // Verificar que no haya más caracteres después de #
  If cumple And (secuencia[i] <> #0) Then
    Begin
      cumple := False;
      WriteLn('La secuencia tiene caracteres adicionales despues de #.')
      ;
    End;

  If cumple Then
    WriteLn('La secuencia cumple con el patron A$B#.');
End;

Var 
  secuencia: String;
Begin
  Write('Ingrese la secuencia de caracteres: ');
  ReadLn(secuencia);
  secuencia := secuencia + #0;
  // Agregar un carácter nulo al final para marcar el fin
  VerificarSecuencia(secuencia);
End.
