# Naruto RP — nanos world

Estructura técnica inicial del proyecto. No contiene mecánicas ni un modo de juego implementado, y no se ha arrancado el servidor para validarla.

## Documentación del proyecto

Leer primero [AGENTS.md](AGENTS.md), [el documento maestro](docs/DOCUMENTO_MAESTRO.md) y [la investigación técnica](docs/INVESTIGACION_TECNICA.md). Se conservan intactos. Esta preparación se realiza por autorización expresa del usuario; no confirma propuestas de diseño ni da por superadas las pruebas pendientes del informe.

## Archivos

- `config/Config.example.toml`: ejemplo mínimo sin secretos para una futura prueba con mapa integrado y sin paquetes propios.
- `Packages/naruto-rp/Package.toml`: plantilla incompleta, con metadatos provisionales. El tipo de paquete y su compatibilidad con la versión instalada están pendientes; no es un paquete listo para cargar.
- `Packages/naruto-rp/Server/`: reservado para futura lógica del servidor.
- `Packages/naruto-rp/Client/`: reservado para futura lógica del cliente.
- `Packages/naruto-rp/Shared/`: reservado para futuros archivos compartidos.
- `.gitignore`: excluye configuraciones privadas, secretos y archivos locales de ejecución.

Los archivos vacíos `.gitkeep` solo permiten conservar las carpetas en Git. No son scripts. No se crean `Index.lua` hasta autorizar trabajo que los necesite. Client y Shared se distribuyen a los jugadores: nunca guardar secretos allí.

## Preparación para una prueba futura (no realizada)

1. Mantener la instalación del servidor fuera de este repositorio, en Windows o Linux.
2. Revisar el ejemplo frente a la versión realmente instalada. Cuando se autorice la prueba, copiarlo como `Config.toml` a la raíz de esa instalación, junto al ejecutable; no arrancarlo desde este repositorio.
3. El ejemplo usa `default-blank-map`, sin modo propio ni paquetes activos. No copiar ni activar todavía la plantilla `naruto-rp`.
4. Guardar contraseñas y tokens únicamente en la configuración privada de la instalación. No subirlos a Git.
5. Antes de cargar nuestro paquete, aprobar su tipo, completar su configuración y comprobar compatibilidad. Crear entonces los puntos de entrada Lua que hagan falta.

`announce = false` evita anunciarlo en la lista; no bloquea conexiones directas. El servidor reescribe `Config.toml` al arrancar y puede descartar comentarios o claves desconocidas.

## Verificación documental

Claves y secciones consultadas el 2026-11-08 en documentación oficial marcada como latest a1.166.0:

- [Server Configuration](https://docs.nanos-world.com/docs/core-concepts/server-manual/server-configuration): `[discover].announce` y `[game].map/game_mode/packages`.
- [Packages Guide](https://docs.nanos-world.com/docs/core-concepts/packages/packages-guide): carpetas, puntos de entrada y metadatos.
- [Ejemplo oficial de metadatos](https://github.com/nanos-world/nanos-world-server/blob/main/_meta.toml): `[meta].title/author/version`.

La sintaxis TOML se comprueba por separado de la ejecución: estas comprobaciones no garantizan el arranque, la conexión ni compatibilidad con una instalación concreta.
