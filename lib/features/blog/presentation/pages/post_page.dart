import 'package:blog_graphql_zero/features/blog/domain/entities/post.dart';
import 'package:flutter/material.dart';

class PostPage extends StatefulWidget {
  final Post post;

  const PostPage({
    Key? key,
    required this.post,
  }) : super(key: key);

  @override
  State<PostPage> createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.post.title),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Text(widget.post.body),
          ],
        ),
      ),
    );
  }
}
