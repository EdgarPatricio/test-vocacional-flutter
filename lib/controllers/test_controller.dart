import 'package:get/get.dart';
import 'package:test_orientacion_vocacional/models/question_model.dart';
import 'package:test_orientacion_vocacional/services/api_service.dart';
import 'package:test_orientacion_vocacional/views/result_screen.dart';
import 'package:test_orientacion_vocacional/routes/app_routes.dart';

class TestController extends GetxController {
  // Se inyecta el servicio de API
  final ApiService _api = Get.find<ApiService>();

  // Variables de estado observables con .obs
  final questions = <Question>[].obs;
  final answers = <int, bool>{}.obs;
  final isLoading = true.obs;
  final currentIndex = 0.obs;

  double get progress =>
      questions.isEmpty ? 0.0 : (currentIndex.value + 1) / questions.length;

  @override
  void onInit() {
    super.onInit();
    loadQuestions();
  }

  // Carga las preguntas de forma asíncrona desde el servicio
  Future<void> loadQuestions() async {
    try {
      isLoading.value = true;
      questions.value = await _api.getQuestions();
    } catch (e) {
      // Manejo de errores con Get.snackbar
      Get.snackbar('Error', 'No se pudieron cargar las preguntas.');
    } finally {
      isLoading.value = false;
    }
  }

  void answer(int questionId, bool response) {
    answers[questionId] = response;
    if (currentIndex.value < questions.length - 1) {
      currentIndex.value++;
    } else {
      submitTest();
    }
  }

  Future<void> submitTest() async {
    try {
      isLoading.value = true;
      final result = await _api.submitAnswers(answers);
      Get.off(
        () => ResultScreen(result: result),
      ); // Usamos Get.off para que no pueda volver atrás
    } catch (e) {
      Get.snackbar('Error', 'No se pudo enviar el test.');
    } finally {
      isLoading.value = false;
    }
  }

  void resetTest() {
    currentIndex.value = 0;
    answers.clear();
    // Vuelve a la pantalla de inicio
    Get.offAllNamed(AppRoutes.home);
    // Vuelve a registrar el controlador para que esté disponible la próxima vez
    Get.lazyPut(() => TestController());
  }
}
