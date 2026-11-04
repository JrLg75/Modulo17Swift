func propuesto07() {
    print("\n--- Ejercicio propuesto 07: Guardar y recuperar datos con protocolos ---")

    protocol Almacenable {
        var id: String { get }
        var descripcion: String { get }
    }
    struct Libro: Almacenable {
        let id: String
        let titulo: String
        let autor: String
        var descripcion: String { "\(titulo) — \(autor)" }
    }
    final class AlmacenEnMemoria {
        private var datos: [String: Almacenable] = [:]
        func guardar(_ item: Almacenable) {
            datos[item.id] = item
        }
        func recuperar(id: String) -> Almacenable? {
            datos[id]
        }
        func listar() -> [Almacenable] {
            Array(datos.values)
        }
    }
    let almacen = AlmacenEnMemoria()
    almacen.guardar(Libro(id: "L1", titulo: "Swift Básico", autor: "Ana"))
    almacen.guardar(Libro(id: "L2", titulo: "Patrones", autor: "Luis"))
    if let libro = almacen.recuperar(id: "L1") {
        print("Recuperado: \(libro.descripcion)")
    } else {
        print("No encontrado")
    }
    print("Total almacenado: \(almacen.listar().count)")
}