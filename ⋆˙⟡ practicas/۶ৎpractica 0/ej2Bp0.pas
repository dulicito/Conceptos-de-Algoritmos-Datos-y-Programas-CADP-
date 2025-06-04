{2. Modifique el programa anterior para que el mensaje de salida muestre la suma de ambos
números:
a. Utilizando una variable adicional
b. Sin utilizar una variable adicional}


Program ej2Bp0;
Var 
  num1, num2: integer;

Begin
  writeln('Ingrese el primer numero:');
  readln(num1);
  writeln('Ingrese el segundo numero:');
  readln(num2);
  writeln('La suma de los valores es ', num1 + num2);
  readln;
End.
