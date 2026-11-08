# Investigación técnica — nanos world / NarutoRP

Fecha de consulta: 2026-11-08.

## Alcance y estado

Investigación documental para preparar un servidor de pruebas. Se consultaron `AGENTS.md` y `docs/DOCUMENTO_MAESTRO.md` completos. No se han ejecutado pruebas de nanos world, instalado herramientas ni programado sistemas. Este informe no modifica el diseño aprobado ni convierte la estructura propuesta en una decisión definitiva.

La dirección solicitada, `https://docs.nanos.world/`, devolvió un error 502 durante la consulta. Se utilizó la documentación oficial accesible en [docs.nanos-world.com](https://docs.nanos-world.com/docs), versión marcada como `latest - a1.166.0`. Se priorizaron páginas `docs/` frente a `docs/next/` y no se utilizaron wikis de terceros como evidencia.

## 1. Instalación del servidor dedicado — confirmado

Las plataformas documentadas son Windows y Linux. En Windows existen estas opciones: usar `nanos-world/Server/NanosWorldServer.exe`, instalar la herramienta **nanos world Dedicated Server** desde Steam o descargarla mediante SteamCMD. Se requiere Microsoft Visual C++ Redistributable actualizado.

SteamCMD admite acceso anónimo y el servidor tiene el identificador `1936830`. La documentación ofrece las ramas `public` y `bleeding-edge`. También menciona Docker, mantenido por la comunidad. En Linux recomienda Ubuntu 24.04 y admite Ubuntu 22.04 y Debian 13; debe iniciarse mediante `./NanosWorldServer.sh`, que prepara las bibliotecas necesarias.

Los puertos predeterminados indicados para conexiones externas son `7777 TCP/UDP` y `7778 UDP`. La configuración de red doméstica no se ha comprobado.

Fuente: [Server Installation](https://docs.nanos-world.com/docs/core-concepts/server-manual/server-installation).

## 2. Arranque y primera conexión — confirmado

En Windows se ejecuta `NanosWorldServer.exe` con doble clic o desde una terminal situada en su carpeta. El primer arranque genera `Config.toml`. El servidor utiliza `playtest` por defecto; cliente y servidor deben usar la misma aplicación Steam (`playtest` o `game`).

En el mismo ordenador, la guía indica abrir el juego, entrar en **Find Servers → Quick Connect** y conectar a `127.0.0.1:7777`. Esta dirección apunta al propio equipo: desde otro ordenador no identifica al PC que aloja el servidor.

La prueba mínima puede mostrar al jugador como cámara voladora. No debe confundirse la ausencia de un personaje controlable con un fallo de conexión: el tutorial añade la creación y posesión del personaje en un paso posterior mediante scripts.

Fuente: [Quick Start](https://docs.nanos-world.com/docs/getting-started/quick-start).

## 3. Estructura de paquetes Lua — confirmado

Cada paquete vive en `Packages/<nombre-del-paquete>/`, junto a otros paquetes de la instalación del servidor. Su configuración es `Package.toml`. Los nombres identificadores deben estar en minúsculas, usar letras, números o guiones y tener como máximo 64 caracteres.

```text
Packages/
└── naruto-rp/
    ├── Package.toml
    ├── Server/
    │   └── Index.lua
    ├── Client/
    │   └── Index.lua
    └── Shared/
        └── Index.lua
```

`Server` contiene lógica del servidor; `Client`, del cliente; `Shared`, para ambos lados. Las carpetas `Client` y `Shared` se envían a los jugadores. Cada lado que contenga scripts utiliza `Index.lua` como punto de entrada para cargar otros archivos; no debe suponerse que todos los `.lua` se ejecutan automáticamente.

Un paquete de tipo `script` se selecciona en `packages`; uno de tipo `game-mode`, en `game_mode`. Solo se admite un modo de juego simultáneo. Los paquetes `map` describen mapas y pueden contener scripts y puntos de aparición.

Fuente: [Packages Guide](https://docs.nanos-world.com/docs/core-concepts/packages/packages-guide).

## 4. Configuración y mapa de pruebas — confirmado

`Config.toml` se genera y se reescribe al arrancar: comentarios y claves desconocidas pueden descartarse. En `[game]`, `map` selecciona el mapa, `game_mode` el modo y `packages` los scripts. También puede seleccionarse el mapa con `--map`.

Los mapas integrados `default-blank-map`, `default-empty-map` y `default-ocean-map` no requieren paquetes adicionales. `default-playground-map`, recomendado por la documentación, y el anterior `default-testing-map` son paquetes de Vault que se descargan al seleccionarlos.

La consola admite `map <map_package>` para cambiar de mapa y reconectar a los jugadores. `announce = false` oculta el anuncio en la lista, pero no impide conexiones directas. El modo dedicado y P2P tienen requisitos de conexión diferentes; P2P utiliza el relay de Steam. Las descargas de Vault tienen un mecanismo de autorización mediante token cuya necesidad concreta debemos comprobar al probarlas.

Fuente: [Server Configuration](https://docs.nanos-world.com/docs/core-concepts/server-manual/server-configuration).

## 5. Herramientas y límites de plataforma

### Edición y organización

La guía recomienda VS Code y la extensión **nanos world Lua**, que instala su dependencia Lua Language Server. Descarga anotaciones de la API para autocompletado y documentación. El editor puede sugerir métodos de ambos lados; hay que comprobar si cada API pertenece al servidor o al cliente.

Fuente: [Editor Setup](https://docs.nanos-world.com/docs/getting-started/editor-setup).

**Propuesta:** usar el Mac para documentación, Git y edición de Lua, y sincronizar el trabajo con el PC mediante el repositorio. La edición de archivos no equivale a poder ejecutar el juego o el servidor en macOS. No se ha comprobado la instalación de las extensiones en el Mac.

### Servidor y juego

**Confirmado:** el manual del servidor documenta Windows y Linux, sin instalador ni procedimiento nativo para macOS. No se ha encontrado soporte oficial nativo de servidor macOS en las fuentes consultadas.

**Recomendación:** usar el PC Windows para servidor y cliente durante las primeras pruebas. Linux sería una alternativa para alojarlo después; Windows no es obligatorio para el servidor dedicado.

**Sin verificar:** ejecución mediante virtualización, Wine, emulación o Docker en el Mac, especialmente con Apple Silicon. No se garantiza su viabilidad ni rendimiento. Las páginas consultadas no bastan para afirmar una matriz completa de compatibilidad del cliente; no se ha validado un cliente macOS.

### Mapas y recursos propios

La guía de Unreal indica la familia **5.7.X**, con instalación en Windows mediante Epic Games Launcher. Detalla Windows SDK `10.0.26100.0`, instalable directamente o mediante Visual Studio Installer. VS Code y Visual Studio son herramientas diferentes; el editor Lua no sustituye ese SDK. También existe una sección de Unreal para Linux.

Fuente: [Setting Up Unreal Engine](https://docs.nanos-world.com/docs/assets-modding/creating-assets/setting-up-ue).

El ADK es un proyecto preparado de Unreal, abierto mediante `NanosWorldADK.uproject`. Sus referencias internas `NanosWorld/` deben mantenerse intactas.

Fuente: [Assets Development Kit](https://docs.nanos-world.com/de/docs/assets-modding/creating-assets/adk-assets-development-kit).

Los recursos deben exportarse preparados para el juego mediante el proceso de cooking. La guía muestra resultados en `Saved/Cooked/Windows/NanosWorldADK/`, distintos de los archivos fuente de `Content/`.

Fuente: [Creating & Importing Assets](https://docs.nanos-world.com/docs/assets-modding/creating-assets/importing-assets).

**Propuesta:** realizar inicialmente el trabajo visual y la exportación en Windows. Las fuentes consultadas no verifican el flujo completo ADK/macOS hacia los recursos Windows del juego. No fijar un parche exacto de Unreal solo por ejemplos de la documentación: comprobar compatibilidad con la versión instalada del juego y del ADK. Para probar mapas integrados no necesitamos crear recursos ni instalar Unreal/ADK.

## 6. Propuesta de estructura del repositorio — no implementada

```text
NarutoRP/
├── AGENTS.md
├── README.md
├── .gitignore
├── docs/
│   ├── DOCUMENTO_MAESTRO.md
│   └── INVESTIGACION_TECNICA.md
├── config/
│   └── Config.example.toml
└── Packages/
    └── naruto-rp/
        ├── Package.toml
        ├── Server/
        ├── Client/
        └── Shared/
```

Esta organización es una propuesta para aprobar antes de implementarla. Salvo los documentos ya existentes y este informe, no se crean aquí los elementos mostrados. El nombre de este informe sustituye en la propuesta al nombre provisional `ENTORNO_TECNICO.md` mencionado durante la investigación.

Mantener la instalación descargada del servidor fuera del repositorio; en el futuro, copiar nuestros paquetes a su carpeta `Packages/`. Guardar en Git documentación, código propio y configuración de ejemplo sin secretos. Excluir ejecutables, paquetes descargados, cachés, registros, configuraciones privadas y tokens. El modo de juego propio y la separación futura en módulos todavía requieren aprobación.

## 7. Comprobaciones todavía pendientes

- Disponibilidad y acceso al Playtest en la cuenta Steam del usuario.
- Instalación y versiones reales de cliente, Dedicated Server, Visual C++ Redistributable, ADK, Unreal y SDK en el PC.
- Coincidencia de aplicación Steam y rama entre cliente y servidor.
- Arranque real, conexión local y carga visual del mapa.
- Autorización y descarga de Vault si usamos playground o sandbox.
- Conexión desde otro equipo, firewall y puertos; no se ha validado acceso desde Internet.
- Capacidades de combate, animaciones, entrada y demás sistemas del maestro: fuera del alcance de esta investigación y todavía sin verificar.

## 8. Siguientes pasos recomendados

1. En el PC Windows, abrir Steam y localizar la herramienta Dedicated Server o el ejecutable incluido en el juego. Actualizar cliente y servidor a versiones compatibles.
2. Confirmar Visual C++ Redistributable y arrancar el servidor desde su propia carpeta con `default-blank-map`, sin paquetes propios.
3. Abrir el Playtest en ese mismo PC y conectar por Quick Connect a `127.0.0.1:7777`.
4. Considerar superada la prueba cuando la consola confirme el arranque y el cliente entre y cargue el mapa, aunque inicialmente solo haya cámara voladora.
5. Probar después `default-playground-map`; comprobar descarga y autorización de Vault. Si queremos personaje y funciones de sandbox sin desarrollar sistemas, evaluar el paquete sandbox oficial antes de instalarlo.
6. Documentar versiones y resultado. Solo después aprobar y preparar la estructura del repositorio y un primer paquete propio.

El primer objetivo es comprobar **servidor + conexión + mapa en Windows**, sin diseñar Konoha ni implementar mecánicas de Naruto RP. Percepción mixta y detección de chakra conservan los estados del documento maestro; este informe no los modifica.
