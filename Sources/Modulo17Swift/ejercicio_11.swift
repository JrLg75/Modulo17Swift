func ejercicio11() {
    print("\n--- Ejercicio 11: Representar estado ---")
    enum Estado {
        case inicial, cargando, listo
    }
    let estado = Estado.listo
    print("variables y opcionales: \(estado)")
}