import 'package:blog_graphql_zero/core/error/exceptions.dart';
import 'package:blog_graphql_zero/core/error/failures.dart';
import 'package:blog_graphql_zero/core/platform/network_info.dart';
import 'package:blog_graphql_zero/features/blog/data/datasources/post_remote_datasource.dart';
import 'package:blog_graphql_zero/features/blog/domain/entities/post.dart';
import 'package:blog_graphql_zero/features/blog/domain/repositories/post_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: PostRepository)
class PostRepositoryImpl implements PostRepository {
  final NetworkInfo networkInfo;
  final PostRemoteDataSource remoteDataSource;

  PostRepositoryImpl({
    required this.networkInfo,
    required this.remoteDataSource,
  });

  @override
  Future<Either<Failure, List<Post>>> getAllPosts() async {
    if (await networkInfo.isConnected) {
      try {
        final models = await remoteDataSource.getAllPosts();
        final entities = models.map<Post>((post) => post.toEntity()).toList();
        return Right(entities);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(ServerFailure());
    }
  }
}
