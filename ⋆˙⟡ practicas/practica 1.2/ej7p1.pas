{7. Realizar un programa que lea desde teclado información de autos de carrera. Para cada uno de los
autos se lee el nombre del piloto y el tiempo total que le tomó finalizar la carrera. En la carrera
participaron 100 autos. Informar en pantalla:
- Los nombres de los dos pilotos que finalizaron en los dos primeros puestos.
- Los nombres de los dos pilotos que finalizaron en los dos últimos puestos.}


Program ej7p1;
Var 
  i, puesto1, puesto2, ultimo1, ultimo2: integer;
  nombre, mejorPiloto, segundoPiloto, peorPiloto, penultimoPiloto: string;
  tiempo, mejorTiempo, segundoTiempo, peorTiempo, penultimoTiempo: real;
  
Begin
  mejorTiempo := 99999;  { Inicializamos con un valor muy alto }
  segundoTiempo := 99999;
  peorTiempo := -9999;  { Inicializamos con un valor muy bajo }
  penultimoTiempo := -9999;

  // Leo los 100 datos de copilotos
  For i := 1 To 100 Do
    Begin
      write('Ingrese el nombre del piloto del auto ', i, ': ');
      readln(nombre);
      write('Ingrese el tiempo total del piloto (en segundos): ');
      readln(tiempo);

      //guardo y actualizo los primeros dos lugares
      If tiempo < mejorTiempo Then
        Begin
          segundoTiempo := mejorTiempo;
          segundoPiloto := mejorPiloto;
          mejorTiempo := tiempo;
          mejorPiloto := nombre;
        End
      Else If tiempo < segundoTiempo Then
             Begin
               segundoTiempo := tiempo;
               segundoPiloto := nombre;
             End;

      //guardar y actualizar los ultimos dos lugares
      If tiempo > peorTiempo Then
        Begin
          penultimoTiempo := peorTiempo;
          penultimoPiloto := peorPiloto;
          peorTiempo := tiempo;
          peorPiloto := nombre;
        End
      Else If tiempo > penultimoTiempo Then
             Begin
               penultimoTiempo := tiempo;
               penultimoPiloto := nombre;
             End;
    End;

  //imprimo y muestro los resultados
  writeln('Los dos primeros pilotos son: ');
  writeln('1er lugar: ', mejorPiloto, ' con un tiempo de ', mejorTiempo:2:2,
          ' segundos');
  writeln('2do lugar: ', segundoPiloto, ' con un tiempo de ', segundoTiempo:2:2,
          ' segundos');

  writeln;
  //lo uso para que la pantalla no se cierre xD, lo aplicarlo en el parcial ._.

  writeln('Los dos ultimos pilotos son: ');
  writeln('Penultimo lugar: ', penultimoPiloto, ' con un tiempo de ',
          penultimoTiempo:2:2, ' segundos');
  writeln('ultimo lugar: ', peorPiloto, ' con un tiempo de ', peorTiempo:2:2,
          ' segundos');
End.
