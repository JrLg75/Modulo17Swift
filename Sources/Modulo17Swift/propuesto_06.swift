func propuesto06() {
    print("\n--- Ejercicio propuesto 06: Colección de al menos cinco elementos ---")

    struct Producto {
        let nombre: String
        let precio: Double
        let stock: Int
    }
    let productos = [
        Producto(nombre: "Teclado", precio: 25.0, stock: 10),
        Producto(nombre: "Ratón", precio: 15.0, stock: 0),
        Producto(nombre: "Monitor", precio: 200.0, stock: 5),
        Producto(nombre: "Auriculares", precio: 50.0, stock: 8),
        Producto(nombre: "Webcam", precio: 80.0, stock: 2)
    ]
    print("Total de productos: \(productos.count)")
    let disponibles = productos.filter { $0.stock > 0 }
    print("Con stock: \(disponibles.count)")

    let valorTotal = productos.reduce(0.0) { $0 + $1.precio * Double($1.stock) }
    print("Valor del inventario: \(valorTotal) €")

    let nombres = productos.map { $0.nombre }
    print("Nombres: \(nombres.joined(separator: ", "))")
}