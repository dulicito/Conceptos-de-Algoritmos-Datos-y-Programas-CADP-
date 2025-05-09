
Program ej4Bp1;
Var 
  numero, min1, min2: integer;
  
Begin
  min1 := 99999;
  min2 := 99999;

  Repeat
    write('Ingrese un numero entero: ');
    readln(numero);

    If numero <> 0 Then
      Begin
        If numero < min1 Then
          Begin
            min2 := min1;
            min1 := numero;
          End
        Else If numero < min2 Then
               min2 := numero;
      End;

  Until numero = 0;
  writeln('Los dos minimos son: ', min1, ' y ', min2);
End.
