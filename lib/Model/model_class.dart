
class Planet {
  final String position;
  final String name;
  final String image;
  final String velocity;
  final String distance;
  final String description;

  Planet({
    required this.position,
    required this.name,
    required this.image,
    required this.velocity,
    required this.distance,
    required this.description,
  });


  factory Planet.fromJson(Map json) {
    return Planet(
      position: json['position'],
      name: json['name'],
      image: json['image'],
      velocity: json['velocity'],
      distance: json['distance'],
      description: json['description'],
    );
  }
}