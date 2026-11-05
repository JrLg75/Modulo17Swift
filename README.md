# Módulo 17 — Programación con Swift

Laboratorio completo: 15 ejercicios resueltos + 10 ejercicios propuestos + mini-proyecto integrador.

## 📋 Descripción

Este repositorio contiene la resolución del Módulo 17 del curso de Desarrollo de Aplicaciones Móviles. Todos los ejercicios son de consola y se ejecutan con Swift Package Manager, sin necesidad de Xcode.

## 🖥️ Entorno utilizado

| Componente | Versión / detalle |
|---|---|
| Sistema operativo | Windows 10/11 (64 bits) |
| Toolchain de Swift | Swift 6.4.2 (`swift-6.4.2-RELEASE`) |
| Target | `x86_64-unknown-windows-msvc` |
| Editor | Visual Studio Code + extensión oficial `swiftlang.swift` |
| Gestor de paquetes | Swift Package Manager |

**Verificación del entorno:**

```powershell
swift --version
# Swift version 6.4.2 (swift-6.4.2-RELEASE)
# Target: x86_64-unknown-windows-msvc
```

## 📁 Estructura del proyecto

```text
Modulo17Swift/
├── Package.swift
├── README.md
├── .gitignore
└── Sources/
    └── Modulo17Swift/
        ├── main.swift              # Selector de ejecución
        ├── ejercicio_01.swift      # 15 ejercicios resueltos
        ├── ...
        ├── ejercicio_15.swift
        ├── propuesto_01.swift      # 10 ejercicios propuestos
        ├── ...
        ├── propuesto_10.swift
        └── mini_proyecto.swift     # Mini-proyecto integrador
```

Cada archivo define una función con nombre único (`ejercicio01()`, `propuesto01()`, `miniProyecto()`). `main.swift` las invoca en orden.

## 🚀 Cómo ejecutar

Desde la carpeta raíz del proyecto:

```powershell
# Compilar y ejecutar todo
swift run

# Solo compilar (verificar que no hay errores)
swift build
```

La salida muestra, en orden, los 15 ejercicios resueltos, los 10 propuestos y el mini-proyecto, cada uno precedido por un separador con su título.

## 📚 Contenido del laboratorio

### Ejercicios resueltos (01–15)

| # | Tema | Concepto demostrado |
|---|---|---|
| 01 | Variables y opcionales | `let`, interpolación de strings |
| 02 | Funciones | Operador ternario, condicionales |
| 03 | Estructuras | `for-in` sobre array |
| 04 | Protocolos | `trimmingCharacters`, `CharacterSet` |
| 05 | Errores | Validación de strings vacíos |
| 06 | Variables y opcionales | `append`, `count` |
| 07 | Funciones | `filter` con closure |
| 08 | Estructuras | `map` con closure |
| 09 | Protocolos | `struct` con propiedades |
| 10 | Errores | `if let` con `Int(_:)` |
| 11 | Variables y opcionales | `enum` con casos |
| 12 | Funciones | `toggle()` sobre `Bool` |
| 13 | Estructuras | `trimmingCharacters` + `uppercased()` |
| 14 | Protocolos | `reduce`, `assert` |
| 15 | Errores | `enumerated()` sobre array |

### Ejercicios propuestos (01–10)

| # | Tarea | Concepto aplicado |
|---|---|---|
| 01 | Ampliar estructuras con dos casos adicionales | `enum` extendido, `rawValue` |
| 02 | Validaciones en protocolos | Protocolo `Validable`, mensajes claros |
| 03 | Reorganizar errores en componentes reutilizables | Funciones puras, `throws`, `enum Error` |
| 04 | Interfaz para teléfono y tableta (simulada) | Opcionales, layouts en consola |
| 05 | Tres pruebas para una función | `do-catch`, `assert`, casos válido/límite/inválido |
| 06 | Colección de al menos cinco elementos | `struct`, `filter`, `reduce`, `map` |
| 07 | Guardar y recuperar datos con protocolos | Protocolo `Almacenable`, diccionario |
| 08 | Estados de carga, éxito y error | `enum` con valores asociados, `switch` exhaustivo |
| 09 | Accesibilidad y claridad | Nombres descriptivos, mensajes naturales |
| 10 | Integrar funciones con otro componente | Inyección de dependencias, composición |

### Mini-proyecto integrador

**Gestor de Tareas CLI:** Modela tareas con prioridad y estado. Permite agregar, cambiar estado, filtrar por prioridad y calcular estadísticas. Integra `structs`, `enums` con valores asociados, protocolos, manejo de errores, opcionales, colecciones y tuplas.

**Escenarios probados:**
* **Normal:** Gestor con 3 tareas, listado, filtrado, cambio de estado y estadísticas.
* **Límite:** Gestor vacío, verificación de que todas las operaciones funcionan con 0 tareas.
* **Error:** Título vacío, ID inexistente, prioridad fuera de rango.

## ⚠️ Limitaciones conocidas

* **Compilación de interfaz de usuario:** No es posible compilar SwiftUI ni ejecutar el simulador de iOS en Windows, ya que dependen de frameworks exclusivos de macOS y Xcode. Por ello, el *Ejercicio propuesto 04* se resolvió como simulación de consola con dos layouts (vertical y horizontal).
* **Importación de módulos:** Cada archivo debe importar `Foundation` explícitamente cuando usa `trimmingCharacters` o `CharacterSet`. En macOS con Xcode a veces se importa implícitamente, pero en Windows con Swift Package Manager no.
* **Modo debug por defecto:** Los `assert` del *Ejercicio 14* se evalúan en este entorno, lo cual es deseable para el propósito práctico del ejercicio.
