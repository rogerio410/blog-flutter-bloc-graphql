part of 'all_posts_cubit.dart';

@immutable
abstract class AllPostsState extends Equatable {
  const AllPostsState();

  @override
  List<Object> get props => [];
}

class AllPostsInitial extends AllPostsState {}

class AllPostsLoading extends AllPostsState {}

class AllPostsLoaded extends AllPostsState {
  final List<Post> posts;
  const AllPostsLoaded(this.posts);

  @override
  List<Object> get props => [posts];
}

class AllPostsError extends AllPostsState {
  final String message;
  const AllPostsError(this.message);

  @override
  List<Object> get props => [message];
}
