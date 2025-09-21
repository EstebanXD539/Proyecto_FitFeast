import 'exercise_model.dart';

class Workout {
  final String id;
  final String title;
  final String description;
  final List<Exercise> exercises;

  Workout({
    required this.id,
    required this.title,
    required this.description,
    required this.exercises,
  });

  factory Workout.fromJson(Map<String, dynamic> json) {
    return Workout(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      exercises: (json['exercises'] as List)
          .map((e) => Exercise.fromJson(e))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'title': title,
    'description': description,
    'exercises': exercises.map((e) => e.toJson()).toList(),
  };
}
