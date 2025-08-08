import 'package:flutter/material.dart';
import '../models/question.dart';
import '../services/question_service.dart';
import '../widgets/question_card.dart';
import '../utils/constants.dart';
import 'flashcard_screen.dart';

class CategoryScreen extends StatefulWidget {
  final String categoryName;

  const CategoryScreen({super.key, required this.categoryName});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  final QuestionService _questionService = QuestionService();
  List<Question> questions = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    loadQuestions();
  }

  Future<void> loadQuestions() async {
    try {
      final categoryQuestions = await _questionService
          .getQuestionsByCategory(widget.categoryName);
      setState(() {
        questions = categoryQuestions;
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error loading questions: $e')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Text('${widget.categoryName} Questions'),
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
        actions: [
          if (questions.isNotEmpty)
            IconButton(
              icon: const Icon(Icons.slideshow),
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => FlashcardScreen(questions: questions),
                ),
              ),
            ),
        ],
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : questions.isEmpty
              ? const Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.quiz,
                        size: 64,
                        color: Colors.grey,
                      ),
                      SizedBox(height: 16),
                      Text(
                        'No questions available',
                        style: TextStyle(fontSize: 18, color: Colors.grey),
                      ),
                    ],
                  ),
                )
              : ListView.builder(
                  padding: const EdgeInsets.all(16),
                  itemCount: questions.length,
                  itemBuilder: (context, index) {
                    return QuestionCard(
                      question: questions[index],
                      onFavoriteToggle: () async {
                        await _questionService
                            .toggleFavorite(questions[index].id);
                        loadQuestions();
                      },
                    );
                  },
                ),
    );
  }
}
