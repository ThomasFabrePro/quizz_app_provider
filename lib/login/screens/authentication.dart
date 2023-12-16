import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:quizz_app_provider/common/theme.dart';
import 'package:quizz_app_provider/login/authentication_status.dart';
import 'package:quizz_app_provider/login/screens/base_page.dart';
import 'package:quizz_app_provider/web_service/web_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthenticationPage extends StatefulWidget {
  const AuthenticationPage({
    super.key,
  });

  @override
  State<AuthenticationPage> createState() => _AuthenticationPageState();
}

class _AuthenticationPageState extends State<AuthenticationPage>
    with ConnectUser {
  late SharedPreferences sharedPreferences;

  @override
  void initState() {
    SharedPreferences.getInstance().then((value) {
      String email = value.getString('email') ?? '';
      String password = value.getString('password') ?? '';
      if (email.isEmpty || password.isEmpty) {
        context.go('/login');
        return;
      }
      connectUser(email, password).then((value) {
        switch (value) {
          case AuthenticationStatus.authenticated:
            context.go('/home');
            break;
          default:
            context.go('/login');
            break;
        }
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const BasePage(appBarText: '', child: AuthenticationPageContent());
  }
}

class AuthenticationPageContent extends StatelessWidget {
  const AuthenticationPageContent({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: Image(
                  image: AssetImage('assets/logo_small.png'),
                  height: 200,
                ),
              ),
              CircularProgressIndicator(
                color: ThemeConfig.primaryColor,
              )
            ],
          )),
    );
  }
}
