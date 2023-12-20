import 'package:flutter/material.dart';

import 'package:meals/model/meal.dart';
import 'package:meals/screens/meal_detail_screen.dart';

import 'package:meals/widgets/meals_item.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen(
      {super.key,
      required this.meals,
      this.title,
      required this.toggleFavorites});
  final String? title;
  final List<Meal> meals;
  final void Function(Meal meal) toggleFavorites;
  void selectMeal(BuildContext context, Meal meal) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => MealDetailScreen(
          meal: meal,
          onToggleFavorite: toggleFavorites,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget content = ListView.builder(
      itemCount: meals.length,
      itemBuilder: (context, index) => MealItem(
        meal: meals[index],
        onSelectMeal: (context, meal) {
          selectMeal(context, meal);
        },
      ),
    );

    if (meals.isEmpty) {
      content = Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Uh ohh.... nothing here",
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .copyWith(color: Colors.amber),
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              "Try selecting a different category!",
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  fontSize: 30,
                  color: Theme.of(context).colorScheme.background),
            )
          ],
        ),
      );
    }
    if (title == null) {
      return content;
    }
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text(title!),
        ),
        body: content);
  }
}
