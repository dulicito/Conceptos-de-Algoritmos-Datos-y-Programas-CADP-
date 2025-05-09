{4. Realizar un programa que lea 1000 números enteros desde teclado. Informar en pantalla cuáles son
los dos números mínimos leídos.
a. Modifique el ejercicio anterior para que, en vez de leer 1000 números, la lectura finalice al leer
el número 0, el cual debe procesarse.
b. Modifique el ejercicio anterior para que, en vez de leer 1000 números, la lectura finalice al leer
el número 0, el cual no debe procesarse}


Program ej4Ap1;
Var 
  numero, min1, min2: integer;
  
Begin
  min1 := 99999;
  min2 := 99999;

  Repeat
    write('Ingrese un numero entero: ');
    readln(numero);

    If numero < min1 Then
      Begin
        min2 := min1;
        min1 := numero;
      End
    Else If numero < min2 Then
           min2 := numero;
  Until numero = 0;

  writeln('Los dos minimos son: ', min1, ' y ', min2);
End.
