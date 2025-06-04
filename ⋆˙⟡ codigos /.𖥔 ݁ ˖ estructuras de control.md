# Estructuras de control 
#### if-else 


~~~
if (condicion)then 
    {code line}
~~~

~~~
if (condicion)then begin
    {code lines}
end;
~~~

~~~
if (condicion)then begin
    {code lines}
    else {si condicion=falso, ingresa al else}
        {code lines}
end; 
~~~
#### while 
~~~
while (condicion) do 
    {code line}
~~~
~~~
while (condicion) do begin
    {code lines}
end;
~~~
nota: debemos estar seguros que la condicion en cualquier momento corte, sino se produce un loop infinito 
#### for

~~~
for i:= 1 to n do 
    {code line}
~~~

~~~
for i:= 1 to n do begin
    {code lines}
end;
~~~

nota: la variable i, jamas se modifica, y se sabe de antemano hasta que n numero termina la iteracion 

#### repeat-until

~~~
repeat
    {code lines}
until (condicion);
~~~
nota: la estructura repeat-until permite guardar el ultimo dato procesado a diferencia que con el while no podemos realizar 