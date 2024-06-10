import 'package:flutter/material.dart';

import 'package:meal/data/dummy_data.dart';
import 'package:meal/models/category.dart';
import 'package:meal/screens/meals.dart';
import 'package:meal/widgets/categorygriditem.dart';

class categoryScreen extends StatelessWidget {
  const categoryScreen({super.key});

  void _selectCategory(BuildContext context, Category category) {
    final filteredMeals = dummyMeals
        .where(
          (meal) => meal.categories.contains(category.id),
        )
        .toList();

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) =>
            Mealscreen(meals: filteredMeals, title: category.title),
      ),
    ); //navigator.push(context, route);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Category",
          style: TextStyle(color: Colors.amber),
        ),
      ),
      body: GridView(
        padding: const EdgeInsets.all(24),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 1.5,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20),
        children: [
          for (final category in availableCategories)
            Categorygriditem(
              category: category,
              onseleectCategory: () {
                _selectCategory(context, category);
              },
            ),
        ],
      ),
    );
  }
}
