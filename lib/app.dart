import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:quizz_app_provider/common/theme.dart';
import 'package:quizz_app_provider/home_page.dart';
import 'package:quizz_app_provider/login/screens/account_creation.dart';
import 'package:quizz_app_provider/login/screens/login.dart';
import 'package:quizz_app_provider/models/user.dart';

GoRouter router() {
  return GoRouter(
    initialLocation: '/login',
    routes: [
      GoRoute(
        path: '/login',
        builder: (context, state) => const LoginPage(),
        routes: <RouteBase>[
          GoRoute(
            path: 'account_creation',
            builder: (context, state) => const AccountCreationPage(),
          ),
        ],
      ),
      GoRoute(
        path: '/home',
        builder: (context, state) => const HomePage(),
      ),
    ],
  );
}

User user = User(pseudo: '');

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: appTheme,
      routerConfig: router(),
    );
  }
}