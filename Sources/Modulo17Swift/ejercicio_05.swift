import Foundation
func ejercicio05() {
    print("\n--- Ejercicio 05: Validar errores ---")
    func esValido(_ valor: String) -> Bool {
        !valor.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
    }
    print(esValido("muestra"), esValido("  "))
}