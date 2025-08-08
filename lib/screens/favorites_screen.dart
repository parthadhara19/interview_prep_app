import 'package:flutter/material.dart';
import '../models/question.dart';
import '../services/question_service.dart';
import '../widgets/question_card.dart';
import '../utils/constants.dart';
import 'flashcard_screen.dart';

class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({super.key});

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  final QuestionService _questionService = QuestionService();
  List<Question> favoriteQuestions = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    loadFavorites();
  }

  Future<void> loadFavorites() async {
    try {
      final favorites = await _questionService.getFavoriteQuestions();
      setState(() {
        favoriteQuestions = favorites;
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error loading favorites: $e')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text('Favorite Questions'),
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
        actions: [
          if (favoriteQuestions.isNotEmpty)
            IconButton(
              icon: const Icon(Icons.slideshow),
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => FlashcardScreen(questions: favoriteQuestions),
                ),
              ),
            ),
        ],
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : favoriteQuestions.isEmpty
              ? const Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.favorite_border,
                        size: 64,
                        color: Colors.grey,
                      ),
                      SizedBox(height: 16),
                      Text(
                        'No favorite questions yet',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.grey,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'Start favoriting questions to see them here',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                )
              : ListView.builder(
                  padding: const EdgeInsets.all(16),
                  itemCount: favoriteQuestions.length,
                  itemBuilder: (context, index) {
                    return QuestionCard(
                      question: favoriteQuestions[index],
                      onFavoriteToggle: () async {
                        await _questionService
                            .toggleFavorite(favoriteQuestions[index].id);
                        loadFavorites();
                      },
                    );
                  },
                ),
    );
  }
}
