class Notas {
  String nombre;
  String edad;
  String descripcion;
  String? imagePath;

  Notas({
    required this.nombre,
    required this.edad,
    required this.descripcion,
    this.imagePath,
  });
}