{2. Realice un programa que lea 10 números e informe cuál fue el mayor número leído. Por ejemplo, si
se lee la secuencia:

3 5 6 2 3 10 98 8 -12 9
deberá informar: “El mayor número leído fue el 98”

a. Modifique el programa anterior para que, además de informar el mayor número leído, se
informe el número de orden, dentro de la secuencia, en el que fue leído. Por ejemplo, si se lee la
misma secuencia:

3 5 6 2 3 10 98 8 -12 9
deberá informar: “El mayor número leído fue el 98, en la posición 7”}



Program ej2p1;
Var 
  i, numero, max, posicion: integer;
  
Begin
  max := -99999; //inicializado en valor bajo para que se actualice si o si 
  posicion := 0;

  For i := 1 To 10 Do
    Begin
      write('Ingrese un numero entero: ');
      readln(numero);
      If numero > max Then
        Begin
          max := numero;//actualizo max
          posicion := i; //guardo posicion
        End;
    End;

  writeln('El mayor numero leido es: ', max, ', en la posicion ', posicion);
End.
