import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_orientacion_vocacional/controllers/lang_controller.dart';
import 'package:test_orientacion_vocacional/controllers/test_controller.dart';
import 'package:test_orientacion_vocacional/services/api_service.dart';
import 'package:test_orientacion_vocacional/utils/app_translation.dart';
import 'package:test_orientacion_vocacional/utils/app_colors.dart';
import 'package:test_orientacion_vocacional/routes/app_routes.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  // Inicializa tus servicios y controladores con GetX
  Get.put(ApiService());
  Get.put(LangController());
  Get.lazyPut(() => TestController()); // Se crea solo cuando se necesita
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    final lang = Get.find<LangController>();
    return Obx(
      () => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Test Vocacional',
        translations: AppTranslation(),
        locale: lang.locale.value,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primary),
          fontFamily: "Montserrat",
          useMaterial3: true,
          primarySwatch: Colors.indigo,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          appBarTheme: AppBarTheme(
            backgroundColor: AppColors.primary, // Color para las AppBars
            foregroundColor: AppColors.textLight,
          ),
        ),
        darkTheme: ThemeData.dark(useMaterial3: true).copyWith(
          colorScheme: ColorScheme.fromSeed(
            seedColor: AppColors.primary,
            brightness: Brightness.dark,
          ),
        ),
        themeMode: ThemeMode.system,
        initialRoute: AppRoutes.home,
        getPages: AppRoutes.routes,
      ),
    );
  }
}
