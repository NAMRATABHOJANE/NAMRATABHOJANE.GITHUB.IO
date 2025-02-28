import 'package:flutter/material.dart';
import '../models/recipe.dart';

class SubmitRecipeScreen extends StatefulWidget {
  final Function(Recipe) onSubmit;
  final String? loggedInEmail;

  const SubmitRecipeScreen({required this.onSubmit, this.loggedInEmail, super.key});

  @override
  SubmitRecipeScreenState createState() => SubmitRecipeScreenState();
}

class SubmitRecipeScreenState extends State<SubmitRecipeScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _ingredientsController = TextEditingController();
  final TextEditingController _instructionsController = TextEditingController();
  String? _errorMessage;

  void _submitRecipe() {
    if (widget.loggedInEmail == null) {
      setState(() {
        _errorMessage = 'Please sign in first to submit a recipe.';
      });
      return;
    }

    final name = _nameController.text;
    final ingredientsText = _ingredientsController.text;
    final instructions = _instructionsController.text;

    if (name.isNotEmpty && ingredientsText.isNotEmpty && instructions.isNotEmpty) {
      final ingredientIds = ingredientsText.split(',').map((e) => int.parse(e.trim())).toList();
      final newRecipe = Recipe(name, ingredientIds, instructions);

      widget.onSubmit(newRecipe);

      // Navigate to the AccountScreen after submission
      Navigator.pushNamed(context, '/account');
    } else {
      setState(() {
        _errorMessage = 'All fields are required';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Submit Your Recipe'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _nameController,
              decoration: InputDecoration(
                labelText: 'Recipe Name',
                errorText: _errorMessage,
              ),
            ),
            TextField(
              controller: _ingredientsController,
              decoration: InputDecoration(
                labelText: 'Ingredients (comma separated IDs)',
                errorText: _errorMessage,
              ),
            ),
            TextField(
              controller: _instructionsController,
              decoration: InputDecoration(
                labelText: 'Instructions',
                errorText: _errorMessage,
              ),
              maxLines: 4,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _submitRecipe,
              child: const Text('Submit Recipe'),
            ),
          ],
        ),
      ),
    );
  }
}
