import 'package:quizz_app_provider/common/theme.dart';
import 'package:flutter/material.dart';

class BasePage extends StatelessWidget {
  final String appBarText;
  final List<Widget>? appBarActions;
  final Widget child;
  final Widget? floatingActionButton;
  const BasePage({
    super.key,
    required this.appBarText,
    this.appBarActions,
    this.floatingActionButton,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        title: Text(appBarText,
            style: const TextStyle(
                color: ThemeConfig.primaryColor,
                fontSize: ThemeConfig.appBarFontSize)),
        backgroundColor: Colors.transparent,
        actions: appBarActions,
      ),
      floatingActionButton: floatingActionButton,
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              ThemeConfig.tertiaryColor,
              ThemeConfig.secondaryColor,
            ],
          ),
        ),
        child: Center(
          child: Container(
              constraints: const BoxConstraints(maxWidth: ThemeConfig.maxWidth),
              child: child),
        ),
      ),
    );
  }
}
