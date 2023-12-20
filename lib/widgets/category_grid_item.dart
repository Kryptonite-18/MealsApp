import 'package:flutter/material.dart';
import 'package:meals/model/category.dart';

class CategoryItem extends StatelessWidget {
  CategoryItem(
      {super.key, required this.category, required this.onSelectCategoty});
  final Category category;
  final void Function() onSelectCategoty;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onSelectCategoty,
      borderRadius: BorderRadius.circular(16),
      splashColor: Theme.of(context).secondaryHeaderColor,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              category.color.withOpacity(0.55),
              category.color.withOpacity(0.9)
            ],
          ),
        ),
        child: Text(
          category.title,
          style: Theme.of(context)
              .textTheme
              .titleLarge!
              .copyWith(color: Theme.of(context).colorScheme.onBackground),
        ),
      ),
    );
  }
}
