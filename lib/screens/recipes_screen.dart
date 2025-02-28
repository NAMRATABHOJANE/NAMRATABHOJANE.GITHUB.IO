import 'package:flutter/material.dart';
import '../data/ingredients_data.dart';
import '../data/recipe_data.dart';
import 'package:logging/logging.dart';

class RecipesScreen extends StatelessWidget {
  final Set<int> selectedIngredients;

  const RecipesScreen({required this.selectedIngredients, super.key});

  // Logger for debugging
  static final _logger = Logger('RecipesScreen');

  // Filtering logic for partial matches
  List<Map<String, dynamic>> getFilteredRecipes() {
    _logger.info('Selected Ingredients: $selectedIngredients');

    final matchedRecipes = recipes.where((recipe) {
      return recipe['ingredients']
          .any((ingredient) => selectedIngredients.contains(ingredient));
    }).toList();

    // Sort recipes by number of matching ingredients
    matchedRecipes.sort((a, b) {
      final aMatches = a['ingredients']
          .where((ingredient) => selectedIngredients.contains(ingredient))
          .length;
      final bMatches = b['ingredients']
          .where((ingredient) => selectedIngredients.contains(ingredient))
          .length;
      return bMatches.compareTo(aMatches);
    });

    _logger.info('Filtered Recipes: ${matchedRecipes.map((recipe) => recipe['title']).toList()}');
    return matchedRecipes;
  }

  @override
  Widget build(BuildContext context) {
    final filteredRecipes = getFilteredRecipes();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Recipes'),
      ),
      body: filteredRecipes.isEmpty
          ? const Center(
              child: Text(
                'No recipes match your selected ingredients. Try selecting more ingredients!',
                style: TextStyle(fontSize: 18),
                textAlign: TextAlign.center,
              ),
            )
          : ListView.builder(
              itemCount: filteredRecipes.length,
              itemBuilder: (context, index) {
                final recipe = filteredRecipes[index];
                return Card(
                  elevation: 3,
                  margin: const EdgeInsets.all(8.0),
                  child: ListTile(
                    title: Text(recipe['title']),
                    subtitle: Text(
                      'Ingredients: ${recipe['ingredients'].map((id) => categorizedIngredients.values.expand((list) => list).firstWhere((ingredient) => ingredient['id'] == id)['name']).join(', ')}',
                    ),
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: Text(recipe['title']),
                          content: Text(recipe['instructions']),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.pop(context),
                              child: const Text('Close'),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                );
              },
            ),
    );
  }
}
