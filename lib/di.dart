import 'package:awquiz/controllers/quiz_controller.dart';
import 'package:get/instance_manager.dart';

void configure() {
  Get.put<QuizController>(QuizController());
}
