{1. Implemente un programa que lea por teclado dos números enteros e imprima en pantalla los
valores leídos en orden inverso. Por ejemplo, si se ingresan los números 4 y 8, debe mostrar el
mensaje: Se ingresaron los valores 8 y 4}

Program  ej1p0;
Var
  num1, num2: integer;
  
Begin
  writeln('Ingrese el primer numero:');
  readln(num1);
  writeln('Ingrese el segundo numero:');
  readln(num2);
  writeln('Se ingresaron los valores ', num2, ' y ', num1);
End.
