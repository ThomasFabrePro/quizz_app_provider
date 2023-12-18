import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:quizz_app_provider/common/theme.dart';
import 'package:quizz_app_provider/screens/home_page.dart';
import 'package:quizz_app_provider/screens/quizz/quizz_selection.dart';
import 'package:quizz_app_provider/screens/login/account_creation.dart';
import 'package:quizz_app_provider/screens/login/authentication.dart';
import 'package:quizz_app_provider/screens/login/login.dart';

CustomTransitionPage transitionPage(GoRouterState state, Widget child) {
  return CustomTransitionPage(
    key: state.pageKey,
    child: child,
    maintainState: false,
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
    // initialLocation: '/home',
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
              routes: [
                // GoRoute(
                //   path: 'quizz_game',
                //   pageBuilder: (context, state) {
                //     return transitionPage(state, const QuizzSelectionPage());
                //   },
                // ),
              ],
            ),
          ]),
    ],
  );
}

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
