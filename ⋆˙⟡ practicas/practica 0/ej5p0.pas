{5. Un kiosquero debe vender una cantidad X de caramelos entre Y clientes, dividiendo cantidades
iguales entre todos los clientes. Los que le sobren se los quedará para él.
a. Realice un programa que lea la cantidad de caramelos que posee el kiosquero (X), la
cantidad de clientes (Y), e imprima en pantalla un mensaje informando la cantidad de
caramelos que le corresponderá a cada cliente, y la cantidad de caramelos que se
quedará para sí mismo.
b. Imprima en pantalla el dinero que deberá cobrar el kiosquero si cada caramelo tiene un
valor de $1.60.}


Program ej5p0;
Var 
  X, Y, caramelosPorCliente, caramelosSobrantes: integer;
  dinero: real;

Begin
  writeln('Ingrese la cantidad de caramelos (X):');
  readln(X);
  writeln('Ingrese la cantidad de clientes (Y):');
  readln(Y);
  caramelosPorCliente := X Div Y;
  caramelosSobrantes := X Mod Y; //lo que sobra se lo queda el kiosquero 

  writeln('Cada cliente recibira ', caramelosPorCliente, ' caramelos.');
  writeln('El kiosquero se quedara con ', caramelosSobrantes, ' caramelos.');

  dinero := X * 1.60;  { Cálculo del dinero a cobrar :0  }
  writeln('El kiosquero debera cobrar $', dinero:2:2);
End.
