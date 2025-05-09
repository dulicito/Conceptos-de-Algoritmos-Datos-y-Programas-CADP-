{6. Realizar un programa que lea el número de legajo y el promedio de cada alumno de la facultad. La
lectura finaliza cuando se ingresa el legajo -1, que no debe procesarse.
Por ejemplo, se lee la siguiente secuencia:
33423
8.40
19003
6.43
-1
En el ejemplo anterior, se leyó el legajo 33422, cuyo promedio fue 8.40, luego se leyó el legajo
19003, cuyo promedio fue 6.43, y finalmente el legajo -1 (para el cual no es necesario leer un
promedio).
Al finalizar la lectura, informar:
a. La cantidad de alumnos leída (en el ejemplo anterior, se debería informar 2).
b. La cantidad de alumnos cuyo promedio supera 6.5 (en el ejemplo anterior, se debería informar
1).
c. El porcentaje de alumnos destacados (alumnos con promedio mayor a 8.5) cuyo legajo sean
menor al valor 2500 (en el ejemplo anterior se debería informar 0%).}


Program ej6p1;
Var 
  legajo: integer;
  promedio: real;
  contadorTotal, contadorSuperior65, contadorDestacados: integer;
  porcentajeDestacados: real;

Begin
  contadorTotal := 0;
  contadorSuperior65 := 0;
  contadorDestacados := 0;

  writeln('Ingrese el numero de legajo:');
  readln(legajo);

  While (legajo <> -1) Do
    Begin
      writeln('Ingrese el promedio del alumno:');
      readln(promedio);

      contadorTotal := contadorTotal + 1;

      If (promedio > 6.5) Then
        contadorSuperior65 := contadorSuperior65 + 1;

      If (promedio > 8.5) And (legajo < 2500) Then
        contadorDestacados := contadorDestacados + 1;

      writeln('Ingrese el numero de legajo:');
      readln(legajo);
    End;

  writeln('Cantidad de alumnos leidos: ', contadorTotal);
  writeln('Cantidad de alumnos con promedio superior a 6.5: ',contadorSuperior65
  );

  If (contadorTotal > 0) Then
    Begin
      porcentajeDestacados := (contadorDestacados / contadorTotal) * 100;
      writeln('Porcentaje de alumnos destacados: ', porcentajeDestacados:2:2,'%'
      );
    End
  Else
    writeln('No se han leido datos de alumnos');
End.
