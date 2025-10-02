import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_orientacion_vocacional/controllers/lang_controller.dart';
import 'package:test_orientacion_vocacional/controllers/test_controller.dart';
import 'package:test_orientacion_vocacional/models/result_model.dart';
import 'package:test_orientacion_vocacional/utils/app_colors.dart';

class ResultScreen extends StatelessWidget {
  final TestResult result;
  final TestController controller = Get.find<TestController>();

  ResultScreen({required this.result});

  @override
  Widget build(BuildContext context) {
    final lang = Get.find<LangController>();

    return Scaffold(
      appBar: AppBar(
        title: Text('results_title'.tr),
        automaticallyImplyLeading: false,
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
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'results_title'.tr,
              style: Theme.of(context).textTheme.headlineMedium,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 30),
            _buildResultSection(context, 'your_interests'.tr, result.interests),
            SizedBox(height: 20),
            _buildResultSection(context, 'your_aptitudes'.tr, result.aptitudes),
            SizedBox(height: 20),
            _buildCareersSection(context),
            SizedBox(height: 40),
            ElevatedButton(
              onPressed: controller.resetTest,
              child: Text('restart_button'.tr),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildResultSection(
    BuildContext context,
    String title,
    List<Map<String, dynamic>> items,
  ) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: Theme.of(context).textTheme.titleLarge),
            SizedBox(height: 10),
            ...items.map(
              (item) => ListTile(
                title: Text(item['area']),
                trailing: Text(item['score'].toString()),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCareersSection(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'related_careers'.tr,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            SizedBox(height: 10),
            ...result.careers.map(
              (career) => ExpansionTile(
                title: Text(career.name),
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(career.description),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
