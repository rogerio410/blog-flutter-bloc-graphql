import 'package:blog_graphql_zero/core/error/exceptions.dart' as exceptions;
import 'package:blog_graphql_zero/features/blog/data/models/post_model.dart';
import 'package:blog_graphql_zero/features/blog/data/queries/gql_queries.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:injectable/injectable.dart';

abstract class PostRemoteDataSource {
  Future<List<PostModel>> getAllPosts();
}

@LazySingleton(as: PostRemoteDataSource)
class PostRemoteDataSourceImpl implements PostRemoteDataSource {
  final GraphQLClient _client;

  PostRemoteDataSourceImpl(this._client);

  @override
  Future<List<PostModel>> getAllPosts() async {
    try {
      final result = await _client.query(QueryOptions(
        document: gql(GqlQuery.allPostsQuery),
        variables: const {
          "options": {
            "paginate": {"page": 1, "limit": 50}
          },
        },
      ));

      if (result.data == null) {
        return [];
      }

      return result.data?['posts']['data']
          .map((post) => PostModel.fromJson(post))
          .cast<PostModel>()
          .toList();
    } on Exception {
      throw exceptions.ServerException();
    }
  }
}
