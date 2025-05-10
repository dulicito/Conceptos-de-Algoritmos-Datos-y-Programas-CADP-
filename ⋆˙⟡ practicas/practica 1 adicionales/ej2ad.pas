{ Actividad 2: procesamiento de las autoevaluaciones de CADP

La cátedra de CADP está analizando los resultados de las autoevaluaciones que realizaron los
alumnos durante el cuatrimestre. Realizar un programa que lea, para cada alumno, su legajo, su
condición (I para INGRESANTE, R para RECURSANTE), y la nota obtenida en cada una de las 5
autoevaluaciones. Si un alumno no realizó alguna autoevaluación en tiempo y forma, se le cargará la
nota -1. La lectura finaliza al ingresar el legajo -1.

Por ejemplo, si la materia tuviera dos alumnos, un ingresante y un recursante, la lectura podría ser así:
Legajo: 19003
Condición: R
Notas: 8 10 6 -1 8
------------------
Legajo 21020
Condición: I
Notas: 4 0 6 10 -1
------------------
Legajo -1
(Fin de la lectura)

Una vez ingresados todos los datos, el programa debe informar:
- Cantidad de alumnos INGRESANTES en condiciones de rendir el parcial y porcentaje sobre el
total de alumnos INGRESANTES.
- Cantidad de alumnos RECURSANTES en condiciones de rendir el parcial y porcentaje sobre el
total de alumnos RECURSANTES.
- Cantidad de alumnos que aprobaron todas las autoevaluaciones
- Cantidad de alumnos cuya nota promedio fue mayor a 6.5 puntos
- Cantidad de alumnos que obtuvieron cero puntos en al menos una autoevaluación.
- Código de los dos alumnos con mayor cantidad de autoevaluaciones con nota 10 (diez)
- Código de los dos alumnos con mayor cantidad de autoevaluaciones con nota 0 (cero)

Nota: recuerde que, para poder rendir el EXAMEN PARCIAL, el alumno deberá obtener “Presente” en al
menos el 75% del total de las autoevaluaciones propuestas. Se considera “Presente” la autoevaluación que se
entrega en tiempo y forma y con al menos el 40% de respuestas correctas.}











{ no tenemos vida social asi que procedemos a hacer el siguiente ejercicio uwu  }

Program ej2ad;
Const 
  CANT_AUTOEVALUACIONES = 5;

Var 
  legajo: integer;
  condicion: char;
  nota, i: integer;
  sumaNotas, promedio: real;
  cantidadPresentes: integer;

  totalAlumnos: integer;
  totalIngresantes, ingresantesAptos: integer;
  totalRecursantes, recursantesAptos: integer;
  alumnosTodosAprobados: integer;
  alumnosPromedioAlto: integer;
  alumnosConCero: integer;

  notas10, notas0: integer;
  maxnota10_1, maxnota10_2, legajoMaxnota10_1, legajoMaxnota10_2: integer;
  maxnota0_1, maxnota0_2, legajoMaxnota0_1, legajoMaxnota0_2: integer;

