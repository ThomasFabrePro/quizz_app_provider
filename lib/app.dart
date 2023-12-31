import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:quizz_app_provider/common/theme.dart';
import 'package:quizz_app_provider/models/quizzes/quizz_model.dart';
import 'package:quizz_app_provider/screens/contacts/contacts_page.dart';
import 'package:quizz_app_provider/screens/contacts/pending_contact_invitations_page.dart';
import 'package:quizz_app_provider/screens/home_page.dart';
import 'package:quizz_app_provider/screens/quizz/opponent_selection_page.dart';
import 'package:quizz_app_provider/screens/screens.dart';

CustomTransitionPage transitionPage(GoRouterState state, Widget child) {
  return CustomTransitionPage(
    key: state.pageKey,
    child: child,
    maintainState: false,
    transitionDuration: const Duration(milliseconds: 500),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
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
            },
          ),
        ],
      ),
      GoRoute(
          path: '/home',
          builder: (context, state) => const HomePage(),
          routes: [
            GoRoute(
              path: 'solo_mode_quizz_selection',
              pageBuilder: (context, state) {
                return transitionPage(state, const QuizzSelectionPage());
              },
            ),
            GoRoute(
              path: 'opponent_selection',
              pageBuilder: (context, state) {
                return transitionPage(state, const OpponentSelectionPage());
              },
            ),
            GoRoute(
                path: 'contacts',
                pageBuilder: (context, state) {
                  return transitionPage(state, const ContactsPage());
                },
                routes: [
                  GoRoute(
                    path: 'pending_contact_invitations',
                    pageBuilder: (context, state) {
                      return transitionPage(
                          state, const PendingContactInvitationsPage());
                    },
                  ),
                ]),
          ]),
      GoRoute(
        path: '/quizz_game',
        pageBuilder: (context, state) {
          Quizz quizz = state.extra as Quizz;
          return transitionPage(state, QuizzGamePage(quizz: quizz));
        },
      ),
      GoRoute(
        path: '/result',
        pageBuilder: (context, state) {
          Quizz quizz = state.extra as Quizz;
          return transitionPage(state, QuizzResultPage(quizz: quizz));
        },
      ),
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
