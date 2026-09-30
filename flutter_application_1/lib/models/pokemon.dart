class Pokemon {
  final int id;
  final String name;
  final String image;
  final List<String> types;
  final int height;
  final int weight;
  final String ability;

  const Pokemon({
    required this.id,
    required this.name,
    required this.image,
    required this.types,
    required this.height,
    required this.weight,
    required this.ability,
  });
}
