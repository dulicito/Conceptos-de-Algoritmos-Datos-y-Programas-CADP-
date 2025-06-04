{ 8. Realizar un programa modularizado que lea secuencia de números enteros. 
La lectura finaliza cuando llega el número 123456, el cual no debe procesarse. 
Informar en pantalla para cada número la suma de sus dígitos pares y la 
cantidad de dígitos impares que posee.}

Program ej8p2;

Procedure procesarNumero(num: String);

Var 
  digito, sumaPares, cantImpares: string;
Begin
  sumaPares := 0;
  cantImpares := 0;

  While num <> 0 Do
    Begin
      digito := num Mod 10;
      If (digito Mod 2 = 0) Then
        sumaPares := sumaPares + digito
      Else
        cantImpares := cantImpares + 1;
      num := num Div 10;
    End;

  writeln('------------------------------------------');
  writeln('Suma de digitos pares: ', sumaPares);
  writeln('Cantidad de digitos impares: ', cantImpares);
End;

Var 
  numero: String;

Begin
  writeln('Ingrese un numero:');
  readln(numero);
  While (numero <> 123456) Do
    Begin
      procesarNumero(numero);
      writeln('Ingrese un numero:');
      readln(numero);
    End;
End.
