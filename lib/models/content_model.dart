import 'dart:convert';

Workout workoutFromJson(String str) => Workout.fromJson(json.decode(str));


class Workout {
  final List<Content> contents;
  final int baseExperience;
  final List<Genre> genres;
  final int id;
  final String name;
  final int order;
  final Genre genre;

  Workout({
    this.contents = const [],
    this.baseExperience = 0,
    this.genres = const [],
    this.id = 0,
    this.name = '',
    this.order = 0,
    this.genre = const Genre(),
  });

  factory Workout.fromJson(Map<String, dynamic> json) => Workout(
    contents: List<Content>.from(json["contents"].map((x) => Content.fromJson(x))) ?? [],
    baseExperience: json['baseExperience'] ?? 0,
    genres: List<Genre>.from(json["genres"].map((x) => Genre.fromJson(x))) ?? [],
    id: json["id"] ?? 1,
    name: json["name"] ?? '',
    order: json["order"] ?? 0,
    genre: Genre.fromJson(json["genre"]),
  );
}

class Content {
  final Genre content;
  final bool isHidden;
  final int slot;

 Content({
    this.content = const Genre(),
    this.isHidden = false,
    this.slot = 0,
  });

  factory Content.fromJson(Map<String, dynamic> json) => Content(
    content: Genre.fromJson(json["content"]),
    isHidden: json["is_hidden"] ?? false,
    slot: json["slot"] ?? 1,
  );

}

class Genre {
  final String name;
  final String url;

  const Genre({
    this.name = '',
    this.url = '',
  });

  factory Genre.fromJson(Map<String, dynamic> json) => Genre(
    name: json["name"] ?? '',
    url: json["url"] ?? '',
  );

}