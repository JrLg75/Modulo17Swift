func propuesto01() {
    print("\n--- Ejercicio propuesto 01: Ampliar estructuras ---")

    enum Nivel: String {
        case principiante
        case intermedio
        case avanzado   // caso adicional 1
        case experto    // caso adicional 2
    }
    struct Estudiante {
        let nombre: String
        let nivel: Nivel
    }
    let estudiantes = [
        Estudiante(nombre: "Ana", nivel: .principiante),
        Estudiante(nombre: "Luis", nivel: .avanzado),
        Estudiante(nombre: "Marta", nivel: .experto)
    ]
    for e in estudiantes {
        print("\(e.nombre) → nivel: \(e.nivel.rawValue)")
    }
}