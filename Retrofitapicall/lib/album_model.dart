// ignore: depend_on_referenced_packages
import 'package:json_annotation/json_annotation.dart';
part 'album_model.g.dart';

@JsonSerializable()
class Album {
  int? userId;
  int? id;
  String? title;
  String? body;

  Album({this.userId, this.id, this.title, this.body});

  Album.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    id = json['id'];
    title = json['title'];
    body = json['body'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['userId'] = userId;
    data['id'] = id;
    data['title'] = title;
    data['body'] = body;
    return data;
  }
}
