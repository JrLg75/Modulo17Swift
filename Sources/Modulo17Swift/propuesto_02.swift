import Foundation

func propuesto02() {
    print("\n--- Ejercicio propuesto 02: Validaciones en protocolos ---")

    protocol Validable {
        func validar() -> String?
    }
    struct Usuario: Validable {
        let nombre: String
        let edad: Int
        func validar() -> String? {
            if nombre.trimmingCharacters(in: .whitespaces).isEmpty {
                return "El nombre no puede estar vacío"
            }
            if edad < 0 || edad > 120 {
                return "La edad debe estar entre 0 y 120"
            }
            return nil
        }
    }
    let usuarios = [
        Usuario(nombre: "Carlos", edad: 30),
        Usuario(nombre: "  ", edad: 25),
        Usuario(nombre: "Elena", edad: 150)
    ]
    for u in usuarios {
        if let error = u.validar() {
            print("❌ \(u.nombre.isEmpty ? "(sin nombre)" : u.nombre): \(error)")
        } else {
            print("✅ \(u.nombre): datos válidos")
        }
    }
}