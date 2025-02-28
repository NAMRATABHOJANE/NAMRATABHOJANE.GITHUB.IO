import 'package:flutter/material.dart';
import '../models/recipe.dart';

class FavouriteScreen extends StatelessWidget {
  final Set<Recipe> favoriteRecipes;

  const FavouriteScreen({required this.favoriteRecipes, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorite Recipes'),
      ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'Your favorite recipes:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: favoriteRecipes.isNotEmpty
                ? ListView.builder(
                    itemCount: favoriteRecipes.length,
                    itemBuilder: (context, index) {
                      final recipe = favoriteRecipes.elementAt(index);
                      return Card(
                        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                        child: ListTile(
                          title: Text(recipe.name),
                          subtitle: Text(recipe.instructions),
                        ),
                      );
                    },
                  )
                : const Center(child: Text('No favorite recipes yet.')),
          ),
        ],
      ),
    );
  }
}

