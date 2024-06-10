import 'package:flutter/material.dart';

import 'package:meal/models/meal.dart';
import 'package:meal/widgets/meal_item.dart';

class Mealscreen extends StatelessWidget {
  const Mealscreen({super.key, required this.meals, required this.title});

  final String title;
  final List<Meal> meals;
  @override
  Widget build(BuildContext context) {
    Widget content = Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            "uh nothyng",
            style: TextStyle(color: Colors.amber),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            'choose diff category ',
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                ),
          ),
        ],
      ),
    );

    if (meals.isNotEmpty) {
     content= ListView.builder(
        itemCount: meals.length,
        itemBuilder: (ctx, index) =>mealitem(meal: meals[index],),
        );
      
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: content,
    );
  }
}
