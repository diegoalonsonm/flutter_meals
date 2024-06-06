import 'package:flutter/material.dart';
import 'package:flutter_meals/data/data.dart';
import 'package:flutter_meals/models/category.dart';
import 'package:flutter_meals/models/meal.dart';
import 'package:flutter_meals/screens/meals.dart';
import 'package:flutter_meals/widgets/category_grid_item.dart';

class CategoriesScreeen extends StatelessWidget {
  const CategoriesScreeen({super.key, required this.onToggleFavorite, required this.tabFilteredMeals});
  
  final void Function(Meal meal) onToggleFavorite;
  final List<Meal> tabFilteredMeals;

  void _selectCategory(BuildContext context, Category category) {
    final filteredMeals = tabFilteredMeals.where((meal) => meal.categories.contains(category.id)).toList();

    Navigator.push(context, MaterialPageRoute(
      builder: (ctx) => MealsScreen(
        title: category.title,
        meals: filteredMeals,
        onToggleFavorite: onToggleFavorite,
      )
    ));
  }

  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: const EdgeInsets.all(20),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3/2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20
      ),
      children: [
        for (final category in availableCategories)
          CategoryGridItem(
            category: category, 
            selectCategory: () {
              _selectCategory(context, category);
            } 
          )
      ]
    );
  }
}