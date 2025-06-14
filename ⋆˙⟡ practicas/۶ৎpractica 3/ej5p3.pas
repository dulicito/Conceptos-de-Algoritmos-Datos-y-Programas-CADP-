{5. Realizar un programa que lea información de autos que están a la venta en una 
concesionaria. De cada auto se lee:
marca, modelo y precio. La lectura finaliza cuando se ingresa la marca “ZZZ” que 
no debe procesarse. La información se ingresa ordenada por marca. Se pide calcular e informar:

a. El precio promedio por marca.
b. Marca y modelo del auto más caro.}


Program ej5p3;

Type 
  auto = Record
    marca: string;
    modelo: string;
    precio: real;
  End;

{ Modulo para leer un auto (lee cada campo del registro)}
Procedure leerAuto(Var a: auto);
Begin
  writeln('Ingrese marca:');
  readln(a.marca);
  If a.marca <> 'ZZZ' Then
    Begin
      writeln('Ingrese modelo:');
      readln(a.modelo);
      writeln('Ingrese precio:');
      readln(a.precio);
    End;
End;

{programa principal encargado de leer autos hasta que se lea zzz}

Var 
  a: auto;
  marcaActual: string;
  sumaPrecio, precioMax: real;
  cantPorMarca: integer;
  modeloMax, marcaMax: string;
Begin
  precioMax := -999999;
  leerAuto(a);
{aplico la condicion en mayuscula y minuscula,ya que el 
usuario puede ingresar cualquiera de las dos}
  While (a.marca <> 'ZZZ') Or (a.marca <> 'zzz') Do
    Begin
      marcaActual := a.marca;
      sumaPrecio := 0;
      cantPorMarca := 0;
      While (a.marca = marcaActual) And ((a.marca <> 'ZZZ') Or (a.marca <> 'zzz'
            )) Do
        Begin
          sumaPrecio := sumaPrecio + a.precio;
          cantPorMarca := cantPorMarca + 1;
          If a.precio > precioMax Then
            Begin
              precioMax := a.precio;
              modeloMax := a.modelo;
              marcaMax := a.marca;
            End;
          leerAuto(a);
        End;
      If cantPorMarca > 0 Then
        writeln('Precio promedio para la marca ', marcaActual, ': $', (sumaPrecio/cantPorMarca): 0: 2);
    End;
  If precioMax > -1 Then
    writeln('El auto más caro es: Marca=', marcaMax, ', Modelo=', modeloMax,', Precio=$', precioMax:0:2);
End.
