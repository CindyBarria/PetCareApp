class Notas {
  String nombre;
  String? edad;
  String descripcion;
  String? imagePath; // Usamos String? para que sea nullable

  Notas({
    required this.nombre,
    this.edad,
    required this.descripcion,
    this.imagePath, // Este puede ser nullable
  });
}