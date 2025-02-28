import 'package:flutter/material.dart';
import '../models/recipe.dart';

class AccountScreen extends StatelessWidget {
  final List<Recipe> submittedRecipes;

  const AccountScreen({required this.submittedRecipes, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Account'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Welcome to your account!',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          const Text(
            'Your Submitted Recipes:',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: ListView.builder(
              itemCount: submittedRecipes.length,
              itemBuilder: (context, index) {
                final recipe = submittedRecipes[index];
                return Card(
                  margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                  child: ListTile(
                    title: Text(recipe.name),
                    subtitle: Text(recipe.instructions),
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);  // This will sign out the user by navigating back
            },
            child: const Text('Sign Out'),
          ),
        ],
      ),
    );
  }
}
