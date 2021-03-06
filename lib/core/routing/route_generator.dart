import 'package:blog_graphql_zero/core/injection/injection.dart';
import 'package:blog_graphql_zero/core/routing/routes.dart';
import 'package:blog_graphql_zero/features/blog/domain/entities/post.dart';
import 'package:blog_graphql_zero/features/blog/presentation/cubit/all_posts_cubit.dart';
import 'package:blog_graphql_zero/features/blog/presentation/pages/home_page.dart';
import 'package:blog_graphql_zero/features/blog/presentation/pages/login_page.dart';
import 'package:blog_graphql_zero/features/blog/presentation/pages/post_page.dart';
import 'package:blog_graphql_zero/features/blog/presentation/pages/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RouteGenerator {
  static final errorPage = MaterialPageRoute(builder: (_) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Error'),
      ),
      body: const Center(
        child: Text('ERROR'),
      ),
    );
  });

  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    final routeName = settings.name;

    switch (routeName) {
      case splashRoute:
        return MaterialPageRoute(
          builder: (_) => const SplashPage(),
          settings: const RouteSettings(name: splashRoute),
        );
      case loginRoute:
        return MaterialPageRoute(
          builder: (_) => const LoginPage(),
          settings: const RouteSettings(name: loginRoute),
        );
      case logoutRoute:
        return MaterialPageRoute(
          builder: (_) => const SplashPage(isLogout: true),
          settings: const RouteSettings(name: logoutRoute),
        );
      case homeRoute:
        return MaterialPageRoute(
          builder: (_) => BlocProvider<AllPostsCubit>(
            create: (_) => getIt(),
            child: const HomePage(),
          ),
          settings: const RouteSettings(name: homeRoute),
        );
      case postDetailsRoute:
        if (args is Post) {
          return MaterialPageRoute(
            builder: (_) => PostPage(
              post: args,
            ),
            settings: const RouteSettings(name: postDetailsRoute),
          );
        }
        return errorPage;
      default:
        return errorPage;
    }
  }
}
