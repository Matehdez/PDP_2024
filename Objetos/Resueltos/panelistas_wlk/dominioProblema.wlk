/* DOMINIO DEL PROBLEMA

HABLEMOS SIN SABER
Sistema para manejar el programa de television

Cada Emision cuenta con PANELISTAS y TEMATICAS

*CLASE PANELISTA
- Saber quien fue el mas destacado (en una emision)
- Tienen puntos estrella
   - Se acumulan dando remates graciosos sobre un TEMA:
   CELEBRIDAD
   - Siempre suma 3

   COLORADO
   - Suma un quinto de su gracia en ese momento
   - Luego de hacer el remate, suma un punto de gracia

   COLORADO CON PELUCA
   - Un punto extra que si fuera colorado natural
   - Igual que un colorado en terminos generales

   VIEJO
   - Incrementa tanto como la cant palabras del titulo del TEMA

   PANELISTAS DEPORTIVOS
   - Nunca suman

REQUISITO
1. Hacer q un panelista de un remate gracioso

*CLASE TEMATICA
- Hay cierta cantidad de panelistas involucrados
- Los panelistas opinan sobre ellas
  - Luego suman puntos estrellas salvo si:
    - Si la tematica es deportiva, los DEPORTIVOS suman 5
    - Si es farandula, las CELEBRIDADES suman tantos puntos
    como involucrados en la tematica
- Tiene un titulo

- mereceAtencion ?
FILOSOFICA
- Si tiene mas de 20 palabras
FARANDULA
- Si tiene 3 o mas involucrados
DEPORTIVA
- Si la palabra MESSI esta en el titulo

ECONOMICA
MORAL

el resto no es interesante

*TEMATICAS MIXTAS
- Estan compuestas por varias TEMATICAS
- El titulo es la concatenacion de todas
- Es interesante si al menos una lo es

- Se siguen manteniendo puntaje de tematicas por parte de panelistas
(suman tanta cantidad de puntos como tematica individual, luego se suma)

REQUISITOS
2. Hacer q un panelista opine
3. Consultar si una tematica es interesante

*EMISIONES
- Se determinan las tematicas a tratar
- Qué panelistas participaran de la emision

- sePuedeEmitir ? 
  - Si tiene al menos 2 panelistas
  - Al menos la mitad de las tematicas son interesantes

- Cuando se emite, cada panelista opina sobre la primera
e inmediatamente dsp tira un remate gracioso. (asi con cada una)

- Cuando finaliza la emision podremos consultar quien fue el panelista estrella
Si aun no se emitio el programa, esta consulta no debe de ser valida

REQUISITOS:
4. Consultar si un programa puede emitirse
5. Hacer q se emita un programa
6. Saber quien fue el panelista estrella

 */