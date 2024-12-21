/* DOMINIO PARCIAL

TIERRA DE LOS MUERTOS, alli van las almas

*DEPTO DE LA MUERTE
- Tiene agentes de viaje

- Mejor agente

- Lista de paquetes 


*AGENTES DE VIAJE
- Tienen Deuda
- Un agente puede ofrecerle a un ALMA un PAQUETE DE VIAJE
   - Reduce deuda del agente
   - El capital del alma determina si puede costear el paquete
   - Cant paquetes vendidos
   - Dinero total ganado
   - Cada venta disminuye la deuda inicial

   VENTA DE PAQUETE ------
   - tiene ESTRATEGIAS, para ofrecer un paquete (le interesa un paquete segun la estrategia)
   - Concreta la venta
   - Un agente puede cambiar de estrategia en cualquier momento

*TIPO ESTRATEGIA
- Valor Basico

       *CLASICO
       - Elije el paquete mas caro que pueda costear el alma, entre una lista de paquetes de la empresa

       *NAVEGANTE
       - Arma paquete bote o crucero, dependiendo de cant. de acciones buenas
         - Si tiene 50 o mas, elije CRUCERO
         - Sino, bote  
      - Valor basico = cant. de acciones buenas del alma

      *INDIFERENTE
      - Arma un paquete de palo con brujula
      - valor basico aleatorio entre 1 y 300

      ARMA UN PAQUETE, LUEGO LO INSTANCIA




*ALMA
 - Tiene capital = Dinero al morir + cantAcciones buenas

 - Le puede interesar un paquete
   - Si reduce el tiempo de viaje a la tierra del reposo


*PAQUETE
- Tiene un costo
   - Se calcula como valor basico paquete * cant anios que reduce el viaje
   - Tiene costo maximo de 350

- Tiene anios que reduce

   *TREN
   - Reduce viaje en 4 anios

   *BOTE
   - Reduce tantos anios como cant de buenas acciones del alma /50
   - Tiene un maximo de 2 anio

   *CRUCERO
   - Hereda de bote (super() * 2)

   *PALO CON BRUJULA
   - Reduce el viaje en 0.05 anios
   - Su costo es el basico, sin ningun maximo

-----------------------------------------------------------------------------------------
REQUISITOS
1) a. Que un AGENTE pueda vender un paquete a un alma
  - No puede hacer la venta si el alma no tiene capital

  b. Conocer al mejor agente (el que mas paquetes vendio)

  c. Saber el dinero total ganado x ventas

  d. Saber cual es su deuda actual

2) DIA de los muertos
- Suceden 3 cosas:
   EL DEPTO toma al mejor agente, y reduce su deuda en 50

   la empresa CHEQUEA quienes pagaron su deuda y los libera

   quienes NO pagaron su deuda, se les sube a 100

3) AGREGAR PAQUETES

4) HACER que un agente atienda a un alma

5) ESCRIBIR TESTS
- Probar que un agente determina correctamente el paquete que ofrece,
para el caso de la estrategia nav

 */