class Title {
  int id;
  int userId;
  String title;
  String body;

  Title({
    required this.id,
    required this.userId,
    required this.title,
    required this.body,
  });

  factory Title.fromJson(Map<String, Object?> json) => Title(
        id: json['id'] as int,
        userId: json['userId'] as int,
        title: json['title'] as String,
        body: json['body'] as String,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'userId': userId,
        'title': title,
        'body': body,
      };
}
