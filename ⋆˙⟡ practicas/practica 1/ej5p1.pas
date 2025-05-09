{5. Modifique el ejercicio anterior para que, luego de leer el número X, se lean a lo sumo 10 números
reales. La lectura deberá finalizar al ingresar un valor que sea el doble de X, o al leer el décimo
número, en cuyo caso deberá informarse “No se ha ingresado el doble de X”.}

Program ej5p1;
Var 
  X, num: real;
  contador: integer;
  encontrado: boolean;

Begin
  writeln('Ingrese el primer numero:');
  readln(X);

  contador := 0;
  encontrado := false;

  While (contador < 10) And (Not encontrado) Do
    Begin
      writeln('Ingrese otro numero:');
      readln(num);
      contador := contador + 1;

      If (num = 2 * X) Then
        Begin
          writeln('El numero ', num:2:2, ' es el doble de ', X:2:2);
          encontrado := true;  { Establecemos la flag en true :P }
        End;
    End;

  If (Not encontrado) Then
    writeln('No se ha ingresado el doble de X');
End.
