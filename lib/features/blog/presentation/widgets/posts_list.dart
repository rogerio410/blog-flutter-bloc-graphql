import 'package:blog_graphql_zero/features/blog/domain/entities/post.dart';
import 'package:flutter/material.dart';

class PostsList extends StatelessWidget {
  const PostsList({Key? key, required List<Post> this.posts}) : super(key: key);
  final List<Post> posts;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        padding: const EdgeInsets.all(20.0),
        itemCount: posts.length,
        itemBuilder: (context, index) {
          final post = posts[index];
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: ListTile(
              leading: const CircleAvatar(
                child: Icon(Icons.notes),
              ),
              title: Text(
                post.title,
                style: const TextStyle(fontSize: 20),
              ),
              subtitle: Text(
                post.body,
                style: const TextStyle(fontSize: 14.0),
              ),
              trailing: const Icon(Icons.keyboard_arrow_right),
              onTap: () {},
            ),
          );
        });
  }
}
