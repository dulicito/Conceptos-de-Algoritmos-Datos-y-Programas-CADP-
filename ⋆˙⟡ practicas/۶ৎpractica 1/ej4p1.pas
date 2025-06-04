{4. Realizar un programa que lea un número real X. Luego, deberá leer números reales hasta que se
ingrese uno cuyo valor sea exactamente el doble de X (el primer número leído).}

Program ej4p1;
Var 
  X, num: real;

Begin
  writeln('Ingrese el primer numero:');
  readln(X);

  writeln('Ingrese otro numero:');
  readln(num);

  While (num <> 2 * X) Do
    Begin
      writeln('Ingrese otro numero:');
      readln(num);
    End;
End.
