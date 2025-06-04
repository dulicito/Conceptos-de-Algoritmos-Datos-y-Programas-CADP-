# Ejercicio 1 

1. Responda las preguntas en relación al siguiente programa:
~~~
program Ejercicio3;
procedure suma(num1: integer; var num2:integer);
begin
    num2 := num1 + num2;
    num1 := 0;
end;
var
    i, x : integer;
begin
    read(x); { leo la variable x }
    for i:= 1 to 5 do
        suma(i,x);
    write(x); { imprimo las variable x }
end.
~~~

a. ¿Qué imprime si se lee el valor 10 en la variable x ?

b. ¿Qué imprime si se lee el valor 10 en la variable x y se cambia el encabezado del procedure por:
procedure suma(num1: integer; num2:integer);

c. ¿Qué sucede si se cambia el encabezado del procedure por:
procedure suma(var num1: integer; var num2:integer);

-----------------------
a. 
i = 1 → suma(1, x): x := 1 + 10 = 11
i = 2 → suma(2, x): x := 2 + 11 = 13
i = 3 → suma(3, x): x := 3 + 13 = 16
i = 4 → suma(4, x): x := 4 + 16 = 20
i = 5 → suma(5, x): x := 5 + 20 = 25

imprime 25 ! 

b. se hace 5 llamadas con el for a suma pero x nunca cambia, por lo que imprime 10 !

c. el indice del for jamas debe modificarse, si no mal recuerdo segun lo aprendido de la catedra esta tomado como mal 

# Ejercicio 2

2. Responda la pregunta en relación al siguiente programa:
~~~
Program ejercicio4;
procedure digParesImpares(num : integer; var par, impar : integer);
var
    dig: integer;
begin
    while (num <> 0) do begin
        dig:= num mod 10;
        if((dig mod 2)= 0) then
            par := par + 1
        else
           impar:= impar +1;
        num := num DIV 10;
    end;
end;
var
    dato, par, impar, total, cant : integer;
begin
    par := 0;
    impar := 0;
    repeat
        read(dato);
        digParesImpares(dato,par,impar);
    until (dato = 100);
    writeln(‘Pares: ’,par, ‘Ímpares:’, impar);
end.
~~~

a. ¿Qué imprime si se lee la siguiente secuencia de valores? 250, 35, 100

imprime:
pares: 4
impares: 4 

# Ejercicio 3
Encontrar los 6 errores que existen en el siguiente programa. Utilizar los comentarios entre llaves como guía, indicar en qué línea se encuentra cada error y en qué consiste:
~~~
1. program ejercicio5;
2.   { suma los números entre a y b, y retorna el resultado en c }
3. procedure sumar(a, b, c : integer)
4. var
5.   suma : integer;
6. begin
7.
8.      for i := a to b do
9.           suma := suma + i;
10.     c := c + suma;
11. end;

12. var
13.  result : integer;

14. begin
15.     result := 0;
16.     readln(a); readln(b);
17.     sumar(a, b, 0);
18.  write(‘La suma total es ‘,result);
19.     { averigua si el resultado final estuvo entre 10 y 30}
20.     ok := (result >= 10) or (result <= 30);
21.     if (not ok) then
22.         write (‘La suma no quedó entre 10 y 30’);
23. end.

~~~


errores:
1. a y b no declarados en el programa principal

2. variable suma no esta inicializada

3. pasar valor constante 0 a un parametro por referencia cuando debe pasarse a una variable

4. variable booleana ok no esta declarada 

5.  se usa or en vez de and

6. comillas incorrectas en un write (linea 18)

# Ejercicio 4
El siguiente programa intenta resolver un enunciado. Sin embargo, el código posee 5 errores. Indicar en qué línea se encuentra cada error y en qué consiste el error.

*Enunciado: Realice un programa que lea datos de 130 programadores Java de una empresa. De cada programador se lee el número de legajo y el salario actual. El programa debe imprimir el total del dinero destinado por mes al pago de salarios, y el salario del empleado mayor legajo.*

~~~
1. program programadores;
2. procedure leerDatos(var legajo: integer; salario : real);
3. begin
4.  writeln(‘Ingrese el nro de legajo y el salario”);
5.  read(legajo);
6.  read(salario);
7. end;
8. procedure actualizarMaximo(nuevoLegajo:integer; nuevoSalario:real; var maxLegajo:integer);
9. var
10.     maxSalario : real;
11. begin
12.     if (nuevoLegajo > maxLegajo) then begin
13.         maxLegajo:= nuevoLegajo;
14.         maxSalario := nuevoSalario
15.     end;
16. end;
17. var
18.     legajo, maxLegajo, i : integer;
19.     salario, maxSalario : real;
20. begin
21.     sumaSalarios := 0;
22.     for i := 1 to 130 do begin
23.         leerDatos(salario, legajo);
24.         actualizarMaximo(legajo, salario, maxLegajo);
25.         sumaSalarios := sumaSalarios + salario;
26.     end;
27.     writeln(‘En todo el mes se gastan ‘, sumaSalarios, ‘ pesos’);
28.     writeln(‘El salario del empleado más nuevo es ‘,maxSalario);
29. end.
~~~

1. linea 2, el parametro salario debe ser parametro por referencia

2. linea 4, las comillas estan puestas mal 

3. linea 8, maxSalario no esta pasado como parametro 

4. linea 23, esta mal el orden de los parametros, esta puesto al revez

5. linea 21, falta declarar variable en var 
