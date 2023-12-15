import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:quizz_app_provider/login/screens/account_creation.dart';
import 'package:quizz_app_provider/login/screens/authentication.dart';
import 'package:quizz_app_provider/login/screens/login.dart';

GoRouter router() {
  return GoRouter(
    initialLocation: '/login',
    routes: [
      GoRoute(
        path: '/login',
        builder: (context, state) => const Login(),
      ),
      GoRoute(
        path: '/account_creation',
        builder: (context, state) => const AccountCreation(),
        routes: [
          // GoRoute(
          //   path: '',
          //   builder: (context, state) => const ,
          // ),
        ],
      ),
    ],
  );
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: router(),
    );
  }
}
