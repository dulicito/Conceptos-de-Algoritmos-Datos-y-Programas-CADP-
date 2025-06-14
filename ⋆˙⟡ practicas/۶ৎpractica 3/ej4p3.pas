{4. Una compañía de telefonía celular debe realizar la facturación mensual de sus 
9300 clientes con planes de consumo ilimitados (clientes que pagan por lo que consumen). 
Para cada cliente se conoce su código de cliente y cantidad de líneas a su nombre. De cada 
línea se tiene el número de teléfono, la cantidad de minutos consumidos y la cantidad de MB 
consumidos en el mes. Se pide implementar un programa que lea los datos de los clientes de
la compañía e informe el monto total a facturar para cada uno. Para ello, se requiere:

a. Realizar un módulo que lea la información de una línea de teléfono.

b. Realizar un módulo que reciba los datos de un cliente, lea la información de todas sus 
líneas (utilizando el módulo desarrollado en el inciso a. ) y retorne la cantidad total de 
minutos y la cantidad total de MB a facturar del cliente.

Nota: para realizar los cálculos tener en cuenta que cada minuto cuesta $3,40 y cada MB 
consumido cuesta $1,35.}


Program ej4p3;

Const 
  PRECIO_MIN = 3.40;
  PRECIO_MB = 1.35;

Type 
  linea = Record
    numero: string;
    minutos: integer;
    mb: integer;
  End;

{ a. Modulo para leer la información de una línea }
Procedure leerLinea(Var l: linea);
Begin
  writeln('Ingrese numero de telefono:');
  readln(l.numero);
  writeln('Ingrese minutos consumidos:');
  readln(l.minutos);
  writeln('Ingrese MB consumidos:');
  readln(l.mb);
End;

{ b. Modulo para procesar un cliente y acumular minutos y MB }
Procedure procesarCliente(Var totalMin, totalMB: integer);

Var 
  i, cantLineas: integer;
  l: linea;
Begin
{pregunto de antemano la cantidad de lineas del cliente}
  writeln('Ingrese cantidad de lineas del cliente:');
  readln(cantLineas);
  totalMin := 0;
  totalMB := 0;
  For i := 1 To cantLineas Do
    Begin
      leerLinea(l);
      totalMin := totalMin + l.minutos;
      totalMB := totalMB + l.mb;
    End;
End;

{programa principal, encargado de procesar los 9300 clientes}

Var 
  i, codigoCliente, totalMin, totalMB: integer;
  monto: real;
Begin
  For i := 1 To 9300 Do
    Begin
      writeln('Ingrese codigo de cliente:');
      readln(codigoCliente);
      procesarCliente(totalMin, totalMB);
      monto := totalMin * PRECIO_MIN + totalMB * PRECIO_MB;
      writeln('Monto total a facturar para el cliente ', codigoCliente, ': $',monto:0:2);
    End;
End.