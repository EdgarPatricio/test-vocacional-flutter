import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_orientacion_vocacional/controllers/lang_controller.dart';
import 'package:test_orientacion_vocacional/controllers/test_controller.dart';
import 'package:test_orientacion_vocacional/utils/app_colors.dart';

class TestScreen extends StatelessWidget {
  // Se obtiene la instancia del controlador
  final TestController controller = Get.find<TestController>();

  @override
  Widget build(BuildContext context) {
    final lang = Get.find<LangController>();

    return Scaffold(
      appBar: AppBar(
        title: Text('app_title'.tr),
        actions: [
          IconButton(
            icon: Icon(
              Get.isDarkMode ? Icons.light_mode : Icons.dark_mode,
              color: AppColors.textLight,
            ),
            onPressed: () {
              Get.changeThemeMode(
                Get.isDarkMode ? ThemeMode.light : ThemeMode.dark,
              );
            },
          ),
          IconButton(icon: Icon(Icons.translate), onPressed: lang.showLanguage),
        ],
      ),
      // Obx reconstruye el widget automáticamente cuando cambia una variable .obs
      body: Obx(() {
        // Se muestra un indicador de carga basado en el estado del controlador
        if (controller.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        }
        if (controller.questions.isEmpty) {
          return Center(child: Text('No se encontraron preguntas.'));
        }

        final question = controller.questions[controller.currentIndex.value];

        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              LinearProgressIndicator(
                value: controller.progress,
                color: AppColors.primary,
                backgroundColor: AppColors.primary.withOpacity(0.3),
              ),
              SizedBox(height: 20),
              Text(
                'Pregunta ${controller.currentIndex.value + 1} de ${controller.questions.length}',
                style: Theme.of(context).textTheme.titleSmall,
              ),
              Expanded(
                child: Center(
                  child: Card(
                    elevation: 4,
                    child: Padding(
                      padding: const EdgeInsets.all(24.0),
                      child: Text(
                        question.text,
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () => controller.answer(question.id, true),
                    child: Text('yes'.tr),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.success,
                      foregroundColor: AppColors.textLight,
                      textStyle: TextStyle(fontWeight: FontWeight.bold),
                      padding: EdgeInsets.symmetric(
                        horizontal: 50,
                        vertical: 20,
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () => controller.answer(question.id, false),
                    child: Text('no'.tr),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.error,
                      foregroundColor: AppColors.textLight,
                      textStyle: TextStyle(fontWeight: FontWeight.bold),
                      padding: EdgeInsets.symmetric(
                        horizontal: 50,
                        vertical: 20,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
            ],
          ),
        );
      }),
    );
  }
}
