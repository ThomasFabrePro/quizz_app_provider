import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:quizz_app_provider/common/theme.dart';
import 'package:quizz_app_provider/home_page.dart';
import 'package:quizz_app_provider/login/screens/account_creation.dart';
import 'package:quizz_app_provider/login/screens/authentication.dart';
import 'package:quizz_app_provider/login/screens/login.dart';
import 'package:quizz_app_provider/models/user.dart';
import 'package:quizz_app_provider/quizzes/screens/quizz_selection.dart';

CustomTransitionPage transitionPage(GoRouterState state, Widget child) {
  return CustomTransitionPage(
    key: state.pageKey,
    child: child,
    transitionDuration: const Duration(milliseconds: 500),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      // Change the opacity of the screen using a Curve based on the the animation's
      // value
      return FadeTransition(
        opacity: CurveTween(curve: Curves.easeInOutCirc).animate(animation),
        child: child,
      );
    },
  );
}

GoRouter router() {
  return GoRouter(
    initialLocation: '/authentication',
    routes: [
      GoRoute(
        path: '/authentication',
        builder: (context, state) => const AuthenticationPage(),
      ),
      GoRoute(
        path: '/login',
        builder: (context, state) => const LoginPage(),
        routes: <RouteBase>[
          GoRoute(
            path: 'account_creation',
            pageBuilder: (context, state) {
              return transitionPage(state, const AccountCreationPage());
              // return CustomTransitionPage(
              //   key: state.pageKey,
              //   child: const AccountCreationPage(),
              //   transitionDuration: const Duration(milliseconds: 500),
              //   transitionsBuilder:
              //       (context, animation, secondaryAnimation, child) {
              //     // Change the opacity of the screen using a Curve based on the the animation's
              //     // value
              //     return FadeTransition(
              //       opacity: CurveTween(curve: Curves.easeInOutCirc)
              //           .animate(animation),
              //       child: child,
              //     );
              //   },
              // );
            },
          ),
        ],
      ),
      GoRoute(
          path: '/home',
          builder: (context, state) => const HomePage(),
          routes: [
            GoRoute(
              path: 'quizz_selection',
              pageBuilder: (context, state) {
                return transitionPage(state, const QuizzSelectionPage());
              },
            ),
          ]),
    ],
  );
}

User user = const User(pseudo: '');

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        theme: appTheme,
        routerConfig: router(),
      ),
    );
  }
}
