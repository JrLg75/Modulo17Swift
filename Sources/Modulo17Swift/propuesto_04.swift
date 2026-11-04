func propuesto04() {
    print("\n--- Ejercicio propuesto 04: Interfaz para teléfono y tableta (simulada) ---")

    let usuario: String? = "Ana"
    let correo: String? = nil
    let edad: Int? = 28

    func linea(_ ancho: Int) -> String {
        String(repeating: "─", count: ancho)
    }
    func mostrarTelefono() {
        let ancho = 28
        print("\n📱 VISTA TELÉFONO (vertical, 1 columna)")
        print(linea(ancho))
        print("│ Usuario: \(usuario ?? "No definido")")
        print("│ Correo:  \(correo ?? "No registrado")")
        print("│ Edad:    \(edad.map { "\($0) años" } ?? "No definida")")
        print(linea(ancho))
    }
    func mostrarTablet() {
        let ancho = 60
        print("\n📟 VISTA TABLETA (horizontal, 2 columnas)")
        print(linea(ancho))
        print("│ Usuario: \(usuario ?? "No definido")          │ Correo: \(correo ?? "No registrado")")
        print("│ Edad:    \(edad.map { "\($0) años" } ?? "No definida")              │ Estado: activo")
        print(linea(ancho))
    }
    mostrarTelefono()
    mostrarTablet()
}