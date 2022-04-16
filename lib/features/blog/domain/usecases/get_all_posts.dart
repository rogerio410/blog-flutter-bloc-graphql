import 'package:blog_graphql_zero/core/error/failures.dart';
import 'package:blog_graphql_zero/core/usecases/usecase.dart';
import 'package:blog_graphql_zero/features/blog/domain/entities/post.dart';
import 'package:blog_graphql_zero/features/blog/domain/repositories/post_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetAllPosts extends UseCase<List<Post>, NoParams> {
  final PostRepository repository;

  GetAllPosts(this.repository);

  @override
  Future<Either<Failure, List<Post>>> call(NoParams params) async {
    return repository.getAllPosts();
  }
}
