import 'package:flutter/material.dart';
import 'package:meal_app/module/Meal.dart';

import '../dummy_data.dart';

class MealProvider with ChangeNotifier{
  Map<String, bool> filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false
  };

  List<Meal> availiableMeals = DUMMY_MEALS;
  List<Meal> favouriteMeals = [];

  void selectedFilter(Map<String, bool> _filterData) {
      filters = _filterData;

      availiableMeals = DUMMY_MEALS.where((meal) {
        if (filters['gluten'] && !meal.isGlutenFree) return false;
        if (filters['lactose'] && !meal.isLactoseFree) return false;
        if (filters['vegan'] && !meal.isVegan) return false;
        if (filters['vegetarian'] && !meal.isVegetarian) return false;
        return true;
      }).toList();
      notifyListeners();
  }

  void saveFavourite(String mealId) {
    final existingId = favouriteMeals.indexWhere((meal) => meal.id == mealId);

    if (existingId >= 0) {

        favouriteMeals.removeAt(existingId);
    } else {
        favouriteMeals
            .add(DUMMY_MEALS.firstWhere((meal) => meal.id == mealId));
    }
    isMealFavourite =  favouriteMeals.any((meal) => meal.id == mealId);
    notifyListeners();
  }

  bool isMealFavourite = false;


}