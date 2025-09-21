class Exercise {
  final String id;
  final String name;
  final String description;
  final int sets;
  final int reps;
  final String imageUrl;

  Exercise({
    required this.id,
    required this.name,
    required this.description,
    required this.sets,
    required this.reps,
    required this.imageUrl,
  });

  factory Exercise.fromJson(Map<String, dynamic> json) {
    return Exercise(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      sets: json['sets'],
      reps: json['reps'],
      imageUrl: json['imageUrl'],
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'description': description,
    'sets': sets,
    'reps': reps,
    'imageUrl': imageUrl,
  };
}
