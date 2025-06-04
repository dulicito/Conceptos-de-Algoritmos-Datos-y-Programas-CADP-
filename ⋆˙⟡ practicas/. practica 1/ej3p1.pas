{3. Realizar un programa que lea 3 números enteros y los imprima en orden descendente.
Por ejemplo, si se ingresan los valores 4, -10 y 12, deberá imprimir: 12 4 -10}


Program ej3p1;
Var 
  num1, num2, num3: integer;

Begin
  writeln('Ingrese el primer numero:');
  readln(num1);

  writeln('Ingrese el segundo numero:');
  readln(num2);

  writeln('Ingrese el tercer numero:');
  readln(num3);

  If (num1 >= num2) And (num1 >= num3) Then
    Begin
      write(num1, ' '); // recordatorio: ' '  es para el espacio en blanco 
      If (num2 >= num3) Then
        writeln(num2, ' ', num3)
      Else
        writeln(num3, ' ', num2);
    End
  Else If (num2 >= num1) And (num2 >= num3) Then
         Begin
           write(num2, ' ');
           If (num1 >= num3) Then
             writeln(num1, ' ', num3)
           Else
             writeln(num3, ' ', num1);
         End
  Else
    Begin
      write(num3, ' ');
      If (num1 >= num2) Then
        writeln(num1, ' ', num2)
      Else
        writeln(num2, ' ', num1);
    End;
End.
