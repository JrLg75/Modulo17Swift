func ejercicio10() {
    print("\n--- Ejercicio 10: Gestionar errores ---")
    let texto = "42"
    if let numero = Int(texto) {
        print(numero)
    } else {
        print("El dato no es válido")
    }
}