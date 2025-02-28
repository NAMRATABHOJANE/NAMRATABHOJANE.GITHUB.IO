import 'package:flutter/material.dart';
import '../models/ingredient.dart';

class IngredientList extends StatelessWidget {
  final List<Ingredient> ingredients;
  final Set<int> selectedIngredients;
  final void Function(int) toggleIngredient;

  const IngredientList({
    required this.ingredients,
    required this.selectedIngredients,
    required this.toggleIngredient,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: ingredients.length,
      itemBuilder: (context, index) {
        final ingredient = ingredients[index];
        return CheckboxListTile(
          title: Text(ingredient.name),
          value: selectedIngredients.contains(ingredient.id),
          onChanged: (bool? value) {
            toggleIngredient(ingredient.id);
          },
        );
      },
    );
  }
}
