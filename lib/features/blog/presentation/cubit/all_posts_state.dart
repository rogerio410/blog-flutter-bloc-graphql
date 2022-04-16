part of 'all_posts_cubit.dart';

@immutable
abstract class AllPostsState extends Equatable {
  const AllPostsState();
}

class AllPostsInitial extends Equatable implements AllPostsState {
  const AllPostsInitial();

  @override
  List<Object> get props => [];
}

class AllPostsLoading extends Equatable implements AllPostsState {
  const AllPostsLoading();

  @override
  List<Object> get props => [];
}

class AllPostsLoaded extends Equatable implements AllPostsState {
  final List<Post> posts;
  const AllPostsLoaded(this.posts);

  @override
  List<Object> get props => [];
}

class AllPostsError extends Equatable implements AllPostsState {
  final String message;
  const AllPostsError(this.message);

  @override
  List<Object> get props => [];
}
