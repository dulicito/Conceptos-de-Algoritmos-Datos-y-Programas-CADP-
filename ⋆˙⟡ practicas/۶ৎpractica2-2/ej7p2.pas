{7. 
a. Realizar un módulo que reciba como parámetro un número entero y retorne
la cantidad de dígitos que posee y la suma de los mismos.
b. Utilizando el módulo anterior, realizar un programa que lea una secuencia de
números e imprima la cantidad total de dígitos leídos. La lectura finaliza al leer 
un número cuyos dígitos suman exactamente 10, el cual debe procesarse.}


Program ej7p2;

Var 
  numero, cantTotalDigitos, cantDigitos, sumaDigitos: integer;

Procedure analizarNumero(num: integer; Var cantDigitos: integer; Var sumaDigitos
                         :integer);
Begin
  cantDigitos := 0;
  sumaDigitos := 0;
  //primer caso, valor igual a 0
  If num = 0 Then
    Begin
      cantDigitos := 1;
      sumaDigitos := 0;
    End
  Else //segundo caso, se ingresa una secuencia de numeros (caso mas probable)
    Begin
      While num <> 0 Do
        Begin
          sumaDigitos := sumaDigitos + (num Mod 10);
          num := num Div 10;
          cantDigitos := cantDigitos + 1;
        End;
    End;
End;

Begin
  cantTotalDigitos := 0;

  Repeat
    writeln('Ingrese un numero entero:');
    readln(numero);
    analizarNumero(numero, cantDigitos, sumaDigitos);
    cantTotalDigitos := cantTotalDigitos + cantDigitos;
  Until sumaDigitos = 10;

  writeln('Cantidad total de digitos leidos: ', cantTotalDigitos);
End.
