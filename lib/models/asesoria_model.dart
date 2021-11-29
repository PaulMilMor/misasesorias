class AsesoriaModel {
  String titulo;
  String categoria;
  int precio;
  String descripcion;
  String imagen;
  String instructor;
  int valoracion;
  bool bookmarked;

  AsesoriaModel({
    required this.titulo,
    required this.categoria,
    required this.precio,
    required this.descripcion,
    required this.imagen,
    required this.instructor,
    required this.valoracion,
    this.bookmarked = false,
  });
}
