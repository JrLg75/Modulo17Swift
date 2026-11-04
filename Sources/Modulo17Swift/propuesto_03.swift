import Foundation

func propuesto03() {
    print("\n--- Ejercicio propuesto 03: Reorganizar errores en componentes reutilizables ---")

    enum ErrorValidacion: Error {
        case campoVacio(String)
        case fueraDeRango(String, Int, ClosedRange<Int>)
    }
    func validarNoVacio(_ valor: String, campo: String) throws {
        if valor.trimmingCharacters(in: .whitespaces).isEmpty {
            throw ErrorValidacion.campoVacio(campo)
        }
    }
    func validarRango(_ valor: Int, campo: String, rango: ClosedRange<Int>) throws {
        if !rango.contains(valor) {
            throw ErrorValidacion.fueraDeRango(campo, valor, rango)
        }
    }
    func validarUsuario(nombre: String, edad: Int) throws {
        try validarNoVacio(nombre, campo: "nombre")
        try validarRango(edad, campo: "edad", rango: 0...120)
    }
    let casos: [(String, Int)] = [("Ana", 30), ("", 25), ("Luis", 200)]
    for (nombre, edad) in casos {
        do {
            try validarUsuario(nombre: nombre, edad: edad)
            print("✅ \(nombre), \(edad): válido")
        } catch let ErrorValidacion.campoVacio(campo) {
            print("❌ Campo vacío: \(campo)")
        } catch let ErrorValidacion.fueraDeRango(campo, valor, rango) {
            print("❌ \(campo) fuera de rango: \(valor) no está en \(rango)")
        } catch {
            print("❌ Error inesperado: \(error)")
        }
    }
}