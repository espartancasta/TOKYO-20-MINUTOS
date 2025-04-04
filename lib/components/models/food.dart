class Food {
  final String name;
  final double price; // ✅ Cambiado a double
  final String imagePath;
  final String rating;

  Food({
    required this.name,
    required this.price,
    required this.imagePath,
    required this.rating,
  });
}
