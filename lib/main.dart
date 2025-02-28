import 'package:flutter/material.dart';
import 'screens/gourmet_guide_screen.dart';
import 'screens/recipes_screen.dart';

void main() => runApp(const GourmetGuideApp());

class GourmetGuideApp extends StatelessWidget {
  const GourmetGuideApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gourmet Guide',
      theme: ThemeData(
        primarySwatch: Colors.green,
        scaffoldBackgroundColor: const Color(0xFFf0f7f4),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const GourmetGuideScreen(), // Home screen
        '/recipes': (context) {
          final selectedIngredients =
              ModalRoute.of(context)!.settings.arguments as Set<int>;
          return RecipesScreen(selectedIngredients: selectedIngredients);
        }, // Recipes screen
      },
      debugShowCheckedModeBanner: false,
    );
  }
}