Begin
  // Inicializar contadores 
  totalAlumnos := 0;
  totalIngresantes := 0;
  ingresantesAptos := 0;
  totalRecursantes := 0;
  recursantesAptos := 0;
  alumnosTodosAprobados := 0;
  alumnosPromedioAlto := 0;
  alumnosConCero := 0;

  maxnota10_1 := -1;
  maxnota10_2 := -1;
  legajoMaxnota10_1 := -1;
  legajoMaxnota10_2 := -1;
  maxnota0_1 := -1;
  maxnota0_2 := -1;
  legajoMaxnota0_1 := -1;
  legajoMaxnota0_2 := -1;

  //Lectura de datos 
  write('Ingrese legajo: ');
  readln(legajo);

  While legajo <> -1 Do
    Begin
      write('Ingrese condicion del alumno: ');
      readln(condicion);

      sumaNotas := 0;
      cantidadPresentes := 0;
      notas10 := 0;
      notas0 := 0;

      For i := 1 To CANT_AUTOEVALUACIONES Do
        Begin
          write('Ingrese nota de la autoevaluacion ', i, ': ');
          readln(nota);

          sumaNotas := sumaNotas + nota;

          // Se considera "Presente" si tiene 4 o más 
          If nota >= 4 Then
            cantidadPresentes := cantidadPresentes + 1;

          If nota = 10 Then
            notas10 := notas10 + 1;

          If nota = 0 Then
            notas0 := notas0 + 1;
        End;

      promedio := sumaNotas / CANT_AUTOEVALUACIONES;
      totalAlumnos := totalAlumnos + 1;


      // Verifico condicion y si puede rendir el parcial, en ambos casos (ingresante y recursante)
      //OJO, cuando se ingresa por teclado debe ser la letra en MAYUSCULA, sino no te lo toma, aunque es un buen caso limite, bueno ya mucho texto 
      If condicion = 'I' Then
        Begin
          totalIngresantes := totalIngresantes + 1;
          If cantidadPresentes >= 4 Then
            ingresantesAptos := ingresantesAptos + 1;
        End
      Else If condicion = 'R' Then
             Begin
               totalRecursantes := totalRecursantes + 1;
               If cantidadPresentes >= 4 Then
                 recursantesAptos := recursantesAptos + 1;
             End;

      // Aprobó todas las autoevaluaciones ??
      If cantidadPresentes = CANT_AUTOEVALUACIONES Then
        alumnosTodosAprobados := alumnosTodosAprobados + 1;

      // Promedio mayor a 6.5 
      If promedio > 6.5 Then
        alumnosPromedioAlto := alumnosPromedioAlto + 1;

      // Al menos un 0 
      If notas0 > 0 Then
        alumnosConCero := alumnosConCero + 1;

      // Guardar legajos con más 10 
      If notas10 > maxnota10_1 Then
        Begin
          maxnota10_2 := maxnota10_1;
          legajoMaxnota10_2 := legajoMaxnota10_1;
          maxnota10_1 := notas10;
          legajoMaxnota10_1 := legajo;
        End
      Else If notas10 > maxnota10_2 Then
             Begin
               maxnota10_2 := notas10;
               legajoMaxnota10_2 := legajo;
             End;

      //Guardo legajos con mas 0 
      If notas0 > maxnota0_1 Then
        Begin
          maxnota0_2 := maxnota0_1;
          legajoMaxnota0_2 := legajoMaxnota0_1;
          maxnota0_1 := notas0;
          legajoMaxnota0_1 := legajo;
        End
      Else If notas0 > maxnota0_2 Then
             Begin
               maxnota0_2 := notas0;
               legajoMaxnota0_2 := legajo;
             End;

      // Leo proximo legajo,asi no entra en bucle !
      writeln;
      write('Ingrese legajo: ');
      readln(legajo);
    End;

  // imprimo resultados
  writeln('--- RESULTADOS FINALES ---');

  If totalIngresantes > 0 Then
    writeln('Ingresantes aptos: ', ingresantesAptos, ' (', (ingresantesAptos *
            100) / totalIngresantes: 2: 2, '%)')
                                        Else
                                          writeln('No hubo ingresantes.');

  If totalRecursantes > 0 Then
    writeln('Recursantes aptos: ', recursantesAptos, ' (', (recursantesAptos *
            100) / totalRecursantes: 2: 2, '%)')
                                        Else
                                          writeln('No hubo recursantes.');

  writeln('Alumnos que aprobaron todas las autoevaluaciones: ',
          alumnosTodosAprobados);
  writeln('Alumnos con promedio mayor a 6.5: ', alumnosPromedioAlto);
  writeln('Alumnos con al menos un 0: ', alumnosConCero);
  writeln('Dos alumnos con mas notas 10: ', legajoMaxnota10_1, ' (', maxnota10_1
          ,
          ' dieces), ', legajoMaxnota10_2, ' (', maxnota10_2, ' dieces)');
  writeln('Dos alumnos con mas notas 0: ', legajoMaxnota0_1, ' (', maxnota0_1,
          ' ceros), ', legajoMaxnota0_2, ' (', maxnota0_2, ' ceros)');
End.
