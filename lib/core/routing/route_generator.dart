import 'package:blog_graphql_zero/core/routing/routes.dart';
import 'package:blog_graphql_zero/features/blog/domain/entities/post.dart';
import 'package:blog_graphql_zero/features/blog/presentation/pages/home_page.dart';
import 'package:blog_graphql_zero/features/blog/presentation/pages/login_page.dart';
import 'package:blog_graphql_zero/features/blog/presentation/pages/post_page.dart';
import 'package:blog_graphql_zero/features/blog/presentation/widgets/authentication_check.dart';
import 'package:flutter/material.dart';

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
      case authCheckRoute:
        return MaterialPageRoute(
          builder: (_) => const AuthenticationCheck(),
        );
      case loginRoute:
        return MaterialPageRoute(
          builder: (_) => const LoginPage(),
        );
      case homeRoute:
        return MaterialPageRoute(
          builder: (_) => const HomePage(),
        );
      case postDetailsRoute:
        if (args is Post) {
          return MaterialPageRoute(
            builder: (_) => PostPage(
              post: args,
            ),
          );
        }
        return errorPage;
      default:
        return errorPage;
    }
  }
}
