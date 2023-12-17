import 'package:quizz_app_provider/common/theme.dart';
import 'package:quizz_app_provider/widgets/default_background.dart';
import 'package:flutter/material.dart';

class BasePage extends StatelessWidget {
  final String appBarText;
  final List<Widget>? appBarActions;
  final Widget child;
  const BasePage({
    super.key,
    required this.appBarText,
    this.appBarActions,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        title: Text(appBarText,
            style: const TextStyle(
                color: ThemeConfig.primaryColor,
                fontSize: ThemeConfig.appBarFontSize)),
        backgroundColor: Colors.transparent,
        actions: appBarActions,
      ),
      body: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: ThemeConfig.maxWidth),
          child: Stack(
            children: [
              Positioned(
                top: 0,
                child: RepaintBoundary(
                  child: CustomPaint(
                    painter: DefaultBackground(),
                    size: const Size(
                        ThemeConfig.maxWidth, ThemeConfig.maxWidth * 2),
                  ),
                ),
              ),
              SizedBox(
                width: double.infinity,
                height: double.infinity,
                child: child,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
