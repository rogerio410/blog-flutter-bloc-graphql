import 'package:blog_graphql_zero/features/blog/presentation/cubit/all_posts_cubit.dart';
import 'package:blog_graphql_zero/features/blog/presentation/widgets/posts_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: BlocConsumer<AllPostsCubit, AllPostsState>(
        listener: (context, state) {
          if (state is AllPostsError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.message)),
            );
          }
        },
        builder: (context, state) {
          if (state is AllPostsInitial) {
            return buildInitialState();
          } else if (state is AllPostsLoading) {
            return buildLoading();
          } else if (state is AllPostsLoaded) {
            return PostsList(posts: state.posts);
          } else {
            return buildInitialState();
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => reloadPosts(context),
        tooltip: 'New Post',
        child: const Icon(Icons.refresh_outlined),
      ),
    );
  }

  void reloadPosts(BuildContext context) {
    final allPostsCubit = context.read<AllPostsCubit>();
    allPostsCubit.getAllPosts();
  }

  Widget buildLoading() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget buildInitialState() {
    return const Center(
      child: Text("Clique on refresh button de load blog posts"),
    );
  }
}
