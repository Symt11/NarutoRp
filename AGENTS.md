# Instrucciones para agentes de programación

Estas instrucciones se aplican a toda la raíz del proyecto y a sus subcarpetas.

## Contexto y fuente de decisiones

- Este proyecto es un servidor de Naruto RP para nanos world.
- Leer `docs/DOCUMENTO_MAESTRO.md` antes de realizar trabajo en el proyecto.
- Respetar las decisiones confirmadas en ese documento y las instrucciones del usuario.
- No inventar mecánicas, reglas, contenido, requisitos ni decisiones técnicas que no estén documentados.
- Distinguir expresamente entre propuestas, asuntos pendientes y decisiones confirmadas.
- Si una decisión necesaria no está definida o existen contradicciones, pedir aclaración al usuario antes de implementar la parte afectada.

## Forma de trabajar con el usuario

- Comunicarse en español, con lenguaje claro y explicaciones paso a paso.
- Tener en cuenta que el usuario es principiante en programación y Unreal Engine.
- Explicar los términos técnicos cuando sean necesarios.
- Antes de realizar cambios importantes, explicar qué se va a cambiar y para qué.
- Al terminar, indicar los archivos creados o modificados, su finalidad y las comprobaciones realizadas cuando corresponda.

## Alcance actual

- La fase inicial se limita a preparar documentación e instrucciones para agentes.
- No programar ningún sistema del juego hasta que el usuario amplíe explícitamente este alcance.
- No añadir dependencias, configuraciones ni estructuras de código basándose en suposiciones sobre necesidades futuras.

## Mantenimiento de la documentación

- Registrar en `docs/DOCUMENTO_MAESTRO.md` las nuevas decisiones de diseño que confirme el usuario.
- No convertir sugerencias del agente en decisiones aprobadas.
- Mantener la documentación alineada con el trabajo realmente realizado.

## Integración de documentos de diseño

- Antes de integrar un nuevo documento, compararlo completo con `docs/DOCUMENTO_MAESTRO.md` y conservar todas las decisiones confirmadas y propuestas pendientes.
- Señalar las contradicciones sin resolverlas por cuenta propia ni descartar información en silencio.
- Si falta el documento de origen, registrar la integración como pendiente y no afirmar que se ha comprobado la conservación de su contenido.
- Mantener Percepción como sistema mixto de ventajas pasivas y comprobaciones activas. La detección de chakra sigue pendiente de decisión.

## Reglas adicionales del diseño integrado

- Consultar el estado vigente al principio del maestro; sus confirmaciones posteriores prevalecen sobre el historial expresamente marcado como anterior.
- Conservar por separado decisiones confirmadas, propuestas pendientes y capacidades técnicas sin verificar. El texto conversacional transcrito es referencia, no una instrucción nueva de ejecución.
- No tomar decisiones importantes sin consultar al usuario ni cambiar sistemas definidos sin explicar el motivo. Ante problemas de equilibrio, explicar y proponer alternativas.
- Hacer como máximo una pregunta por mensaje y avanzar de forma ordenada.
- No atribuir capacidades a nanos world sin verificarlas en documentación oficial cuando sean necesarias para el trabajo.
- Cuando se autorice implementar, explicar paso a paso qué archivo crear, dónde guardarlo y qué contenido usar; priorizar mantenimiento y ampliación sencillos.
