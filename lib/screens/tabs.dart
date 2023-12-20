import 'package:flutter/material.dart';
import 'package:meals/data/dummy_data.dart';
import 'package:meals/model/meal.dart';
import 'package:meals/screens/categories.dart';
import 'package:meals/screens/filterscreen.dart';
import 'package:meals/screens/mealss.dart';
import 'package:meals/widgets/main_drawer.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int selectedScreenIndex = 0;
  void selectScreen(int index) {
    setState(() {
      selectedScreenIndex = index;
    });
  }

  Map<filter, bool> _selectedFilter = {
    filter.glutenfree: false,
    filter.lactosefree: false,
    filter.vegan: false,
    filter.vegetarian: false
  };

  void _setScreen(String identifier) async {
    if (identifier == 'Filters') {
      Navigator.pop(context);
      final result = await Navigator.push<Map<filter, bool>>(
        context,
        MaterialPageRoute(
          builder: (context) => FilterScreen(
            currentFilters: _selectedFilter,
          ),
        ),
      );

      setState(() {
        _selectedFilter = result ?? _selectedFilter;
      });
    } else {
      Navigator.pop(context);
    }
  }

  void showMessage(String message) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }

  void toggleStatus(Meal meal) {
    final isPresent = favorites.contains(meal);
    setState(() {
      if (isPresent) {
        favorites.remove(meal);
        showMessage("meal is removed from favorites");
      } else {
        favorites.add(meal);
        showMessage("meal is added to favorites");
      }
    });
  }

  IconData icon = Icons.star;

  String screenTitle = "Categories";
  List<Meal> favorites = [];

  @override
  Widget build(BuildContext context) {
    final availableMeals = dummyMeals.where((meal) {
      if (_selectedFilter[filter.glutenfree]! && !meal.isGlutenFree) {
        return false;
      }
      if (_selectedFilter[filter.lactosefree]! && !meal.isLactoseFree) {
        return false;
      }
      if (_selectedFilter[filter.vegan]! && !meal.isVegan) {
        return false;
      }
      if (_selectedFilter[filter.vegetarian]! && !meal.isVegetarian) {
        return false;
      }
      return true;
    }).toList();
    Widget activeScreen = CategoriesScreen(
      availableMeals: availableMeals,
      toggleFavorite: toggleStatus,
    );
    if (selectedScreenIndex == 1) {
      activeScreen = MealsScreen(
        meals: favorites,
        toggleFavorites: toggleStatus,
      );
      screenTitle = "Your Favorites";
    }
    return Scaffold(
      drawer: MainDrawer(
        onSelectScreen: _setScreen,
      ),
      appBar: AppBar(
        title: Text(screenTitle),
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: selectScreen,
        currentIndex: selectedScreenIndex,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.food_bank), label: 'Categories'),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite), label: 'Favorites')
        ],
      ),
      body: activeScreen,
    );
  }
}
