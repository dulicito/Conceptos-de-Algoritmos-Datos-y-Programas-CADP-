{9. Realizar un programa modularizado que lea información de alumnos de una
facultad. Para cada alumno selee: número de inscripción, apellido y nombre. 
La lectura finaliza cuando se ingresa el alumno con número de inscripción 1200, 
que debe procesarse. Se pide calcular e informar:
● Apellido de los dos alumnos con número de inscripción más chico.
● Nombre de los dos alumnos con número de inscripción más grande.
● Porcentaje de alumnos con nro de inscripción par.}

Program ej9p2;

Procedure LeerDatos(Var nroInscripcion: Integer; Var apellidoNombre: String);
Begin
  Write('Ingrese el numero de inscripcion: ');
  ReadLn(nroInscripcion);
  If nroInscripcion <> 1200 Then
    Begin
      Write('Ingrese el apellido y nombre: ');
      ReadLn(apellidoNombre);
    End;
End;

Procedure ActualizarMinimos(nroInscripcion: Integer; apellidoNombre: String;
                            Var min1, min2: Integer; Var apMin1, apMin2: String)
;
Begin
  If nroInscripcion < min1 Then
    Begin
      min2 := min1;
      apMin2 := apMin1;
      min1 := nroInscripcion;
      apMin1 := apellidoNombre;
    End
  Else If nroInscripcion < min2 Then
         Begin
           min2 := nroInscripcion;
           apMin2 := apellidoNombre;
         End;
End;

Procedure ActualizarMaximos(nroInscripcion: Integer; apellidoNombre: String;
                            Var max1, max2: Integer; Var nomMax1, nomMax2:
                            String);
Begin
  If nroInscripcion > max1 Then
    Begin
      max2 := max1;
      nomMax2 := nomMax1;
      max1 := nroInscripcion;
      nomMax1 := apellidoNombre;
    End
  Else If nroInscripcion > max2 Then
         Begin
           max2 := nroInscripcion;
           nomMax2 := apellidoNombre;
         End;
End;

Function CalcularPorcentajePares(totalAlumnos, pares: Integer): Real;
Begin
  If totalAlumnos > 0 Then
    CalcularPorcentajePares := (pares / totalAlumnos) * 100
  Else
    CalcularPorcentajePares := 0;
End;

Procedure ProcesarAlumnos();

Var 
  nroInscripcion, min1, min2, max1, max2, totalAlumnos, pares: Integer;
  apellidoNombre, apMin1, apMin2, nomMax1, nomMax2: String;
Begin
  min1 := 9999;
  min2 := 9999;
  max1 := -9999;
  max2 := -9999;
  totalAlumnos := 0;
  pares := 0;

  Repeat
    LeerDatos(nroInscripcion, apellidoNombre);
    If nroInscripcion <> 1200 Then
      Begin
        totalAlumnos := totalAlumnos + 1;
        If nroInscripcion Mod 2 = 0 Then
          pares := pares + 1;;

        // Actualizar mínimos y maximos
        ActualizarMinimos(nroInscripcion, apellidoNombre, min1, min2, apMin1,
                          apMin2);
        ActualizarMaximos(nroInscripcion, apellidoNombre, max1, max2, nomMax1,
                          nomMax2);
      End;
  Until nroInscripcion = 1200;

  // Informar resultados
  WriteLn(



    'Apellido y nombre de los dos alumnos con numero de inscripcion mas chico: '
          , apMin1, ' y ', apMin2);
  WriteLn(



   'Apellido y nombre de los dos alumnos con numero de inscripcion mas grande: '
          , nomMax1, ' y ', nomMax2);
  WriteLn('Porcentaje de alumnos con numero de inscripcion par: ',
          CalcularPorcentajePares(totalAlumnos, pares): 0: 2, '%');
End;

Begin
  ProcesarAlumnos();
End.
