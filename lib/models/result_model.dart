import 'package:test_orientacion_vocacional/models/career_model.dart';

class TestResult {
  final List<Map<String, dynamic>> interests;
  final List<Map<String, dynamic>> aptitudes;
  final List<Career> careers;

  TestResult({
    required this.interests,
    required this.aptitudes,
    required this.careers,
  });

  factory TestResult.fromJson(Map<String, dynamic> json) {
    return TestResult(
      interests: List<Map<String, dynamic>>.from(json['interests']),
      aptitudes: List<Map<String, dynamic>>.from(json['aptitudes']),
      careers: (json['careers'] as List)
          .map((careerJson) => Career.fromJson(careerJson))
          .toList(),
    );
  }
}
