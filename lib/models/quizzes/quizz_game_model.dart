import 'package:quizz_app_provider/models/quizzes/quizz_model.dart';
import 'package:quizz_app_provider/web_service/repositories/quizzes/quizz_service.dart';

class QuizzGame {
  QuizzGame._internal();
  static final QuizzGame _instance = QuizzGame._internal();
  static QuizzGame get instance => _instance;

  late QuizzRepository quizzRepository;
  late String opponentId = "";
  late Quizz quizz;
  late List<Quizz> quizzCategoriesList;

  void init(QuizzRepository quizzRepo) {
    opponentId = "";
    quizzRepository = quizzRepo;
    quizz = Quizz(name: "", url: "", quizzRepository: quizzRepo);
    quizzCategoriesList = <Quizz>[];
  }

  Future<void> fetchQuizzCategories() async {
    quizzCategoriesList = await quizzRepository.getQuizzCategories();
  }
}

// class SoloQuizz extends ChangeNotifier implements Quizz {
//   @override
//   final String name;
//   @override
//   final String url;
//   @override
//   List<bool?> answersTracker;
//   @override
//   int correctAnswers;
//   @override
//   int currentQuestionIndex;
//   @override
//   bool isFinished;
//   @override
//   bool isLoading;
//   @override
//   List<QuizzQuestion> quizzQuestions;
//   @override
//   int wrongAnswers;
//   // @override
//   QuizzRepository quizzRepository = const SoloQuizzRepository();

//   SoloQuizz({
//     required this.name,
//     required this.url,
//     this.quizzQuestions = const <QuizzQuestion>[],
//     this.answersTracker = const [],
//     this.correctAnswers = 0,
//     this.wrongAnswers = 0,
//     this.currentQuestionIndex = 0,
//     this.isFinished = false,
//     this.isLoading = false,
//   });
//   @override
//   List<String> get options => quizzQuestions[currentQuestionIndex].options;
//   @override
//   bool get actualQuestionIsAnswered =>
//       quizzQuestions[currentQuestionIndex].isAnswered;
//   @override
//   String get actualQuestionText =>
//       quizzQuestions[currentQuestionIndex].question;
//   @override
//   QuizzQuestion get actualQuestion => quizzQuestions[currentQuestionIndex];
//   @override
//   String get score => "$correctAnswers / ${quizzQuestions.length}";

//   @override
//   void answerQuestion(int index) {
//     if (!actualQuestion.isAnswered) {
//       actualQuestion.selectedOptionIndex = index;
//       if (actualQuestion.correctOptionIndex == index) {
//         answersTracker[currentQuestionIndex] = true;
//         correctAnswers++;
//       } else {
//         answersTracker[currentQuestionIndex] = false;
//         wrongAnswers++;
//       }
//       actualQuestion.isAnswered = true;

//       notifyListeners();
//     }
//   }

//   @override
//   Future<void> fetchQuizzQuestions() async {
//     isLoading = true;
//     notifyListeners();
//     quizzQuestions = await const QuizzRepository().getQuizzQuestions(url);
//     if (quizzQuestions.isNotEmpty) {
//       answersTracker = List<bool?>.filled(quizzQuestions.length, null);
//       isLoading = false;
//       notifyListeners();
//     }
//   }

//   @override
//   Future<void> nextQuestion() async {
//     if (currentQuestionIndex < quizzQuestions.length - 1) {
//       currentQuestionIndex++;
//     } else {
//       await UserRepository().updateStat(Stat(
//           categoryName: name,
//           rightAnswers: correctAnswers,
//           wrongAnswers: wrongAnswers));
//       isFinished = true;
//     }
//     notifyListeners();
//   }
// }

// class SoloQuizz extends Quizz {
//   SoloQuizz()
//       : super(
//           name: "name",
//           url: "url",
//           quizzRepository: const SoloQuizzRepository(),
//         );
//   @override
//   List<String> get options => quizzQuestions[currentQuestionIndex].options;
//   @override
//   bool get actualQuestionIsAnswered =>
//       quizzQuestions[currentQuestionIndex].isAnswered;
//   @override
//   String get actualQuestionText =>
//       quizzQuestions[currentQuestionIndex].question;
//   @override
//   QuizzQuestion get actualQuestion => quizzQuestions[currentQuestionIndex];
//   @override
//   String get score => "$correctAnswers / ${quizzQuestions.length}";

//   @override
//   void answerQuestion(int index) {}

//   @override
//   Future<void> fetchQuizzQuestions() async {
//     isLoading = true;
//     notifyListeners();
//     quizzQuestions = await quizzRepo.getQuizzQuestions(url);
//     if (quizzQuestions.isNotEmpty) {
//       answersTracker = List<bool?>.filled(quizzQuestions.length, null);
//       isLoading = false;
//       notifyListeners();
//     }
//   }

//   @override
//   Future<void> nextQuestion() {
//     throw UnimplementedError();
//   }
// }
