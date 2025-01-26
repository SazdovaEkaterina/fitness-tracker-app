class Workout {
  int id;
  String name;
  String image;

  Workout({required this.id, required this.name, required this.image});

  Workout.fromJson(Map<String, dynamic> data)
      : id = data['id'],
        name = data['name'],
        image = data['img'];

  Map<String, dynamic> toJson() => {'id' : id, 'name' : name, 'img' : image};
}