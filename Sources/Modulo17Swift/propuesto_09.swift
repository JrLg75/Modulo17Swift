func propuesto09() {
    print("\n--- Ejercicio propuesto 09: Accesibilidad y claridad ---")

    struct Usuario {
        let nombreCompleto: String
        let correoElectronico: String?
    }

    let usuario = Usuario(nombreCompleto: "María López", correoElectronico: nil)

    let mensajeCorreo: String
    if let correo = usuario.correoElectronico, !correo.isEmpty {
        mensajeCorreo = "Correo de contacto: \(correo)"
    } else {
        mensajeCorreo = "No se ha registrado un correo de contacto."
    }

    print("Usuario: \(usuario.nombreCompleto)")
    print(mensajeCorreo)
}