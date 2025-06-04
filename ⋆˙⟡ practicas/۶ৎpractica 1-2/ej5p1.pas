{5. Realizar un programa que lea números enteros desde teclado. La lectura debe finalizar cuando se
ingrese el número 100, el cual debe procesarse. Informar en pantalla:
◦ El número máximo leído.
◦ El número mínimo leído.
◦ La suma total de los números leídos.}


Program ej5p1;
Var 
  numero, maximo, minimo, suma: integer;
  
Begin
  suma := 0;
  maximo := -9999;
  minimo := 99999;

  Repeat
    write('Ingrese un numero entero: ');
    readln(numero);

    suma := suma + numero;

    If numero > maximo Then
      maximo := numero;

    If numero < minimo Then
      minimo := numero;
  Until numero = 100;

  writeln('Numero maximo leido: ', maximo);
  writeln('Numero minimo leido: ', minimo);
  writeln('Suma total de los numeros: ', suma);
End.
