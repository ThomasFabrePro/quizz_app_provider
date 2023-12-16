import 'package:flutter/material.dart';
import 'package:quizz_app_provider/common/theme.dart';
import 'package:quizz_app_provider/login/widgets/custom_shaped_container.dart';

class BasePage extends StatelessWidget {
  final String appBarText;
  final Widget child;

  const BasePage({super.key, required this.appBarText, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        title: Text(appBarText,
            style: const TextStyle(color: ThemeConfig.primaryColor)),
        backgroundColor: Colors.transparent,
      ),
      body: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: ThemeConfig.maxWidth),
          child: Stack(
            children: [
              Positioned(
                top: 0,
                child: CustomPaint(
                  painter: CustomShapedContainer(),
                  size: const Size(
                      ThemeConfig.maxWidth, ThemeConfig.maxWidth * 2),
                ),
              ),
              child,
            ],
          ),
        ),
      ),
    );
  }
}
