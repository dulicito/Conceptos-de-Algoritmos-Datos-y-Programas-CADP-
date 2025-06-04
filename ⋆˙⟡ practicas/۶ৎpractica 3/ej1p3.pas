{a. Completar el programa principal para que lea información de alumnos 
(código,nombre,promedio) e informe la cantidad de alumnos leídos. 
La lectura finaliza cuando ingresa un alumno con código 0, que no debe
procesarse. 

Nota: utilizar el módulo leer. b. Modificar al programa anterior para que, 
al finalizar la lectura de todos los alumnos, se informe también el
nombre del alumno con mejor promedio.}


Program ej1p3;

Type 
  str20 = string[20];
  alumno = Record
    codigo : integer;
    nombre : str20;
    promedio : real;
  End;

Procedure leer(Var alu : alumno);
Begin
  writeln('Ingrese el codigo del alumno');
  readln(alu.codigo);
  If (alu.codigo <> 0) Then
    Begin
      writeln('Ingrese el nombre del alumno');
      readln(alu.nombre);
      writeln('Ingrese el promedio del alumno');
      readln(alu.promedio);
    End;
End;

// Módulo para actualizar el mejor promedio y nombre
Procedure actualizarMejorPromedio(alu: alumno; Var mejorProm: real; Var
                                  mejorNombre: str20);
Begin
  If (alu.promedio > mejorProm) Then
    Begin
      mejorProm := alu.promedio;
      mejorNombre := alu.nombre;
    End;
End;

Var 
  a : alumno;
  cant : integer;
  mejorProm : real;
  mejorNombre : str20;
Begin
  cant := 0;
  mejorProm := -999;
  // Suponiendo que los promedios son >= 0
  leer(a);
  While (a.codigo <> 0) Do
    Begin
      cant := cant + 1;
      actualizarMejorPromedio(a, mejorProm, mejorNombre);
      leer(a);
    End;
  writeln('Cantidad de alumnos leidos: ', cant);
  If cant > 0 Then
    writeln('El alumno con mejor promedio es: ', mejorNombre);
End.
