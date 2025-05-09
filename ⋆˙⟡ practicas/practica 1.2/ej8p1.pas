{8. Un local de ropa desea analizar las ventas realizadas en el último mes. Para ello se lee por cada día
del mes, los montos de las ventas realizadas. La lectura de montos para cada día finaliza cuando se
lee el monto 0. Se asume un mes de 31 días. Informar la cantidad de ventas por cada día, y el monto
total acumulado en ventas de todo el mes.
a. Modifique el ejercicio anterior para que además informe el día en el que se realizó la mayor
cantidad de ventas.}


Program ej8p1;
Var 
  dia, cantVentas, maxVentas, diaMaxVentas: integer;
  monto, totalMes: real;
  
Begin
  totalMes := 0;
  maxVentas := -99999;
  diaMaxVentas := 0;

  For dia := 1 To 31 Do
    Begin
      writeln('Dia ', dia);
      cantVentas := 0;
//leo montos DEL DIA, hasta que ingresa 0, cuando ingresa 0 significa que pasa a otro dia
//pensandolo bien pudo haberse utilizado un while ya que no quiero guardar el valor 0¿
//zzzz perdon x'd
      Repeat
        write('Ingrese el monto de la venta: ');
        readln(monto);
        If monto <> 0 Then
          Begin
            totalMes := totalMes + monto;
            cantVentas := cantVentas + 1;
          End;
      Until monto = 0;

      writeln('Cantidad de ventas del dia ', dia, ': ', cantVentas);
      
      // las siguientes lineas de codigo realiza lo que pide el punto a.
      If cantVentas > maxVentas Then
        Begin
          maxVentas := cantVentas;
          diaMaxVentas := dia;
        End;
    End;

  writeln('-------------------------------------------');
  writeln('Monto total acumulado en el mes: $', totalMes:2:2);
  writeln('Dia con mayor cantidad de ventas: Dia ', diaMaxVentas, ' (',
          maxVentas, ' ventas)');
End.
