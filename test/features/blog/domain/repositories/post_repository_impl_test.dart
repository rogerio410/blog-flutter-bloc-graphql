import 'package:blog_graphql_zero/core/error/exceptions.dart';
import 'package:blog_graphql_zero/core/error/failures.dart';
import 'package:blog_graphql_zero/core/platform/network_info.dart';
import 'package:blog_graphql_zero/features/blog/data/datasources/post_remote_datasource.dart';
import 'package:blog_graphql_zero/features/blog/data/models/post_model.dart';
import 'package:blog_graphql_zero/features/blog/data/repositories/post_repository_impl.dart';
import 'package:blog_graphql_zero/features/blog/domain/entities/post.dart';
import 'package:blog_graphql_zero/features/blog/domain/repositories/post_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'post_repository_impl_test.mocks.dart';

@GenerateMocks([PostRemoteDataSource, NetworkInfo])
void main() {
  late PostRemoteDataSource mockRemoteDataSource;
  late NetworkInfo mockNetworkInfo;
  late PostRepository repository;

  setUp(() {
    mockRemoteDataSource = MockPostRemoteDataSource();
    mockNetworkInfo = MockNetworkInfo();
    repository = PostRepositoryImpl(
      networkInfo: mockNetworkInfo,
      remoteDataSource: mockRemoteDataSource,
    );

    when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
  });

  group('GetAllPosts', () {
    PostModel tPostModel = const PostModel(
      id: "1",
      title: "Hello 1",
      body: "Hello Google 1",
    );

    PostModel tPostModel2 = const PostModel(
      id: "2",
      title: "Hello 2",
      body: "Hello Google 2",
    );

    final tPosts = [
      tPostModel,
      tPostModel2,
    ];

    test('should check if the device is online', () async {
      // when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);

      repository.getAllPosts();

      verify(mockNetworkInfo.isConnected);
    });

    test('should return remote data when the call to remote is successful',
        () async {
      when(mockRemoteDataSource.getAllPosts()).thenAnswer((_) async => tPosts);

      final result = await repository.getAllPosts();

      verify(mockRemoteDataSource.getAllPosts());

      expect(result, isA<Right<Failure, List<Post>>>());
    });

    test(
        'should return server failure when the call to remote data source is unsuccessful',
        () async {
      when(mockRemoteDataSource.getAllPosts()).thenThrow(ServerException());
      final result = await repository.getAllPosts();

      verify(mockRemoteDataSource.getAllPosts());
      expect(result, equals(Left(ServerFailure())));
    });
  });
}
