{6. Una empresa importadora de microprocesadores desea implementar un sistema 
de software para analizar la información de los productos que mantiene actualmente 
en stock. Para ello, se conoce la siguiente información de los microprocesadores: 
marca (Intel, AMD, NVidia, etc), línea (Xeon, Core i7, Opteron, Atom, Centrino, etc.),
cantidad de cores o núcleos de procesamiento (1, 2, 4, 8), velocidad del reloj (medida en Ghz) 
y tamaño en nanómetros (nm) de los transistores (14, 22, 32, 45, etc.). La información 
de los microprocesadores se lee de forma consecutiva por marca de procesador y la lectura 
finaliza al ingresar un procesador con 0 cores (que no debe procesarse). Se pide implementar 
un programa que lea información de los microprocesadores de la empresa importadora e informe:

● Marca y línea de todos los procesadores de más de 2 cores con transistores de a lo sumo 22 nm.
● Las dos marcas con mayor cantidad de procesadores con transistores de 14 nm.
● Cantidad de procesadores multicore (de más de un core) de Intel o AMD, cuyos relojes alcancen velocidades de
al menos 2 Ghz.}


Program ej6p3;

Type 
  micro = Record
    marca: string;
    linea: string;
    cores: integer;
    ghz: real;
    nm: integer;
  End;

{ Módulo para leer un microprocesador }
Procedure leerMicro(Var m: micro);
Begin
  writeln('Ingrese marca:');
  readln(m.marca);
  writeln('Ingrese linea:');
  readln(m.linea);
  writeln('Ingrese cantidad de cores:');
  readln(m.cores);
  If m.cores <> 0 Then
    Begin
      writeln('Ingrese velocidad (GHZ):');
      readln(m.ghz);
      writeln('Ingrese tamano de transistores (NM):');
      readln(m.nm);
    End;
End;




{ Módulo para informar procesadores de más de 2 cores y transistores <= 22 nm }
Procedure informarCoresYnm(m: micro);
Begin
  If (m.cores > 2) And (m.nm <= 22) Then
    writeln('Marca: ', m.marca, ' , Línea: ', m.linea);
End;

{ Módulo para verificar si es multicore Intel o AMD con al menos 2 Ghz }
Function esMulticoreIntelAMD(m: micro): boolean;
Begin
  esMulticoreIntelAMD := (m.cores > 1) And ((m.marca = 'Intel') Or (m.marca =
                         'AMD')) And (m.ghz >= 2);
End;




{ Módulo para actualizar las dos marcas con mayor cantidad de procesadores de 14 nm }
Procedure actualizarMaximos(marcaActual: String; cant14nm: integer;
                            Var max1, max2: integer;
                            Var marcaMax1, marcaMax2: String);
Begin
  If cant14nm > max1 Then
    Begin
      max2 := max1;
      marcaMax2 := marcaMax1;
      max1 := cant14nm;
      marcaMax1 := marcaActual;
    End
  Else If cant14nm > max2 Then
         Begin
           max2 := cant14nm;
           marcaMax2 := marcaActual;
         End;
End;

{ programa principal}

Var 
  m: micro;
  marcaActual: string;
  cant14nm, max1, max2: integer;
  marcaMax1, marcaMax2: string;
  multicoreIntelAMD: integer;

Begin
  max1 := -9999999;
  max2 := -9999999;
  marcaMax1 := '';
  marcaMax2 := '';
  multicoreIntelAMD := 0;

  leerMicro(m);
  While m.cores <> 0 Do
    Begin
      marcaActual := m.marca;
      cant14nm := 0;
      While (m.cores <> 0) And (m.marca = marcaActual) Do
        Begin
          informarCoresYnm(m);

          If m.nm = 14 Then
            cant14nm := cant14nm + 1;

          If esMulticoreIntelAMD(m) Then
            multicoreIntelAMD := multicoreIntelAMD + 1;

          leerMicro(m);
        End;
      actualizarMaximos(marcaActual, cant14nm, max1, max2, marcaMax1, marcaMax2)
      ;
    End;

  writeln('Las dos marcas con mayor cantidad de procesadores de 14 nm:');
  writeln('1) ', marcaMax1, ' (', max1, ' procesadores)');
  writeln('2) ', marcaMax2, ' (', max2, ' procesadores)');
  writeln('Cantidad de multicore Intel o AMD con al menos 2 Ghz: ',multicoreIntelAMD);

End.