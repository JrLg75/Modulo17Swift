func propuesto10() {
    print("\n--- Ejercicio propuesto 10: Integrar funciones con otro componente ---")

    struct Calculadora {
        func sumar(_ a: Double, _ b: Double) -> Double { a + b }
        func multiplicar(_ a: Double, _ b: Double) -> Double { a * b }
    }

    struct Reporte {
        let calculadora: Calculadora

        func generar(base: Double, factor: Double) -> String {
            let suma = calculadora.sumar(base, factor)
            let producto = calculadora.multiplicar(base, factor)
            return "Base: \(base) | Factor: \(factor) | Suma: \(suma) | Producto: \(producto)"
        }
    }

    let reporte = Reporte(calculadora: Calculadora())
    print(reporte.generar(base: 4, factor: 3))
    print(reporte.generar(base: 10, factor: 0.5))
}