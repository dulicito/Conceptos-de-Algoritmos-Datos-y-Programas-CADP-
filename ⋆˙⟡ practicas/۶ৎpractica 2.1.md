# Practica 2 (Parte 1) - Funciones y procedimientos 

### 1. Dado el siguiente programa, indicar qué imprime.
~~~
program alcance1;
var    
    a,b: integer;

procedure uno;
var  b: integer;
begin
    b := 3;
    writeln(b);
end;

begin
    a:= 1;
    b:= 2;
    uno;
    writeln(b, a);
end.
~~~

primero se imprime b(la variable local que se utiliza solamente en el procedimiento), el cual es 3, luego se imprime 2 y 1 desde el prog principal.

### 2. Dado el siguiente programa, indicar qué imprime.

~~~
program alcance2;
var a,b: integer;
procedure uno;
begin
    b := 3;
    writeln(b);
end;

begin
    a:= 1;
    b:= 2;
    uno;
    writeln(b, a);
end.
~~~

primero desde el procedimiento imprime en numero 3, luego en el programa principal imprime 3 y 1 


### 3. Dado el siguiente programa, indicar cuál es el error y su causa.

~~~
program alcance3;
var a: integer;

procedure uno;
var b: integer;
begin
    b:= 2;
    writeln(b);
end;

begin
    a:= 1;
    uno;
    writeln(a, b);
end.
~~~

la variable b no esta declarada en el programa principal, solo existe como variable local del procedimiento


### 4. Dado los siguientes programas, explicar la diferencia.

~~~
program alcance4a;
var a,b: integer;

procedure uno;
begin
    a := 1;
    writeln(a);
end;

begin
    a:= 1;
    b:= 2;
    uno;
    writeln(b, a);
end.
~~~


~~~
program alcance4b;

procedure uno;
begin
    a := 1;
    writeln(a);
end;

var a,b: integer;
begin
    a:= 1;
    b:= 2;
    uno;
    writeln(b, a);
end.
~~~

la diferencia que mantienen ambas es que el program "alcance4b" no compila, ya que la variable utilizada en el procedimiento no esta declarada como variable local o variable global, por lo que salta error al momento de compilar


### 5. Dado el siguiente programa, indicar cuál es el error.

~~~
program alcance4;

function cuatro: integer;
begin
    cuatro:= 4;
end;

var a: integer;
begin
    cuatro;
    writeln(a);
end.
~~~

el error esta en la llamada de la funcion la cual no se le asigna ninguna variable, tambien la variable "a" nunca esta inicializada


### 6. a. Realice un módulo que lea de teclado números enteros hasta que llegue un valor negativo. Al finalizar la lectura el módulo debe imprimir en pantalla cuál fue el número par más alto.


### b. Implemente un programa que invoque al módulo del inciso a.

~~~
program ej6p2;

procedure MaximoPar;
var
  num, maxPar: integer;
begin
  maxPar := -1; 

  write('Ingrese un numero: ');
  readln(num);

  while num >= 0 do
  begin
    if (num mod 2 = 0) and ((maxPar = -1) or (num > maxPar)) then
      maxPar := num;

    write('Ingrese un numero: ');
    readln(num);
  end;

  if maxPar = -1 then
    writeln('No se ingresaron números pares.')
  else
    writeln('El número par más alto fue: ', maxPar);
end;
//programa principal !
begin
  MaximoPar;
end.
~~~

### 7. Dado el siguiente programa:

~~~
program alcanceYFunciones;
var
    suma, cant : integer;

function calcularPromedio : real
var
    prom : real;
begin
    if (cant = 0) then
    prom := -1
else
    prom := suma / cant;
end;

begin { programa principal }
    readln(suma);
    readln(cant);
    if (calcularPromedio <> -1) then begin
    cant := 0;
    writeln(‘El promedio es: ’ , calcularPromedio)
    end;
    else
    writeln(‘Dividir por cero no parece ser una buena idea’);
end.
~~~


### a) La función calcularPromedio calcula y retorna el promedio entre las variables globales suma y cant, pero parece incompleta. ¿qué debería agregarle para que funcione correctamente?

la funcion no retorna nada, se la debe modificar agregandole la linea de codigo:
calcularPromedio:= prom;


### b) En el programa principal, la función calcularPromedio es invocada dos veces, pero esto podría mejorarse. ¿cómo debería modificarse el programa principal para invocar a dicha función una única vez?

se puede guardar el resultado en una variable


### c) Si se leen por teclado los valores 48 (variable suma) y 6 (variable cant), ¿qué resultado imprime el programa? Considere las tres posibilidades:


### i) El programa original

 retorna basura ya que acordemosnos que la funcion no retornaba nada

### ii) El programa luego de realizar la modificación del inciso a)

imprime un resultado incorrecto por llamar dos veces a la funcion

### iii) El programa luego de realizar las modificaciones de los incisos a) y b)

imprime correctamente

### 8. Dado el siguiente programa:

~~~
program anidamientos;

    procedure leer;
    var
        letra : char;

    function analizarLetra : boolean
    begin
    if (letra >= ‘a’) and (letra <= ‘z’) then
        analizarLetra := true;
    else
    if (letra >= ‘A’) and (letra <= ‘Z’) then
        analizarletra := false;
    end; { fin de la funcion analizarLetra }

    begin
        readln(letra);
        if (analizarLetra) then
            writeln(‘Se trata de una minúscula’)
        else
            writeln(‘Se trata de una mayúscula’);
    end; { fin del procedure leer}

var
    ok : boolean;

begin { programa principal }
    leer;
    ok := analizarLetra;
    if ok then
        writeln(‘Gracias, vuelva prontosss’);
end.
~~~


### a) La función analizarLetra fue declarada como un submódulo dentro del procedimiento leer. Pero esto puede traer problemas en el código del programa principal.


### i) ¿qué clase de problema encuentra?

los problemas que encontramos son errores de compilacion, ya que la function "analizarLetra" es un submodulo del procedure "Leer", lo cual no es visible en el programa principal


### ii) ¿cómo se puede resolver el problema para que el programa compile y funcione correctamente?

podemos mover la function fuera del procedure "Leer", convirtiendose asi en un modulo que se pueda utilizar en el programa principal.


### b) La función analizarLetra parece incompleta, ya que no cubre algunos valores posibles de la variable letra.


### i) ¿De qué valores se trata?

caracteres tales como digitos de numeros, simbolos, espacios, saltos de linea, etc.


### ii) ¿Qué sucede en nuestro programa si se ingresa uno de estos valores?

devuelve basura 


### iii) ¿Cómo se puede resolver este problema?

podriamos modificar la funcion y agregar un else que abarque el caso de haber ingresado uno de esos caracteres !

~~~
function analizarLetra(letra: char): boolean;
begin
  if (letra >= 'a') and (letra <= 'z') then
    analizarLetra := true
  else if (letra >= 'A') and (letra <= 'Z') then
    analizarLetra := false
  else
  begin
    writeln('Se ingreso otro caracter diferente');
    analizarLetra := false; 
  end;
end;
~~~
