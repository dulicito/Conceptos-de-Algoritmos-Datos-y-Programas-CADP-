{4. Implemente un programa que lea el diámetro D de un círculo e imprima:
a. El radio (R) del círculo (la mitad del diámetro).
b. El área del círculo. Para calcular el área de un círculo debe utilizar la fórmula PI x R
2
c. El perímetro del círculo. Para calcular el perímetro del círculo debe utilizar la fórmula
D*PI (o también PI*R*2).}

Program ej4p0;
Var 
  D, R, area, perimetro: real;

Begin
  writeln('Ingrese el diametro del circulo:');
  readln(D);
  R := D / 2;
  area := Pi * R * R;
  perimetro := Pi * D;
  writeln('Radio: ', R:0:2);
  writeln('Area: ', area:0:2);
  writeln('Perimetro: ', perimetro:0:2);
End.
