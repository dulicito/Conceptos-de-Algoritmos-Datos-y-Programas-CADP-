{7. Realizar un programa que lea información de centros de investigación de 
Universidades Nacionales. De cada centro se lee su nombre abreviado (ej. LIDI, 
LIFIA, LINTI), la universidad a la que pertenece, la cantidad de investigadores 
y la cantidad de becarios que poseen. La información se lee de forma consecutiva 
por universidad y la lectura finaliza al leer un centro con 0 investigadores, 
que no debe procesarse. Informar:

● Cantidad total de centros para cada universidad.
● Universidad con mayor cantidad de investigadores en sus centros.
● Los dos centros con menor cantidad de becarios.}


Program ej7p3;

Type 
  centro = Record
    nombre: string;
    universidad: string;
    investigadores: integer;
    becarios: integer;
  End;

{ Módulo para leer los datos de un centro }
Procedure leerCentro(Var c: centro);
Begin
  writeln('Ingrese nombre del centro:');
  readln(c.nombre);
  writeln('Ingrese universidad:');
  readln(c.universidad);
  writeln('Ingrese cantidad de investigadores:');
  readln(c.investigadores);
  If c.investigadores <> 0 Then
    Begin
      writeln('Ingrese cantidad de becarios:');
      readln(c.becarios);
    End;
End;

{ Módulo para actualizar los dos centros con menor cantidad de becarios }
Procedure actualizarMinimos(c: centro; Var min1, min2: integer; Var nom1, nom2:
                            String);
Begin
  If c.becarios < min1 Then
    Begin
      min2 := min1;
      nom2 := nom1;
      min1 := c.becarios;
      nom1 := c.nombre;
    End
  Else If c.becarios < min2 Then
         Begin
           min2 := c.becarios;
           nom2 := c.nombre;
         End;
End;


{programa principal}

Var 
  c: centro;
  univActual: string;
  cantCentros, maxInvestigadores, totalInvestigadores: integer;
  univMax: string;
  minBec1, minBec2: integer;
  nomMin1, nomMin2: string;
Begin
  maxInvestigadores := -99999;
  univMax := '';
  minBec1 := 9999;
  minBec2 := 9999;
  nomMin1 := '';
  nomMin2 := '';

  leerCentro(c);
  While c.investigadores <> 0 Do
    Begin
      univActual := c.universidad;
      cantCentros := 0;
      totalInvestigadores := 0;
      While (c.investigadores <> 0) And (c.universidad = univActual) Do
        Begin
          cantCentros := cantCentros + 1;
          totalInvestigadores := totalInvestigadores + c.investigadores;
          actualizarMinimos(c, minBec1, minBec2, nomMin1, nomMin2);
          leerCentro(c);
        End;
      writeln('Universidad ', univActual, ': ', cantCentros, ' centros.');
      If totalInvestigadores > maxInvestigadores Then
        Begin
          maxInvestigadores := totalInvestigadores;
          univMax := univActual;
        End;
    End;

  writeln('Universidad con mayor cantidad de investigadores en sus centros: ',univMax);
  writeln('Centro con menor cantidad de becarios: ', nomMin1, ' (', minBec1, ')');
  writeln('Centro con segunda menor cantidad de becarios: ', nomMin2, ' (',minBec2, ')');
End.
