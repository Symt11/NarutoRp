# NarutoRP — nanos world

Proyecto de servidor Naruto RP: personajes originales en Konoha y parte del País del Fuego, durante la época clásica. El diseño aprobado está en [el documento maestro](docs/DOCUMENTO_MAESTRO.md).

## Estado

Estructura técnica inicial, sin sistemas de combate, estadísticas, clanes ni jutsus. Los puntos de entrada Lua solo contienen comentarios. **El servidor todavía no se ha probado.**

## Organización

- `AGENTS.md`: instrucciones para agentes; leer antes de trabajar.
- `docs/DOCUMENTO_MAESTRO.md`: decisiones confirmadas, propuestas e historial.
- `docs/INVESTIGACION_TECNICA.md`: investigación y límites de plataforma; su estructura propuesta refleja el momento anterior a esta preparación.
- `config/Config.example.toml`: ejemplo sin credenciales para pruebas en el propio equipo.
- `Packages/naruto-rp/Package.toml`: metadatos y configuración de un paquete de tipo `script`. No fija el modo de juego definitivo.
- `Packages/naruto-rp/Server/Index.lua`: entrada del servidor.
- `Packages/naruto-rp/Client/Index.lua`: entrada del cliente.
- `Packages/naruto-rp/Shared/Index.lua`: entrada compartida. Client y Shared se distribuyen a los jugadores; nunca guardar secretos allí.
- `.gitignore`: exclusiones de archivos locales y generados.

## Preparar una prueba en Windows

1. Instalar o actualizar Dedicated Server desde Steam, o localizar `Server/NanosWorldServer.exe` dentro del juego. Mantener esa instalación fuera del repositorio. Instalar Microsoft Visual C++ Redistributable si falta.
2. Copiar `Packages/naruto-rp/` a `Packages/naruto-rp/` de la instalación del servidor.
3. Si ya existe `Config.toml`, conservar una copia y comparar sus valores; no sobrescribirlo automáticamente. En una instalación nueva, copiar `config/Config.example.toml` junto al ejecutable con el nombre `Config.toml`.
4. Desde esa carpeta, ejecutar `NanosWorldServer.exe`. El servidor reescribe y completa su configuración al arrancar.
5. Abrir el cliente compatible (por defecto Playtest) en ese mismo PC y usar Quick Connect a `127.0.0.1:7777`. Comprobar consola, carga del paquete, conexión y mapa.

El ejemplo usa `default-blank-map`, sin recursos adicionales, y carga `naruto-rp` mediante `packages`. No crea personajes: una cámara voladora puede ser el resultado esperado. Cuatro plazas son un valor provisional de prueba, no una decisión sobre capacidad final.

La dirección `127.0.0.1` limita el ejemplo al propio equipo. `announce = false` evita anunciarlo, pero por sí solo no es control de acceso. Para LAN o Internet habrá que revisar dirección, firewall, puertos y configuración privada antes de habilitar acceso. No se ha preparado un servidor público.

En macOS podemos editar y usar Git; el servidor nativo está documentado para Windows/Linux. En Linux se inicia con `./NanosWorldServer.sh`. Unreal y ADK no son necesarios para este mapa integrado.

## Configuración y control de versiones

La compatibilidad del paquete se declara como `1.166`, correspondiente a la documentación `latest - a1.166.0` consultada el 2026-11-08. Comprobar la versión instalada antes de probar; este valor no instala ni actualiza el servidor. No se copió el antiguo `1.25` de la plantilla genérica.

No subir instalaciones descargadas, credenciales, configuración real, cachés ni recursos cocinados. `.gitignore` evita incorporaciones accidentales habituales, pero no sustituye revisar `git status` y el contenido que se va a publicar. Los futuros recursos fuente requieren una política de tamaño/licencias antes de añadirse.

## Fuentes oficiales de la estructura

- [Paquetes y sus tipos](https://docs.nanos-world.com/docs/core-concepts/packages/packages-guide).
- [Plantilla oficial de script](https://github.com/nanos-world/nanos-world-server/blob/main/_script.toml).
- [Configuración del servidor](https://docs.nanos-world.com/docs/core-concepts/server-manual/server-configuration).
- [Plantilla oficial Config.toml](https://github.com/nanos-world/nanos-world-server/blob/main/Config.toml).
- [Versiones de compatibilidad](https://docs.nanos-world.com/docs/core-concepts/packages/compatibility-versions).
- [Instalación](https://docs.nanos-world.com/docs/core-concepts/server-manual/server-installation) e [inicio rápido](https://docs.nanos-world.com/docs/getting-started/quick-start).
