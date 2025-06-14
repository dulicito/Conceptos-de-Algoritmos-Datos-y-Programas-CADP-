{8. La Comisión Provincial por la Memoria desea analizar la información de los 
proyectos presentados en el programa Jóvenes y Memoria durante la convocatoria 
2020. Cada proyecto posee un código único, un título, el docente coordinador 
(DNI, nombre y apellido, email), la cantidad de alumnos que participan del proyecto, 
el nombre de la escuela y la localidad a la que pertenecen. Cada escuela puede 
presentar más de un proyecto. La información se ingresa ordenada consecutivamente 
por localidad y, para cada localidad, por escuela. Realizar un programa que lea la 
información de los proyectos hasta que se ingrese el proyecto con código -1
(que no debe procesarse), e informe:

● Cantidad total de escuelas que participan en la convocatoria 2018 y cantidad de 
escuelas por cada localidad.
● Nombres de las dos escuelas con mayor cantidad de alumnos participantes.
● Título de los proyectos de la localidad de Daireaux cuyo código posee igual 
cantidad de dígitos pares e impares.}


Program ej8p3;

Type 
  docente = Record
    dni: integer;
    nombreApellido: string;
    email: string;
  End;
  proyecto = Record
    codigo: integer;
    titulo: string;
    coord: docente;
    cantAlumnos: integer;
    escuela: string;
    localidad: string;
  End;


{Modulo para leer un proyecto}
Procedure leerProyecto(Var p: proyecto);
Begin
  writeln('Ingrese codigo de proyecto:');
  readln(p.codigo);
  If p.codigo <> -1 Then
    Begin
      writeln('Ingrese titulo:');
      readln(p.titulo);
      writeln('Ingrese DNI del docente coordinador:');
      readln(p.coord.dni);
      writeln('Ingrese nombre y apellido del docente:');
      readln(p.coord.nombreApellido);
      writeln('Ingrese email del docente:');
      readln(p.coord.email);
      writeln('Ingrese cantidad de alumnos:');
      readln(p.cantAlumnos);
      writeln('Ingrese nombre de la escuela:');
      readln(p.escuela);
      writeln('Ingrese localidad:');
      readln(p.localidad);
    End;
End;


{ Módulo para verificar si un código tiene igual cantidad de digitos pares e impares}
Function codParesImparesIguales(codigo: integer): boolean;
Var 
  pares, impares, dig: integer;
Begin
  pares := 0;
  impares := 0;
  {si el codigo es negativo, lo paso a positivo}
  If codigo < 0 Then
    codigo := codigo * -1;
  While codigo <> 0 Do
    Begin
      dig := codigo Mod 10;
      If dig Mod 2 = 0 Then
        pares := pares + 1
      Else
        impares := impares + 1;
      codigo := codigo Div 10;
    End;
  codParesImparesIguales := pares = impares;
End;


{ Modulo para actualizar las dos escuelas con mayor cantidad de alumnos}
Procedure actualizarMaximos(escuela: String; cant: integer; Var max1, max2:integer; Var esc1, esc2: String);
Begin
  If cant > max1 Then
    Begin
      max2 := max1;
      esc2 := esc1;
      max1 := cant;
      esc1 := escuela;
    End
  Else If cant > max2 Then
         Begin
           max2 := cant;
           esc2 := escuela;
         End;
End;

{Modulo para procesar todos los proyectos de una escuela}

Procedure procesarEscuela(Var p: proyecto; localidadActual: String; Var alumnosEscuela: integer; Var proyectosDaireaux:integer);
Var 
  escuelaActual: string;
Begin
  escuelaActual := p.escuela;
  alumnosEscuela := 0;
  While (p.codigo <> -1) And (p.localidad = localidadActual) And (p.escuela =
        escuelaActual) Do
    Begin
      alumnosEscuela := alumnosEscuela + p.cantAlumnos;
// Título de los proyectos de Daireaux con igual cantidad de dígitos pares e impares
      If (p.localidad = 'Daireaux') And codParesImparesIguales(p.codigo) Then
        Begin
          writeln('Proyecto de Daireaux con igual cantidad de digitos pares e impares: ', p.titulo);
          proyectosDaireaux := proyectosDaireaux + 1;
        End;
      leerProyecto(p);
    End;
End;

{Modulo para procesar todos los proyectos de una localidad}
Procedure procesarLocalidad(Var p: proyecto; Var totalEscuelas: integer; Var max1, max2: integer; Var esc1, esc2: String; Var proyectosDaireaux: integer);
Var 
  localidadActual: string;
  escuelasLocalidad, alumnosEscuela: integer;
Begin
  localidadActual := p.localidad;
  escuelasLocalidad := 0;
  While (p.codigo <> -1) And (p.localidad = localidadActual) Do
    Begin
      procesarEscuela(p, localidadActual, alumnosEscuela, proyectosDaireaux);
      escuelasLocalidad := escuelasLocalidad + 1;
      totalEscuelas := totalEscuelas + 1;
      actualizarMaximos(p.escuela, alumnosEscuela, max1, max2, esc1, esc2);
    End;
  writeln('Cantidad de escuelas en la localidad ', localidadActual, ': ',escuelasLocalidad);
End;

{Programa principal}

Var 
  p: proyecto;
  totalEscuelas, max1, max2, proyectosDaireaux: integer;
  esc1, esc2: string;
Begin
  totalEscuelas := 0;
  max1 := -9999;
  max2 := -9999;
  esc1 := '';
  esc2 := '';
  proyectosDaireaux := 0;

  leerProyecto(p);
  While p.codigo <> -1 Do
    procesarLocalidad(p, totalEscuelas, max1, max2, esc1, esc2,proyectosDaireaux);
  writeln('Cantidad total de escuelas que participan: ', totalEscuelas);
  writeln('Escuela con mayor cantidad de alumnos: ', esc1);
  writeln('Escuela con segunda mayor cantidad de alumnos: ', esc2);
  If proyectosDaireaux = 0 Then
    writeln('No hubo proyectos de Daireaux con igual cantidad de digitos pares e impares en el codigo.');
End.





{nota: programa principal lo mejor modularizado posible, pero aun asi
quedo re largo :C, F}
