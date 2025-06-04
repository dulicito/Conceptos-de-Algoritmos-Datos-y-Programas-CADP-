{6. Realizar un programa que lea información de 200 productos de un supermercado. De cada producto
se lee código y precio (cada código es un número entre 1 y 200). Informar en pantalla:
- Los códigos de los dos productos más baratos.
- La cantidad de productos de más de 16 pesos con código par.}


Program ej6p1;
Type 
  cod = 1..200;

Var 
  codigo: cod;
  i, codMin1, codMin2, cantMayor16Par: integer;
  precio, min1, min2: real;
  
Begin
  min1 := 9999;
  min2 := 9999;
  codMin1 := -99999;
  codMin2 := -99999;
  cantMayor16Par := 0;

  For i := 1 To 200 Do
    Begin
      writeln('Producto ', i, ':');
      write('Ingrese el codigo: ');
      readln(codigo);
      write('Ingrese el precio: ');
      readln(precio);

      // Busca los dos productos más baratos 
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

      // suma prod > 16 con cod par
      If (precio > 16) And (codigo Mod 2 = 0) Then
        cantMayor16Par := cantMayor16Par + 1;

    End;

  writeln('Los dos productos mas baratos tienen los codigos: ', codMin1, ' y '
          , codMin2);
  writeln('Cantidad de productos de más de $16 con codigo par: ',
          cantMayor16Par);
End.
