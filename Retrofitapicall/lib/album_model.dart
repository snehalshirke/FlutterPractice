class Album {
  final int userId;
  final int id;
  final String title;
  const Album({required this.id, required this.userId, required this.title});

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(id: json['id'], userId: json['userId'], title: json['title']);
  }
}
