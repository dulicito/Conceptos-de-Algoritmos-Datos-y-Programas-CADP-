{ 9. Realizar un programa que lea un carácter, que puede ser “+” (suma) o “-” (resta); si se ingresa otro
carácter, debe informar un error y finalizar. Una vez leído el carácter de suma o resta, deberá leerse
una secuencia de números enteros que finaliza con 0. El programa deberá aplicar la operación leída
con la secuencia de números, e imprimir el resultado final.
Por ejemplo:
○ Si se lee el carácter “-” y la secuencia 4 3 5 -6 0 , deberá imprimir: 2 (4 – 3 – 5 - (-6) )
○ Si se lee el carácter “+” y la secuencia -10 5 6 -1 0, deberá imprimir 0 ( -10 + 5 + 6 + (-1) )}

Program ej9p1;
Var 
  operador: char;
  numero, resultado: integer;
  primerNumero: boolean;

Begin
  //ingresa si va a ser suma o resta 
  write('Ingrese el operador: ');
  readln(operador);
  
  //se fija si ingresaste el operador correctamente, dentro de un if para que en caso contrario se ejecute el begin
  If (operador <> '+') And (operador <> '-') Then
    writeln('ERROR, ahora por tontin no va a andar el programa xD!')
  Else
    Begin
      primerNumero := true;

      writeln('Ingrese una secuencia de numeros enteros finalizada en 0:');
      readln(numero);

      While (numero <> 0) Do
        Begin
          If (primerNumero) Then
            Begin
              resultado := numero;
              primerNumero := false;
            End
          Else
            Begin
              If (operador = '+') Then
                resultado := resultado + numero
              Else
                resultado := resultado - numero;
            End;

          readln(numero);
        End;
      writeln('El resultado final es: ', resultado);
    End;
End.
