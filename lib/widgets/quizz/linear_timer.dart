import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quizz_app_provider/common/theme.dart';
import 'package:quizz_app_provider/models/quizz/quizz_model.dart';

class LinearTimer extends StatefulWidget {
  // final int durationMiliseconds;
  final Function onTimerFinish;

  const LinearTimer(
      {super.key,
      // required this.durationMiliseconds,
      required this.onTimerFinish});

  @override
  _LinearTimerState createState() => _LinearTimerState();
}

class _LinearTimerState extends State<LinearTimer> {
  late int secondsRemaining;
  late double _barWidth;
  int durationSeconds = 1;

  @override
  void initState() {
    super.initState();
    secondsRemaining = 30;
    _barWidth = 1.0;
    startTimer();
  }

  void startTimer() {
    Timer.periodic(Duration(seconds: durationSeconds), (timer) {
      setState(() {
        if (secondsRemaining > 0) {
          secondsRemaining -= durationSeconds;
          _barWidth = secondsRemaining <= 0 ? 0 : secondsRemaining / 30;
        } else {
          widget.onTimerFinish();
          timer.cancel();
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Quizz>(builder: (context, quizz, child) {
      if (quizz.question.isAnswered) {
        secondsRemaining = 30;
        _barWidth = 1.0;
      }
      return Visibility(
        visible: !quizz.question.isAnswered,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Stack(
            children: [
              Container(
                height: 30.0,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  color: ThemeConfig.secondaryColor,
                ),
                child: FractionallySizedBox(
                  alignment: Alignment.centerLeft,
                  widthFactor: _barWidth,
                  child: Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.0),
                        color: ThemeConfig.primaryColor,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        child: Text(
                          secondsRemaining <= 0
                              ? "Terminé"
                              : ("${(secondsRemaining).toStringAsFixed(0)}s restant"),
                          style: TextStyle(
                            color: secondsRemaining <= 0
                                ? Colors.white
                                : Colors.black,
                            fontSize: 14,
                          ),
                        ),
                      ),
                      const Icon(
                        Icons.timer_sharp,
                        color: Colors.white,
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      );
    });
  }
}
