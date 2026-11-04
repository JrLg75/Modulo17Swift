import Foundation
// MARK: - 1. Modelos (a nivel de archivo, fuera de la función)
enum Prioridad: Int, Comparable, CaseIterable {
    case baja = 1
    case media = 2
    case alta = 3
    var etiqueta: String {
        switch self {
        case .baja: return "Baja"
        case .media: return "Media"
        case .alta: return "Alta"
        }
    }
    static func < (lhs: Prioridad, rhs: Prioridad) -> Bool {
        lhs.rawValue < rhs.rawValue
    }
}
enum EstadoTarea: String {
    case pendiente = "Pendiente"
    case enProgreso = "En progreso"
    case completada = "Completada"
}
enum ErrorTarea: Error, CustomStringConvertible {
    case tituloVacio
    case prioridadInvalida(Int)
    case tareaNoEncontrada(String)

    var description: String {
        switch self {
        case .tituloVacio:
            return "El título no puede estar vacío"
        case .prioridadInvalida(let valor):
            return "Prioridad inválida: \(valor). Debe ser 1 (baja), 2 (media) o 3 (alta)"
        case .tareaNoEncontrada(let id):
            return "No existe una tarea con id '\(id)'"
        }
    }
}
struct Tarea {
    let id: String
    let titulo: String
    let descripcion: String?
    let prioridad: Prioridad
    var estado: EstadoTarea

    var descripcionCorta: String {
        descripcion ?? "Sin descripción"
    }
}
protocol Validable {
    func validar() throws
}
extension Tarea: Validable {
    func validar() throws {
        if titulo.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
            throw ErrorTarea.tituloVacio
        }
    }
}
final class GestorTareas {
    private(set) var tareas: [Tarea] = []

    func agregar(_ tarea: Tarea) throws {
        try tarea.validar()
        tareas.append(tarea)
    }

    func cambiarEstado(id: String, nuevoEstado: EstadoTarea) throws {
        guard let idx = tareas.firstIndex(where: { $0.id == id }) else {
            throw ErrorTarea.tareaNoEncontrada(id)
        }
        tareas[idx].estado = nuevoEstado
    }
    func porPrioridad(_ prioridad: Prioridad) -> [Tarea] {
        tareas.filter { $0.prioridad == prioridad }
    }

    func completadas() -> [Tarea] {
        tareas.filter { $0.estado == .completada }
    }

    var estadisticas: (total: Int, completadas: Int, pendientes: Int) {
        let comp = completadas().count
        return (tareas.count, comp, tareas.count - comp)
    }
}

// MARK: - 2. Función de ejecución (aquí sí va la lógica)
func miniProyecto() {
    print("MINI-PROYECTO: Gestor de Tareas CLI")

    // Helpers de presentación (pueden quedar dentro de la función)
    func imprimirTarea(_ t: Tarea) {
        let icono: String
        switch t.estado {
        case .pendiente:  icono = "⏳"
        case .enProgreso: icono = "🔄"
        case .completada: icono = "✅"
        }
        print("  \(icono) [\(t.prioridad.etiqueta)] \(t.titulo)")
        print("     → \(t.descripcionCorta) | Estado: \(t.estado.rawValue)")
    }

    func listar(_ titulo: String, _ lista: [Tarea]) {
        print("\n\(titulo) (\(lista.count))")
        if lista.isEmpty {
            print("  (vacío)")
        } else {
            lista.forEach(imprimirTarea)
        }
    }

    // MARK: - ESCENARIO 1: Flujo normal

    print("\n────────── ESCENARIO 1: Flujo normal ──────────")
    let gestor = GestorTareas()

    let tareasIniciales: [Tarea] = [
        Tarea(id: "T1", titulo: "Estudiar Swift",
              descripcion: "Módulo 17", prioridad: .alta, estado: .pendiente),
        Tarea(id: "T2", titulo: "Hacer compras",
              descripcion: nil, prioridad: .baja, estado: .pendiente),
        Tarea(id: "T3", titulo: "Entregar proyecto",
              descripcion: "Mini-proyecto final", prioridad: .alta, estado: .enProgreso)
    ]

    for t in tareasIniciales {
        do {
            try gestor.agregar(t)
        } catch {
            print("❌ Error al agregar '\(t.titulo)': \(error)")
        }
    }

    listar("Todas las tareas", gestor.tareas)
    listar("Tareas de prioridad alta", gestor.porPrioridad(.alta))

    print("\n→ Cambiando estado de T1 a completada...")
    do {
        try gestor.cambiarEstado(id: "T1", nuevoEstado: .completada)
    } catch {
        print("❌ \(error)")
    }
    listar("Tareas completadas", gestor.completadas())

    let stats = gestor.estadisticas
    print("\n📊 Estadísticas: \(stats.total) total | \(stats.completadas) completadas | \(stats.pendientes) pendientes")

    // MARK: - ESCENARIO 2: Caso límite

    print("\n────────── ESCENARIO 2: Caso límite ──────────")
    let vacio = GestorTareas()
    listar("Gestor vacío", vacio.tareas)
    print("📊 Estadísticas vacías: \(vacio.estadisticas)")
    listar("Prioridad alta en gestor vacío", vacio.porPrioridad(.alta))

    // MARK: - ESCENARIO 3: Casos de error

    print("\n────────── ESCENARIO 3: Casos de error ──────────")

    // Título vacío
    do {
        try gestor.agregar(Tarea(id: "T4", titulo: "   ",
                                 descripcion: nil, prioridad: .media, estado: .pendiente))
        print("❌ Debió fallar")
    } catch {
        print("✅ Error esperado: \(error)")
    }

    // Tarea no encontrada
    do {
        try gestor.cambiarEstado(id: "T99", nuevoEstado: .completada)
    } catch {
        print("✅ Error esperado: \(error)")
    }

    // Prioridad inválida
    if let invalida = Prioridad(rawValue: 5) {
        print("Prioridad válida: \(invalida)")
    } else {
        print("✅ Prioridad inválida manejada correctamente (5 no es válida)")
    }
}