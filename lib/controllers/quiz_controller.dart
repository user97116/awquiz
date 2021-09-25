import 'dart:convert';

import 'package:awquiz/models/quiz_category.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class QuizController extends GetxController {
  int points = 10;
  int questionAmount = 10;
  RxInt score = 0.obs;
  RxList categories = [
    QuizCategory("Science: Computers", 18, "Easy"),
    QuizCategory("Entertainment: Video Games", 15, "Hard"),
    QuizCategory("Science & Nature", 17, "Medium"),
    QuizCategory("Celebrities", 26, "Easy"),
    QuizCategory("Entertainment: Books", 10, "Easy"),
    QuizCategory("History", 23, "Medium"),
  ].obs;
  RxList questions = [].obs;
  RxBool loadingQuestions = true.obs;

  loadQuestions(QuizCategory category) async {
    questions.clear();
    score(0);
    loadingQuestions(true);
    http.Response res = await http.get(
      Uri.parse(
        "https://opentdb.com/api.php?amount=$questionAmount&category=${category.id}&difficulty=${category.difficulity!.toLowerCase()}&type=multiple",
      ),
    );
    var json = jsonDecode(res.body);
    if (json["results"] != null) {
      json["results"].forEach((e) => questions.add(e));
    }
    loadingQuestions(false);
  }

  clearQuestions() => questions.clear();
}
