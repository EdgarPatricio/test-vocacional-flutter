import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:test_orientacion_vocacional/controllers/lang_controller.dart';
import 'package:test_orientacion_vocacional/controllers/test_controller.dart';
import 'package:test_orientacion_vocacional/models/question_model.dart';
import 'package:test_orientacion_vocacional/models/result_model.dart';
import 'package:test_orientacion_vocacional/services/api_service.dart';
import 'package:test_orientacion_vocacional/views/home_screen.dart';

// --- PASO CLAVE: SIMULACIÓN DEL SERVICIO API ---
// Creamos una clase "falsa" que simula ser nuestro ApiService.
// Esto nos permite hacer pruebas sin depender de una conexión a internet.
class FakeApiService extends GetxService implements ApiService {
  @override
  Future<List<Question>> getQuestions() async {
    // Devuelve una lista vacía o con datos de prueba.
    return Future.value([]);
  }

  @override
  Future<TestResult> submitAnswers(Map<int, bool> answers) async {
    // No es necesario para este test, pero lo implementamos.
    return Future.value(TestResult(interests: [], aptitudes: [], careers: []));
  }
}

void main() {
  // --- CONFIGURACIÓN ANTES DE CADA TEST ---
  // Esta función se asegura de que los controladores necesarios estén
  // disponibles antes de que se renderice la pantalla.
  setUp(() {
    // Eliminamos cualquier controlador que haya quedado de un test anterior.
    Get.reset();
    // Inyectamos nuestro servicio falso y los controladores reales.
    Get.put<ApiService>(FakeApiService());
    Get.put(LangController());
    Get.lazyPut(() => TestController(), fenix: true);
  });

  // --- DEFINICIÓN DEL TEST ---
  testWidgets(
    'HomeScreen UI Test: Verifica que los elementos principales se muestren',
    (WidgetTester tester) async {
      // Paso 1: Renderizar la pantalla que queremos probar.
      // La envolvemos en GetMaterialApp para que tenga el contexto necesario (traducciones, temas, etc.).
      await tester.pumpWidget(GetMaterialApp(home: HomeScreen()));

      // Paso 2: Realizar las verificaciones (Assertions).
      // Usamos `expect` para comprobar si nuestras expectativas se cumplen.

      // Verifica que el logo de la UNL (que es un widget de tipo Image) esté presente.
      print('Verificando la presencia del logo...');
      expect(find.byType(Image), findsOneWidget);

      // Verifica que el título principal de bienvenida sea visible.
      // Usamos 'welcome_title' que es la clave de traducción. GetX la resolverá.
      print('Verificando el título de bienvenida...');
      expect(find.text('welcome_title'.tr), findsOneWidget);

      // Verifica que el botón para iniciar el test exista.
      print('Verificando el botón de inicio...');
      expect(find.byType(OutlinedButton), findsOneWidget);
      expect(find.text('start_button'.tr), findsOneWidget);

      print('¡Test completado exitosamente!');
    },
  );
}
