import 'package:blog_graphql_zero/core/usecases/usecase.dart';
import 'package:blog_graphql_zero/features/blog/domain/entities/post.dart';
import 'package:blog_graphql_zero/features/blog/domain/repositories/post_repository.dart';
import 'package:blog_graphql_zero/features/blog/domain/usecases/get_all_posts.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'get_all_posts_test.mocks.dart';

@GenerateMocks([PostRepository])
void main() {
  late GetAllPosts usecase;
  late final PostRepository mockPostRepository;

  final tPosts = [
    const Post(id: "1", title: "Hello", body: "Hello Google"),
  ];

  setUp(() {
    mockPostRepository = MockPostRepository();
    usecase = GetAllPosts(mockPostRepository);
  });

  test('should get all posts from repository', () async {
    when(mockPostRepository.getAllPosts())
        .thenAnswer((_) async => Right(tPosts));

    final result = await usecase(NoParams());

    expect(result, Right(tPosts));
    verify(mockPostRepository.getAllPosts());
    verifyNoMoreInteractions(mockPostRepository);
  });
}
