{Actividad 1: Revisando Inversiones
Realizar un programa que analice las inversiones de las empresas más grandes del país. Para cada
empresa se lee su código (un número entero), la cantidad de inversiones que tiene, y el monto
dedicado a cada una de las inversiones. La lectura finaliza al ingresar la empresa con código 100,
que debe procesarse.

El programa deberá informar:
● Para cada empresa, el monto promedio de sus inversiones
● Código de la empresa con mayor monto total invertido
● Cantidad de empresas con inversiones de más de $50000

Por ejemplo:
Ingrese un código de empresa: 33
Ingrese la cant. de inversiones: 4
Ingrese el monto de cada inversión: 33200 56930 24500.85 10000
Resultado del análisis: Empresa 33 Monto promedio 31157,71
Ingrese un código de empresa: 41
Ingrese la cant. de inversiones: 3
Ingrese el monto de cada inversión: 102000.22 53000 12000
Resultado del análisis: Empresa 41 Monto promedio 55666,74
Ingrese un código de empresa: 100
Ingrese la cant. de inversiones: 1
Ingrese el monto de cada inversión: 84000.34
Resultado del análisis: Empresa 100 Monto promedio 84000.34
(Fin de la lectura)
La empresa 41 es la que mayor dinero posee invertido ($167000.22).
Hay 3 empresas con inversiones por más de $50000}


Program ej1ad;
Var 
  codigo, cantInversiones, i: integer;
  monto, sumaInversiones, promedio: real;
  mayorInversionTotal: real;
  codigoMayor: integer;
  empresasMas50k: integer;
  
Begin
  mayorInversionTotal := -99999;
  codigoMayor := -9999;
  empresasMas50k := 0;

  Repeat
    write('Ingrese un codigo de empresa: ');
    readln(codigo);

    write('Ingrese la cant. de inversiones: ');
    readln(cantInversiones);

    sumaInversiones := 0;

    For i := 1 To cantInversiones Do
      Begin
        write('Ingrese el monto de la inversion ', i, ': ');
        readln(monto);
        sumaInversiones := sumaInversiones + monto;
      End;

    promedio := sumaInversiones / cantInversiones;
    writeln('Resultado del análisis: Empresa ', codigo, ' Monto promedio ',
            promedio:2:2);
    writeln;

    If sumaInversiones > mayorInversionTotal Then
      Begin
        mayorInversionTotal := sumaInversiones;
        codigoMayor := codigo;
      End;

    If sumaInversiones > 50000 Then
      empresasMas50k := empresasMas50k + 1;

  Until codigo = 100;

  writeln('----------------------------------------------');
  {separador util para cuando imprima UnU}
  writeln('La empresa ', codigoMayor,
          ' es la que mayor dinero posee invertido ($', mayorInversionTotal:2:2,
          ').');
  writeln('Hay ', empresasMas50k,
          ' empresas con inversiones por más de $50000.');
End.

