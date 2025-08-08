class Question {
  final String id;
  final String question;
  final String answer;
  final String category;
  final String difficulty;
  bool isFavorite;

  Question({
    required this.id,
    required this.question,
    required this.answer,
    required this.category,
    required this.difficulty,
    this.isFavorite = false,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'question': question,
      'answer': answer,
      'category': category,
      'difficulty': difficulty,
      'isFavorite': isFavorite,
    };
  }

  factory Question.fromJson(Map<String, dynamic> json) {
    return Question(
      id: json['id'] ?? '',
      question: json['question'] ?? '',
      answer: json['answer'] ?? '',
      category: json['category'] ?? '',
      difficulty: json['difficulty'] ?? 'Easy',
      isFavorite: json['isFavorite'] ?? false,
    );
  }

  Question copyWith({
    String? id,
    String? question,
    String? answer,
    String? category,
    String? difficulty,
    bool? isFavorite,
  }) {
    return Question(
      id: id ?? this.id,
      question: question ?? this.question,
      answer: answer ?? this.answer,
      category: category ?? this.category,
      difficulty: difficulty ?? this.difficulty,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }
}
