import 'package:get/get.dart';

class AppTranslation extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
    'es_EC': {
      'app_title': 'Test Vocacional',
      'welcome_title': 'Orientación Vocacional',
      'welcome_subtitle': 'Test de orientación vocacional - CHASIDE',
      'start_button': 'Acceder al test',
      'yes': 'Sí',
      'no': 'No',
      'results_title': '¡Has completado el test!',
      'your_interests': 'Tus Intereses',
      'your_aptitudes': 'Tus Aptitudes',
      'related_careers': 'Carreras Afines',
      'restart_button': 'Reiniciar Test',
    },
    'en_US': {
      'app_title': 'Vocational Test',
      'welcome_title': 'Vocational Guidance',
      'welcome_subtitle': 'CHASIDE Vocational Guidance Test',
      'start_button': 'Take the test',
      'yes': 'Yes',
      'no': 'No',
      'results_title': 'You have completed the test!',
      'your_interests': 'Your Interests',
      'your_aptitudes': 'Your Aptitudes',
      'related_careers': 'Related Careers',
      'restart_button': 'Restart Test',
    },
  };
}
