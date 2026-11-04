import Foundation
func ejercicio13() {
    print("\n--- Ejercicio 13: Separar lógica ---")
    func normalizar(_ entrada: String) -> String {
        entrada.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
    }
    print(normalizar("estructuras"))
}