import 'package:flutter/material.dart';
import 'package:quizz_app_provider/common/theme.dart';
import 'package:quizz_app_provider/models/stat.dart';
import 'package:quizz_app_provider/models/persons/user.dart';
import 'package:quizz_app_provider/widgets/stats/stat_bar.dart';

class StatsDivision extends StatelessWidget {
  const StatsDivision({super.key});

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: user.stats.isNotEmpty,
      child: Container(
        // height: 200,
        margin: const EdgeInsets.all(8),
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: ThemeConfig.tertiaryColor,
          border: Border.all(
            color: Colors.white30,
            width: 1,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Statistiques',
                style: TextStyle(
                  color: ThemeConfig.primaryColor,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              SizedBox(
                height: (user.stats.length * 80).toDouble(),
                child: ListView.builder(
                  itemCount: user.stats.length,
                  itemBuilder: (BuildContext context, int index) {
                    Stat item = user.stats[index];
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            FittedBox(
                              child: Text(
                                  "${item.quizzCategory} : ${item.prctRightAnswers}%"),
                            ),
                            StatBar(stat: item),
                          ]),
                    );
                    // return
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
