import Foundation
func ejercicio04() {
    print("\n--- Ejercicio 04: Función para protocolos ---")
    func longitud(_ texto: String) -> Int {
        texto.trimmingCharacters(in: .whitespacesAndNewlines).count
    }
    print(longitud("protocolos"))
}