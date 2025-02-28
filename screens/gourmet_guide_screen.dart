import 'package:flutter/material.dart';
import '../data/ingredients_data.dart';

class GourmetGuideScreen extends StatefulWidget {
  final String? loggedInEmail;

  const GourmetGuideScreen({this.loggedInEmail, super.key});

  @override
  GourmetGuideScreenState createState() => GourmetGuideScreenState();
}

class GourmetGuideScreenState extends State<GourmetGuideScreen> {
  final Set<int> _selectedIngredients = {};
  String _searchQuery = "";

  void _toggleIngredient(int id) {
    setState(() {
      if (_selectedIngredients.contains(id)) {
        _selectedIngredients.remove(id);
      } else {
        _selectedIngredients.add(id);
      }
    });
  }

  void _clearSelection() {
    setState(() {
      _selectedIngredients.clear();
    });
  }

  void _navigateToRecipes() {
    Navigator.pushNamed(context, '/recipes', arguments: _selectedIngredients);
  }

  void _updateSearchQuery(String query) {
    setState(() {
      _searchQuery = query.toLowerCase();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gourmet Guide'),
        centerTitle: true,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(color: Colors.green),
              child: Text('Menu'),
            ),
            ListTile(
              title: const Text('Sign In'),
              onTap: () {
                Navigator.pushNamed(context, '/sign_in');
              },
            ),
            ListTile(
              title: const Text('Login'),
              onTap: () {
                Navigator.pushNamed(context, '/login');
              },
            ),
            if (widget.loggedInEmail != null) ...[
              ListTile(
                title: const Text('Favorite Recipes'),
                onTap: () {
                  Navigator.pushNamed(context, '/favorites');
                },
              ),
              ListTile(
                title: const Text('My Account'),
                onTap: () {
                  Navigator.pushNamed(context, '/account');
                },
              ),
            ],
            ListTile(
              title: const Text('Submit Your Recipe'),
              onTap: () {
                Navigator.pushNamed(context, '/submit_recipe');
              },
            ),
            ListTile(
              title: const Text('Working Tips'),
              onTap: () {
                Navigator.pushNamed(context, '/working_tips');
              },
            ),
            ListTile(
              title: const Text('About Us'),
              onTap: () {
                Navigator.pushNamed(context, '/about');
              },
            ),
          ],
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'What\'s in Your Fridge?',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          // Search Bar
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: TextField(
              onChanged: _updateSearchQuery,
              decoration: const InputDecoration(
                labelText: 'Search Ingredients',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
            ),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(8.0),
              children: categorizedIngredients.keys.map((category) {
                final ingredients = categorizedIngredients[category]!
                    .where((ingredient) => ingredient['name']
                        .toLowerCase()
                        .contains(_searchQuery))
                    .toList();
                if (ingredients.isEmpty) return const SizedBox(); // Skip empty sections
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      category,
                      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    const SizedBox(height: 10),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal, // Horizontal scrolling
                      child: Row(
                        children: ingredients.map((ingredient) {
                          final isSelected = _selectedIngredients.contains(ingredient['id']);
                          return GestureDetector(
                            onTap: () => _toggleIngredient(ingredient['id']),
                            child: Card(
                              elevation: 2,
                              color: isSelected
                                  ? Colors.green[300] // Highlight if selected
                                  : Colors.lightGreen[100], // Default light green
                              child: Container(
                                width: 100, // Adjust width for horizontal layout
                                height: 50, // Adjust height for horizontal cards
                                alignment: Alignment.center,
                                margin: const EdgeInsets.symmetric(horizontal: 4.0),
                                child: Text(
                                  ingredient['name'],
                                  style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                    const SizedBox(height: 20),
                  ],
                );
              }).toList(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: _clearSelection,
                  child: const Text('Clear Selection'),
                ),
                ElevatedButton(
                  onPressed: _navigateToRecipes,
                  child: const Text('Let\'s Cook!'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
