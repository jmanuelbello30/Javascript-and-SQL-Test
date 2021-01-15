//Pregunta 1
//Diseñe un algoritmo en pseudocódigo o en el lenguaje de programación que más le acomode, que sea capaz de sumar los primeros N números Naturales. 
//(Si es capaz de utilizar recursividad, suma más puntos).

function naturalNumbers(number) {
  // Creamos la variable result donde guardaremos el resultado de cada operación.
  let result = 0; 
  //El parametro number es el número natural que será la base para realizar la operación.
  //Realizamos un bucle con for para realizar la lógica matemática.
  for (let index = 0; index <= number; index++) {
    //result esta guardando la sumatoria de cada bucle, ejem:
    // R 0 + I 1 en la primera interacción
    // R 1 + I 2 cuando index vale 2
    // R 3 + I 3 cuando index vale 3
    result = result + index;
  } 
  return result;
}

naturalNumbers();

//Pregunta 2
//Diseñe un algoritmo en pseudocódigo o en el lenguaje de programación que más le acomode, que sea capaz de sacar el promedio de notas de N notas. 
//Se debe tener en cuenta que el promedio debe tener solo un decimal.

function averageNotes(notesArray) {
    //Creamos una variable SumNumbers donde guardaremos el resultado de cada operación.
    SumNumbers = 0;
    //Creamos una variable MediaNumbers que permitirá realizar el cálculo de promedio de notas.
    MediaNumbers = 0;
  
    //Realizamos un bucle con for para realizar la lógica matemática.
    //notesArray es el array que se recibe como parámetro.
    for (let index = 0; index < notesArray.length; index++) {
    //SumNumbers esta guardando la sumatoria de cada operación al recorrer la longitud del array, y notesArray[index], esta guardando 
    //el valor de cada posición del array.
      SumNumbers = SumNumbers + notesArray[index];
    }
    //Luego dividimos la suma de todos los números y los divimos por la longitud del array.
    MediaNumbers = SumNumbers / notesArray.length;

    //con Math.round, devolvemos el valor del número dado por MediaNumbers redondeandolo al entero más cercano.
    //con fixed convertimos el resultado en un número rendodeado, manteniendo un solo decimal.
    return (Math.round(MediaNumbers * 100) / 100).toFixed(1);
  }

averageNotes([]);

//Pregunta 3
//Diseñe un algoritmo en pseudocódigo o en el lenguaje de programación que más le acomode, que sume los N primeros números de la serie de Fibonacci.
//(Si es capaz de utilizar recursividad, suma más puntos).

//La sucesión fibonacci es una sucesión de números que inicia con los números 0 y 1 y luego a partir de estos,
//cada término es la suma de los dos anteriores.
//Con esta premisa, realizamos una función recursiva para ejecutar la sucesión fibonazzi.
 function fibonacci(number) {
//utilizando condicional if se reemplaza el uso de bucles como for o while.
//La condición del if, se refiere al momento cuando culminara la recursividad.
//Considerando que las funciones recursivas cuando interan, esperan al final del bucle para arrojar el resultado de la operación.
    if (number < 2){
        return number;
    }else{
        return fibonacci(number-2) + fibonacci(number-1);
    }
  }

fibonacci();

//Pregunta 4
//Diseñe un algoritmo en pseudocódigo o en el lenguaje de programación que más le acomode, que sea capaz de sumar las filas de una matriz de N x M.

//Sobre este ejercicio no entendí bien lo que se esta solicitando, pero les dejo mi razonamiento sobre el:
//Para mi la función que va a ejecutar este algoritmo recibira N x M que sera los elementos de la matriz, por ejemplo:
//Una matriz 2 x 3 seria asi:
//2  3
//4  5
//6  7
//Con ese concepto dependería entonces de los elementos contenidos en la matriz y el racionamiento seria este:
//El valor de la primera fila es 5
//De la segunda 9
//Y de la tercera 13
//Una forma que pensé para resolver cuando se insertara N X M era pedirle al usuario por prompt, los valores con los cuales se va a rellenar la matriz.
//No hice este racionamiento con pseudocódigo porque no tengo mucha experiencia usando esa metodología. 

//Pregunta 5
//Diseñe un algoritmo en pseudocódigo o en el lenguaje de programación que más le acomode (idealmente una función), 
//que sea capaz de sumar el triple de un número más 3/5 del otro.

function sumNumberx3(number1, number2) {
    //multiplicamos el parámetro number1 x 3 y luego lo sumanos con el resultado entre number2 x 3/5.
    return (number1 * 3) + (number2 * (3/5));
}

sumNumberx3();

//Pregunta 6
//Diseñe un algoritmo en pseudocódigo o en el lenguaje de programación que más le acomode (idealmente una función), 
//que sea capaz de ordenar un arreglo de N números naturales de mayor a menor.

function OrderNumbers(arrayNumbers) {
    //arrayNumbers será el arreglo que tendrá los números naturales que queramos ordenar de mayor a menor.
    //con la lógica de sort, ordenamos arrayNumbers, sort indica que cuando compara dos valores, 
    //envía los valores a la función de comparación y ordena los valores según el valor devuelto (negativo, cero, positivo). 
    return arrayNumbers.sort(function(menor, mayor){return mayor-menor});
}

OrderNumbers([]);