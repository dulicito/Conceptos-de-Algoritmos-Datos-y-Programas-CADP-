{8. Realizar un programa que lea tres caracteres, e informe si los tres eran letras vocales o si al menos
uno de ellos no lo era. Por ejemplo, si se leen los caracteres “a e o” deberá informar “Los tres son
vocales”, y si se leen los caracteres “z a g” deberá informar “al menos un carácter no era vocal”.}


Program ej8p1;
Var 
  c1, c2, c3: char;
  contadorVocales: integer;

Begin
  write('Ingrese el primer caracter: ');
  readln(c1);
  write('Ingrese el segundo caracter: ');
  readln(c2);
  write('Ingrese el tercer caracter: ');
  readln(c3);

// Inicializo contador ! :D
  contadorVocales := 0;
  
// Verifico si cada caracter es una vocal, en minuscula y mayuscula because ASCII 

  If ((c1 = 'a') Or (c1 = 'e') Or (c1 = 'i') Or (c1 = 'o') Or (c1 = 'u') Or
     (c1 = 'A') Or (c1 = 'E') Or (c1 = 'I') Or (c1 = 'O') Or (c1 = 'U')) Then
    contadorVocales := contadorVocales + 1;

  If ((c2 = 'a') Or (c2 = 'e') Or (c2 = 'i') Or (c2 = 'o') Or (c2 = 'u') Or
     (c2 = 'A') Or (c2 = 'E') Or (c2 = 'I') Or (c2 = 'O') Or (c2 = 'U')) Then
    contadorVocales := contadorVocales + 1;

  If ((c3 = 'a') Or (c3 = 'e') Or (c3 = 'i') Or (c3 = 'o') Or (c3 = 'u') Or
     (c3 = 'A') Or (c3 = 'E') Or (c3 = 'I') Or (c3 = 'O') Or (c3 = 'U')) Then
    contadorVocales := contadorVocales + 1;

  //verifico si todas son vocales, al menos alguna o ninguna con el contador

  If (contadorVocales = 3) Then
    writeln('Los tres caracteres son vocales')
  Else If (contadorVocales = 0) Then
         writeln('Ninguno de los caracteres es vocal')
  Else
    writeln('Al menos un caracter no es vocal');
End.
