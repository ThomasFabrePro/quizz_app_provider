import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:quizz_app_provider/common/theme.dart';
import 'package:quizz_app_provider/web_service/repositories/user_repository.dart';
import 'package:quizz_app_provider/screens/base/base_login_page.dart';

class AuthenticationPage extends StatefulWidget {
  const AuthenticationPage({
    super.key,
  });

  @override
  State<AuthenticationPage> createState() => _AuthenticationPageState();
}

class _AuthenticationPageState extends State<AuthenticationPage> {
  @override
  void initState() {
    UserRepository().authUser().then((value) {
      print('authUser value: $value');
      if (value) {
        context.go('/home');
      } else {
        context.go('/login');
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const BaseLoginPage(
        appBarText: '', child: AuthenticationPageContent());
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
