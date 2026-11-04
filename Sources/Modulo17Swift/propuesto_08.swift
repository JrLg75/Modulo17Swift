func propuesto08() {
    print("\n--- Ejercicio propuesto 08: Estados de carga, éxito y error ---")

    enum EstadoRed {
        case cargando
        case exito(String)
        case error(String)
    }
    func simularPeticion(exito: Bool) -> EstadoRed {
        if exito {
            return .exito("Datos recibidos correctamente")
        } else {
            return .error("No se pudo conectar al servidor")
        }
    }
    let escenarios: [EstadoRed] = [
        .cargando,
        simularPeticion(exito: true),
        simularPeticion(exito: false)
    ]
    for estado in escenarios {
        switch estado {
        case .cargando:
            print("Cargando...")
        case .exito(let mensaje):
            print("Éxito: \(mensaje)")
        case .error(let mensaje):
            print("Error: \(mensaje)")
        }
    }
}