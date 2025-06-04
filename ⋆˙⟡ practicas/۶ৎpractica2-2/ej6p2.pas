{6. Realizar un programa modularizado que lea datos de 100 productos de una
tienda de ropa. Para cada producto debe leer el precio, código y tipo (pantalón, 
remera, camisa, medias, campera, etc.). Informar:
● Código de los dos productos más baratos.
● Código del producto de tipo “pantalón” más caro.
● Precio promedio.}


Program ej6p2;

Procedure leerProducto(Var precio: real; Var codigo: integer; Var tipo: String);
Begin
  writeln('Ingrese el precio del producto:');
  readln(precio);
  writeln('Ingrese el codigo del producto:');
  readln(codigo);
  writeln('Ingrese el tipo de producto:');
  readln(tipo);
End;

Procedure actualizarDosMinimos(precio: real; codigo: integer;Var min1, min2:
                               real; Var codMin1, codMin2: integer);
Begin
  If precio < min1 Then
    Begin
      min2 := min1;
      codMin2 := codMin1;
      min1 := precio;
      codMin1 := codigo;
    End
  Else If precio < min2 Then
         Begin
           min2 := precio;
           codMin2 := codigo;
         End;
End;

Procedure actualizarPantalonMasCaro(precio: real; codigo: integer; tipo: String;
                                    Var maxPantalon: real; Var codMaxPantalon:
                                    integer);
Begin
  If (tipo = 'pantalon') And (precio > maxPantalon) Then
    Begin
      maxPantalon := precio;
      codMaxPantalon := codigo;
    End;
End;

Var 
  i, codigo, codMin1, codMin2, codMaxPantalon: integer;
  tipo: string;
  precio, min1, min2, maxPantalon, sumaPrecios, promedio: real;

Begin
  min1 := 99999;
  min2 := 99999;
  maxPantalon := -1;
  sumaPrecios := 0;

  For i := 1 To 100 Do
    Begin
      leerProducto(precio, codigo, tipo);
      sumaPrecios := sumaPrecios + precio;

      actualizarDosMinimos(precio, codigo, min1, min2, codMin1, codMin2);
      actualizarPantalonMasCaro(precio, codigo, tipo, maxPantalon,codMaxPantalon
      );
    End;

  promedio := sumaPrecios / 100;

  writeln('Codigo de los dos productos mas baratos: ', codMin1, ' y ', codMin2
  );

  If maxPantalon <> -1 Then
    writeln('Codigo del pantalon mas caro: ', codMaxPantalon)
  Else
    writeln('No se ingreso ningun pantalon :C');
  writeln('Precio promedio: ', promedio:0:2);
End.
