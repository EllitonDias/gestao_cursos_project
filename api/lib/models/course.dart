class Course {
  String id;
  String title;
  String description;
  int duration;

  Course({
    required this.id,
    required this.title,
    required this.description,
    required this.duration,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'description': description,
        'duration': duration,
      };

  static Course fromJson(Map<String, dynamic> json) => Course(
        id: json['id'],
        title: json['title'],
        description: json['description'],
        duration: json['duration'],
      );
}
