{6. Realice un programa que informe el valor total en pesos de una transacción en dólares. Para
ello, el programa debe leer el monto total en dólares de la transacción, el valor del dólar al día
de la fecha y el porcentaje (en pesos) de la comisión que cobra el banco por la transacción. Por
ejemplo, si la transacción se realiza por 10 dólares, el dólar tiene un valor 189,32 pesos y el
banco cobra un 4% de comisión, entonces el programa deberá informar:
La transacción será de 1968,93 pesos argentinos
(resultado de multiplicar 10*189,32 y adicionarle el 4%)}


Program ej6p0;
Var 
  montoDolares, valorDolar, comision, transaccionPesos, comisionValor,
  totalAPagar: real;

Begin
  writeln('Ingrese el monto de la transaccion en dolares:');
  readln(montoDolares);

  writeln('Ingrese el valor del dolar en pesos:');
  readln(valorDolar);

  writeln('Ingrese el porcentaje de comision del banco:');
  readln(comision);

  transaccionPesos := montoDolares * valorDolar;
  comisionValor := transaccionPesos * (comision / 100);
  totalAPagar := transaccionPesos + comisionValor;

  writeln('La transaccion sera de ', totalAPagar:0:2, ' pesos argentinos.');
End.
