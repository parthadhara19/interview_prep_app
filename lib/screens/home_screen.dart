import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import '../models/category.dart';
import '../services/question_service.dart';
import '../utils/constants.dart';
import '../widgets/category_tile.dart';
import 'category_screen.dart';
import 'favorites_screen.dart';
import 'admin_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final QuestionService _questionService = QuestionService();
  List<Category> categories = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    loadCategories();
  }

  Future<void> loadCategories() async {
    try {
      final hrCount = await _questionService.getQuestionCountByCategory('HR');
      final techCount = await _questionService.getQuestionCountByCategory('Technical');
      final aptitudeCount = await _questionService.getQuestionCountByCategory('Aptitude');

      setState(() {
        categories = [
          Category(
            name: 'HR Questions',
            icon: Icons.people,
            color: Colors.blue,
            questionCount: hrCount,
          ),
          Category(
            name: 'Technical Questions',
            icon: Icons.code,
            color: Colors.green,
            questionCount: techCount,
          ),
          Category(
            name: 'Aptitude Questions',
            icon: Icons.calculate,
            color: Colors.orange,
            questionCount: aptitudeCount,
          ),
        ];
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text(
          AppConstants.appName,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: AppColors.primary,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.favorite, color: Colors.white),
            onPressed: () async {
              await Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const FavoritesScreen()),
              );
              loadCategories(); // Refresh when returning
            },
          ),
          IconButton(
            icon: const Icon(Icons.admin_panel_settings, color: Colors.white),
            onPressed: () async {
              await Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const AdminScreen()),
              );
              loadCategories(); // Refresh when returning
            },
          ),
        ],
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Choose a Category',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: AppColors.textPrimary,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Select from HR, Technical, or Aptitude questions',
                    style: TextStyle(
                      fontSize: 16,
                      color: AppColors.textSecondary,
                    ),
                  ),
                  const SizedBox(height: 24),
                  Expanded(
                    child: AnimationLimiter(
                      child: ListView.builder(
                        itemCount: categories.length,
                        itemBuilder: (context, index) {
                          return AnimationConfiguration.staggeredList(
                            position: index,
                            duration: const Duration(milliseconds: 375),
                            child: SlideAnimation(
                              verticalOffset: 50.0,
                              child: FadeInAnimation(
                                child: CategoryTile(
                                  category: categories[index],
                                  onTap: () async {
                                    await Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => CategoryScreen(
                                          categoryName: categories[index].name.split(' ')[0],
                                        ),
                                      ),
                                    );
                                    loadCategories(); // Refresh when returning
                                  },
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
