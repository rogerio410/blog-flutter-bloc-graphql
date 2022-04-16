import 'dart:convert';

import 'package:blog_graphql_zero/features/blog/data/models/post_model.dart';
import 'package:blog_graphql_zero/features/blog/domain/entities/post.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../fixtures/fixture_reader.dart';

void main() {
  PostModel tPostModel = const PostModel(
    id: "1",
    title: "Hello 1",
    body: "Hello Google 1",
  );

  test(
    "should be a subclass of Post entity",
    () async {
      expect(tPostModel, isA<Post>());
    },
  );

  group('fromJson', () {
    test(
      'should return a valid model when read from JSON objects',
      () {
        final Map<String, dynamic> jsonMap = json.decode(fixture('post.json'));

        final result = PostModel.fromJson(jsonMap);

        expect(result, tPostModel);
      },
    );
  });

  group('toJson', () {
    test(
      'should return a JSON map containing the proper data',
      () {
        final result = tPostModel.toJson();

        final expectedJsonMap = {
          "id": "1",
          "title": "Hello 1",
          "body": "Hello Google 1"
        };

        expect(result, expectedJsonMap);
      },
    );
  });
}
