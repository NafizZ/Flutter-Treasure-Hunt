class Treasure {
  final String id;
  final String name;
  final String description;
  final double relativeX; // X-coordinate as a percentage (0.0 to 1.0)
  final double relativeY; // Y-coordinate as a percentage (0.0 to 1.0)

  Treasure({
    required this.id,
    required this.name,
    required this.description,
    required this.relativeX,
    required this.relativeY,
  });
}
