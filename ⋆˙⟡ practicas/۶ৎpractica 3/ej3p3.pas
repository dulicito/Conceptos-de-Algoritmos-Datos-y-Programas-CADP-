{3. El Ministerio de Educación desea realizar un relevamiento de las 2400 escuelas primarias de la provincia de Bs. As,
con el objetivo de evaluar si se cumple la proporción de alumnos por docente calculada por la UNESCO para el año
2015 (1 docente cada 23,435 alumnos). Para ello, se cuenta con información de: CUE (código único de
establecimiento), nombre del establecimiento, cantidad de docentes, cantidad de alumnos, localidad. Se pide
implementar un programa que procese la información y determine:
● Cantidad de escuelas de La Plata con una relación de alumnos por docente superior a la sugerida por UNESCO.
● CUE y nombre de las dos escuelas con mejor relación entre docentes y alumnos.
El programa debe utilizar:
a) Un módulo para la lectura de la información de la escuela.
b) Un módulo para determinar la relación docente-alumno (esa relación se obtiene del cociente entre la cantidad
de alumnos y la cantidad de docentes).}



Program ej3p3;

Type 
  escuela = Record
    cue: integer;
    nombre_est: string;
    cant_docentes: integer;
    cant_alumnos: integer;
    localidad: string;
  End;

{modulo que realiza inciso A, lee cada campo del registro}

Procedure leerEscuela(Var e: escuela);
Begin
  writeln('Ingrese CUE:');
  readln(e.cue);
  writeln('Ingrese nombre:');
  readln(e.nombre_est);
  writeln('Ingrese cantidad de docentes:');
  readln(e.cant_docentes);
  writeln('Ingrese cantidad de alumnos:');
  readln(e.cant_alumnos);
  writeln('Ingrese localidad:');
  readln(e.localidad);
End;

{modulo que realiza inciso B del enunciado}
Function relacionAluDoc(e: escuela): real;
Begin
  If e.cant_docentes <> 0 Then
    relacionAluDoc := e.cant_alumnos / e.cant_docentes
  Else
    relacionAluDoc := 0;
End;

Var 
  i, cantLaPlata: integer;
  e: escuela;
  rel: real;
  max1, max2: real;
  cue1, cue2: integer;
  nom1, nom2: string;

Begin
  cantLaPlata := 0;
  {maximos inicializados en el valor mas minimo posible}
  max1 := -99999;
  max2 := -99999;
  cue1 := 0;
  cue2 := 0;
  nom1 := '';
  nom2 := '';
  For i := 1 To 2400 Do
    Begin
      leerEscuela(e);
      rel := relacionAluDoc(e);
      // Punto 1: Escuelas de La Plata con relación superior a la UNESCO
      If (e.localidad = 'La Plata') And (rel > 23.435) Then
        cantLaPlata := cantLaPlata + 1;
      // Punto 2: Dos mejores relaciones (menor relación es mejor)
      If (max1 = -1) Or (rel < max1) Then
        Begin
          max2 := max1;
          cue2 := cue1;
          nom2 := nom1;
          max1 := rel;
          cue1 := e.cue;
          nom1 := e.nombre_est;
        End
      Else If (max2 = -1) Or (rel < max2) Then
             Begin
               max2 := rel;
               cue2 := e.cue;
               nom2 := e.nombre_est;
             End;
    End;
  writeln('Cantidad de escuelas de La Plata con relación superior a la UNESCO: ', cantLaPlata);
  writeln('Escuela con mejor relación: CUE=', cue1, ', Nombre=', nom1);
  writeln('Escuela con segunda mejor relación: CUE=', cue2, ', Nombre=', nom2);
End.