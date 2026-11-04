func ejercicio14() {
    print("\n--- Ejercicio 14: Comprobar comportamiento ---")
    let resultado = [1, 2, 3].reduce(0, +)
    assert(resultado == 6, "La suma debe ser 6")
    print("Prueba correcta: \(resultado)")
}