import 'package:flutter/material.dart';
import 'package:meals/data/dummy_data.dart';
import 'package:meals/model/category.dart';
import 'package:meals/model/meal.dart';
import 'package:meals/screens/mealss.dart';
import 'package:meals/widgets/category_grid_item.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen(
      {super.key, required this.toggleFavorite, required this.availableMeals});

  void _selectCategory(BuildContext context, Category category) {
    final filtered_meals = availableMeals
        .where((meal) => meal.categories.contains(category.id))
        .toList();
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => MealsScreen(
              meals: filtered_meals,
              title: category.title,
              toggleFavorites: toggleFavorite,
            )));
  }

  final void Function(Meal meal) toggleFavorite;
  final List<Meal> availableMeals;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView(
        padding: EdgeInsets.all(24),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 1.5,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20),
        children: [
          //availableCtaegories.map((category)=>CategoryGridItem(category: category)).toList()
          for (final category in availableCategories)
            CategoryItem(
              category: category,
              onSelectCategoty: () {
                _selectCategory(context, category);
              },
            )
        ],
      ),
    );
  }
}
