import 'package:blog_graphql_zero/core/usecases/usecase.dart';
import 'package:blog_graphql_zero/features/blog/domain/entities/post.dart';
import 'package:blog_graphql_zero/features/blog/domain/usecases/get_all_posts.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

part 'all_posts_state.dart';

@Injectable()
class AllPostsCubit extends Cubit<AllPostsState> {
  final GetAllPosts _getAllPosts;

  AllPostsCubit(this._getAllPosts) : super(const AllPostsInitial());

  Future<void> getAllPosts() async {
    emit(const AllPostsLoading());
    final either = await _getAllPosts(NoParams());
    either.fold(
      (failure) => emit(const AllPostsError('Error on load')),
      (posts) => emit(AllPostsLoaded(posts)),
    );
  }
}
