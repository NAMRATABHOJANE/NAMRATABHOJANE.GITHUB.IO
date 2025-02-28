import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About Us'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'About Us',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              const Text(
                'My name is Namrata Bhojane. I am a developer with a passion for creating useful and engaging applications.',
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 20),
              const Text(
                'What Our Website Does',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              const Text(
                'Our website helps users discover and share recipes using ingredients they have at home. It allows users to submit their own recipes, save their favorite recipes, and access useful kitchen tips. Our goal is to make cooking enjoyable and accessible for everyone.',
                style: TextStyle(fontSize: 16),
              ),
              const Text(
                'Key Features:',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const Text(
                '• Recipe Discovery: Users can search for recipes based on the ingredients they have in their fridge or pantry. This helps minimize food waste and encourages creativity in the kitchen.',
                style: TextStyle(fontSize: 16),
              ),
              const Text(
                '• Submit Recipes: Users can submit their own recipes, which are then saved to their account. This allows users to share their culinary creations with others and keep track of their favorite recipes.',
                style: TextStyle(fontSize: 16),
              ),
              const Text(
                '• Favorite Recipes: Users can save their favorite recipes for easy access. This feature is particularly useful for keeping a collection of go-to meals that users can refer back to.',
                style: TextStyle(fontSize: 16),
              ),
              const Text(
                '• Working Tips: The website provides valuable kitchen tips to improve cooking efficiency, safety, and overall kitchen experience. These tips range from basic knife skills to advanced cooking techniques.',
                style: TextStyle(fontSize: 16),
              ),
              const Text(
                '• About Us: The website includes an "About Us" section that provides information about the creator, the purpose of the website, and the goals of making cooking enjoyable and accessible for everyone.',
                style: TextStyle(fontSize: 16),
              ),
              const Text(
                '• Contact Us: Users can reach out to the creator via the contact email provided in the "About Us" section.',
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 20),
              const Text(
                'Contact Us',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              const Text(
                'Email: namratabhojane63@gmail.com',
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

