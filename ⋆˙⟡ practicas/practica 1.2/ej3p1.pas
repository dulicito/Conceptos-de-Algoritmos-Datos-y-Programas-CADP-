{3. Realizar un programa que lea desde teclado la información de alumnos ingresantes a la carrera
Analista en TIC. De cada alumno se lee nombre y nota obtenida en el módulo EPA (la nota es un
número entre 1 y 10). La lectura finaliza cuando se lee el nombre “Zidane Zinedine“, que debe
procesarse. Al finalizar la lectura informar:
- La cantidad de alumnos aprobados (nota 8 o mayor) y
- la cantidad de alumnos que obtuvieron un 7 como nota.}


Program ej3p1;
Var 
  nombre: string;
  nota: integer;//asumo que nota es un num entero 
  aprobados, conSiete: integer;
  
Begin
  aprobados := 0;
  conSiete := 0;//utilizo repeat-until ya que me guarda el ultimo dato ingresado
  Repeat
    write('Ingrese el nombre del alumno: ');
    readln(nombre);
    write('Ingrese la nota obtenida (1 a 10): ');

//nota: nota podria englobarse en un subrango asi el usuario no ingresa por ejemplo un "-5"
    readln(nota);

    If nota >= 8 Then
      aprobados := aprobados + 1
    Else If nota = 7 Then
           conSiete := conSiete + 1;

  Until nombre = 'Zidane Zinedine';

  writeln('Cantidad de alumnos aprobados: ', aprobados);
  writeln('Cantidad de alumnos que obtuvieron un 7: ', conSiete);
End.
