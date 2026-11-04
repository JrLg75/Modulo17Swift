import Foundation

func propuesto05() {
    print("\n--- Ejercicio propuesto 05: Tres pruebas para una función ---")
    enum ErrorDivision: Error {
        case divisionPorCero
    }
    func dividir(_ a: Double, _ b: Double) throws -> Double {
        if b == 0 {
            throw ErrorDivision.divisionPorCero
        }
        return a / b
    }
    func probar(_ descripcion: String, _ bloque: () throws -> Void) {
        do {
            try bloque()
            print("\(descripcion): PASÓ")
        } catch {
            print("\(descripcion): FALLÓ → \(error)")
        }
    }
    // Caso válido
    probar("Caso válido (10 / 2 = 5)") {
        let r = try dividir(10, 2)
        assert(r == 5, "Se esperaba 5")
    }
    // Caso límite
    probar("Caso límite (0 / 5 = 0)") {
        let r = try dividir(0, 5)
        assert(r == 0, "Se esperaba 0")
    }
    // Caso inválido
    probar("Caso inválido (10 / 0 lanza error)") {
        _ = try dividir(10, 0)
        assertionFailure("Debió lanzar error")
    }
}