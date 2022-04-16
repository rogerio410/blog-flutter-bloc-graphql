import 'package:blog_graphql_zero/core/error/failures.dart';
import 'package:blog_graphql_zero/features/blog/domain/entities/post.dart';
import 'package:dartz/dartz.dart';

abstract class PostRepository {
  Future<Either<Failure, List<Post>>> getAllPosts();
}
