import 'package:flutter/material.dart';

class WorkingTipsScreen extends StatelessWidget {
  const WorkingTipsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> workingTips = [
      'Keep knives sharp for safer and more efficient chopping.',
      'Clean as you go to keep your workspace tidy.',
      'Use a damp cloth under your cutting board to prevent slipping.',
      'Store herbs in a glass of water in the fridge to keep them fresh longer.',
      'Always read the recipe through before starting.',
      'Preheat your pans before adding ingredients to ensure even cooking.',
      'Use a meat thermometer to check the doneness of meats.',
      'Let cooked meat rest before slicing to retain juices.',
      'Keep a bowl for kitchen scraps nearby to minimize trips to the trash.',
      'Use parchment paper for easy cleanup when baking.',
      'Label and date leftovers and pantry items to avoid waste.',
      'Use the right tool for the job to make tasks easier.',
      'Invest in good quality cookware for better cooking results.',
      'Organize your pantry and fridge to easily find ingredients.',
      'Use a spoon to peel ginger – it’s safer and more efficient.',
      'Season your food properly – taste and adjust as you cook.',
      'Keep a fire extinguisher in the kitchen for safety.',
      'Use a splatter guard to keep your stovetop clean.',
      'Soak pots and pans with stuck-on food to make cleaning easier.',
      'Plan meals ahead of time to save time and reduce stress.',
      'Batch cook and freeze portions for quick and easy meals.',
      'Keep a well-stocked pantry of staples for spontaneous cooking.',
      'Use a microplane to finely grate ingredients like garlic and cheese.',
      'Store onions and potatoes in a cool, dark place to prolong their shelf life.',
      'Rotate your food storage to use older items first.',
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Kitchen Working Tips'),
      ),
      body: ListView.builder(
        itemCount: workingTips.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(workingTips[index]),
          );
        },
      ),
    );
  }
}
