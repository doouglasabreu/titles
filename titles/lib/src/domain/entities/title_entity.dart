class Title {
  int id;
  int userId;
  String title;
  String description;

  Title({
    required this.id,
    required this.userId,
    required this.title,
    required this.description,
  });

  factory Title.fromJson(Map<String, Object?> json) => Title(
        id: json['id'] as int,
        userId: json['userId'] as int,
        title: json['title'] as String,
        description: json['description'] as String,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'userId': userId,
        'title': title,
        'description': description,
      };
}
