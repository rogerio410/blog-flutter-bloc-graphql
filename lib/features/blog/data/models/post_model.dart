import 'package:blog_graphql_zero/features/blog/domain/entities/post.dart';

class PostModel extends Post {
  const PostModel({
    required id,
    required title,
    required body,
  }) : super(id: id, title: title, body: body);

  factory PostModel.fromJson(Map<String, dynamic> json) {
    return PostModel(
      id: json['id'],
      title: json['title'],
      body: json['body'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'body': body,
    };
  }

  Post toEntity() => Post(
        id: id,
        title: title,
        body: body,
      );
}
