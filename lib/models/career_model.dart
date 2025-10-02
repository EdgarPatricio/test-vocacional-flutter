class Career {
  final String name;
  final String description;

  Career({required this.name, required this.description});

  factory Career.fromJson(Map<String, dynamic> json) {
    return Career(name: json['name'], description: json['description']);
  }
}
