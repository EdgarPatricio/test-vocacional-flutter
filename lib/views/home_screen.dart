import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_orientacion_vocacional/controllers/lang_controller.dart';
import 'package:test_orientacion_vocacional/utils/app_colors.dart';
import 'package:test_orientacion_vocacional/routes/app_routes.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final lang = Get.find<LangController>();

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        // Barra de app transparente para que se vea la imagen
        backgroundColor: Colors.transparent,
        elevation: 0,
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
          IconButton(
            icon: Icon(Icons.translate, color: AppColors.textLight),
            onPressed: lang.showLanguage,
          ),
        ],
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            // LA IMAGEN DE FONDO
            image: AssetImage("assets/images/background.jpg"),
            fit: BoxFit.cover,
            // LA CAPA OSCURA SEMITRANSPARENTE
            colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(0.5),
              BlendMode.darken,
            ),
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/images/unl_logo.png', height: 60),
                SizedBox(height: 40),
                Text(
                  'welcome_title'.tr,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: AppColors.textLight,
                    fontSize: 42,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'welcome_subtitle'.tr,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: AppColors.textLight.withOpacity(0.9),
                    fontSize: 18,
                  ),
                ),
                SizedBox(height: 50),
                OutlinedButton(
                  onPressed: () => Get.toNamed(AppRoutes.test),
                  style: OutlinedButton.styleFrom(
                    foregroundColor: AppColors.textLight,
                    side: BorderSide(color: Colors.white, width: 2),
                    padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Text(
                    'start_button'.tr,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
