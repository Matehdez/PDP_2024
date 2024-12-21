/* DOMINIO PROBLEMA

DESARROLLAR LOGICA DEL JUEGO

*PERSONAJES
- Participan de misiones
  - Pueden ganar o perder copas
- Tiene copas ganadas
   ARQUERO
   - Destreza = agilidad * rango
   - tieneEstrategia = rango > 100

   GUERRERAS
   - Algunas tienen estrategia y otras no
   - Destreza = fuerza * 1,50

   BALLESTEROS
   - Son arqueros
   - Tienen el doble de destreza q ellos

*MISIONES
- Copas en juego
- Se suman o restan a los personajes
- PuedeSerSuperada ? 

    INDIVIDUALES
    - Copas = 2*dificultad
    - Superada = personaje tiene estrategia o destreza > dificultad


    POR EQUIPO
    - Copas = 50 / cantPersonajes
    - Superadas cuando mas de la mitad tiene estrategia o cada uno
    destreza > 400

    *TIPOS MISIONES

    COMUNES


    BOOST
    - Copas en juego = multiplicador * super()


    BONUS
    - Copas en juego = 1 copa extra x partici'ante

--------------------------------------------------------------------------------------
REQUISITOS
1) Saber si una mision puede ser superada
2) Realizar una mision
  - Si es individual: no debe tener menos de 10 copas
  - Si es grupal: total no debe ser menor a 60
  AMBOS CASOS TIRAN ERROR   
4) Escribir los tests necesarios para probar el correcto 
funcionamiento del código que prueba que una misión individual 
fue superada. Se espera un test bien nombrado por cada 
clase de equivalencia.
6)Realizar el diagrama estático de toda la solución. 
No hace falta poner getters ni setters.

 */