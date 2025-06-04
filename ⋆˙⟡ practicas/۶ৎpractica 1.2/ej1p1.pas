{1. Realizar un programa que lea 10 números enteros e informe la suma total de los números leídos.
a. Modifique el ejercicio 1 para que además informe la cantidad de números mayores a 5.}


Program ej1p1;
Var 
  i, numero, suma, mayoresA5: integer;
  
Begin
  suma := 0;
  mayoresA5 := 0;
  For i := 1 To 10 Do
    Begin
      write('Ingrese un numero entero: ');
      readln(numero);
      suma := suma + numero;
      If numero > 5 Then
        mayoresA5 := mayoresA5 + 1;
    End;
    
  writeln('La suma total de los numeros en total es: ', suma);
  writeln('Cantidad de numeros mayores a 5: ', mayoresA5);
End.
