{ 2. Realizar un programa que lea un número real e imprima su valor absoluto. El valor absoluto de un
número X, se escribe |X| y se define como:
|X| = X cuando X es mayor o igual a cero
|X| = -X cuando X es menor a cero}

Program ej2p1;
Var 
  num: real;

Begin
  writeln('Ingrese un numero real:');
  readln(num);
  If (num >= 0) Then
    writeln('El valor absoluto de ', num:2:2, ' es ', num:2:2)
  Else
    writeln('El valor absoluto de ', num:2:2, ' es ', -num:2:2);
End.
