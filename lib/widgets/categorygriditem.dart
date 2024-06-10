import 'package:flutter/material.dart';

import 'package:meal/models/category.dart';
class Categorygriditem extends StatelessWidget {
  const Categorygriditem({
    super.key,
    required this.category,
    required this.onseleectCategory,
  });
  final Category category;
  final void Function() onseleectCategory;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onseleectCategory,
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              category.color.withOpacity(.25),
              category.color.withOpacity(.9),
              category.color.withOpacity(.25),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Text(
          category.title,
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Theme.of(context).colorScheme.onBackground,
              ),
        ),
      ),
    );
  }
}
