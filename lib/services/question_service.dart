import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/question.dart';
import '../data/local_questions.dart';

class QuestionService {
  static const String _questionsKey = 'all_questions';

  Future<List<Question>> getAllQuestions() async {
    final prefs = await SharedPreferences.getInstance();
    final questionsJson = prefs.getStringList(_questionsKey);
    
    if (questionsJson == null) {
      final questions = LocalQuestions.getQuestions();
      await _saveQuestions(questions);
      return questions;
    }
    
    return questionsJson
        .map((json) => Question.fromJson(jsonDecode(json)))
        .toList();
  }

  Future<List<Question>> getQuestionsByCategory(String category) async {
    final allQuestions = await getAllQuestions();
    return allQuestions.where((q) => q.category == category).toList();
  }

  Future<List<Question>> getFavoriteQuestions() async {
    final allQuestions = await getAllQuestions();
    return allQuestions.where((q) => q.isFavorite).toList();
  }

  Future<void> toggleFavorite(String questionId) async {
    final questions = await getAllQuestions();
    final questionIndex = questions.indexWhere((q) => q.id == questionId);
    
    if (questionIndex != -1) {
      questions[questionIndex] = questions[questionIndex].copyWith(
        isFavorite: !questions[questionIndex].isFavorite,
      );
      await _saveQuestions(questions);
    }
  }

  Future<void> addQuestion(Question question) async {
    final questions = await getAllQuestions();
    questions.add(question);
    await _saveQuestions(questions);
  }

  Future<void> _saveQuestions(List<Question> questions) async {
    final prefs = await SharedPreferences.getInstance();
    final questionsJson = questions
        .map((q) => jsonEncode(q.toJson()))
        .toList();
    await prefs.setStringList(_questionsKey, questionsJson);
  }

  Future<int> getQuestionCountByCategory(String category) async {
    final questions = await getQuestionsByCategory(category);
    return questions.length;
  }
}
