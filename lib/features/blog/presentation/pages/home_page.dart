import 'package:blog_graphql_zero/core/routing/routes.dart';
import 'package:blog_graphql_zero/features/blog/presentation/cubit/all_posts_cubit.dart';
import 'package:blog_graphql_zero/features/blog/presentation/cubit/authentication_cubit.dart';
import 'package:blog_graphql_zero/features/blog/presentation/widgets/posts_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final String user;

  @override
  void initState() {
    super.initState();
    user = context.read<AuthenticationCubit>().state.user;
  }

  @override
  Widget build(BuildContext context) {
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

    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Demo: Clean + Bloc(Cubit) + GetId (user: $user)'),
        actions: <Widget>[
          IconButton(
            onPressed: () => reloadPosts(context),
            icon: const Icon(Icons.refresh_outlined),
          ),
          IconButton(
            onPressed: () {
              // push to spash
              Navigator.of(context).pushNamedAndRemoveUntil(
                logoutRoute,
                (route) => false,
              );
            },
            icon: const Icon(Icons.logout),
          ),
        ],
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
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("Add Post... TODO..."),
              duration: Duration(seconds: 2),
            ),
          );
        },
        tooltip: 'New Post',
        child: const Icon(Icons.add),
      ),
    );
  }
}
