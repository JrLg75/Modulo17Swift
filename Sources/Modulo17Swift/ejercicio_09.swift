func ejercicio09() {
    print("\n--- Ejercicio 09: Modelar objeto ---")
    struct Registro {
        let nombre: String
        let activo: Bool
    }
    let registro = Registro(nombre: "protocolos", activo: true)
    print(registro.nombre, registro.activo)
}