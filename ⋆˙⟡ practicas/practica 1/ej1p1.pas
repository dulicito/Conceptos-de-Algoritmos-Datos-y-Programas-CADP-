{1. Realizar un programa que lea 2 números enteros desde teclado e informe en pantalla cuál de los
dos números es el mayor. Si son iguales debe informar en pantalla lo siguiente: “Los números leídos
son iguales”.}


Program ej1p1;
Var 
  num1, num2: integer;

Begin
  writeln('Ingrese el primer numero:');
  readln(num1);

  writeln('Ingrese el segundo numero:');
  readln(num2);

  If (num1 > num2) Then
    writeln('El primer numero ', num1, ' es mayor')
  Else If (num1 < num2) Then
         writeln('El segundo numero ', num2, ' es mayor')
  Else
    writeln('Los numeros leidos son iguales');
End.
