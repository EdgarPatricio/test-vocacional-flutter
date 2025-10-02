import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:test_orientacion_vocacional/models/question_model.dart';
import 'package:test_orientacion_vocacional/models/result_model.dart';

class ApiService extends GetxService {
  // Se define la URL base para la API de prueba (Mock)
  final String _baseUrl = 'https://test-orientacion.free.beeceptor.com';

  // Obtiene la lista de preguntas del endpoint /questions
  Future<List<Question>> getQuestions() async {
    final response = await http.get(Uri.parse('$_baseUrl/questions'));

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.map((json) => Question.fromJson(json)).toList();
    } else {
      throw Exception('Error al cargar las preguntas');
    }
  }

  // Envía las respuestas y obtiene los resultados del endpoint /results
  Future<TestResult> submitAnswers(Map<int, bool> answers) async {
    final response = await http.post(
      Uri.parse('$_baseUrl/results'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode({
        'answers': answers.map((key, value) => MapEntry(key.toString(), value)),
      }),
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      return TestResult.fromJson(json.decode(response.body));
    } else {
      throw Exception('Error al enviar el test');
    }
  }
}
