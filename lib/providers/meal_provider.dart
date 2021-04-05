import 'package:flutter/material.dart';
import 'package:meal_app/module/Meal.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../dummy_data.dart';

class MealProvider with ChangeNotifier{
  Map<String, bool> filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false
  };
  List<String> prefsMealId = [];

  List<Meal> availableMeals = DUMMY_MEALS;
  List<Meal> favouriteMeals = [];

  void selectedFilter() async{

      availableMeals = DUMMY_MEALS.where((meal) {
        if (filters['gluten'] && !meal.isGlutenFree) return false;
        if (filters['lactose'] && !meal.isLactoseFree) return false;
        if (filters['vegan'] && !meal.isVegan) return false;
        if (filters['vegetarian'] && !meal.isVegetarian) return false;
        return true;
      }).toList();

      var prefs = await SharedPreferences.getInstance();
      prefs.setBool("gluten", filters['gluten']);
      prefs.setBool("lactose", filters['lactose']);
      prefs.setBool("vegan", filters['vegan']);
      prefs.setBool("vegetarian", filters['vegetarian']);
      notifyListeners();

  }

  void getFilterData() async{
    var prefs = await SharedPreferences.getInstance();
    filters['gluten'] = prefs.getBool("gluten")?? false;
    filters['lactose'] = prefs.getBool("lactose")?? false;
    filters['vegan'] = prefs.getBool("vegan")?? false;
    filters['vegetarian'] = prefs.getBool("vegetarian")?? false;

    prefsMealId = prefs.getStringList("prefsMealId")?? [];

    for(var mealId in prefsMealId){
      final existingId = favouriteMeals.indexWhere((meal) => meal.id == mealId);
      if (existingId < 0) {
        favouriteMeals
            .add(DUMMY_MEALS.firstWhere((meal) => meal.id == mealId));
      }
    }
  }
  void saveFavourite(String mealId) async{
    final existingId = favouriteMeals.indexWhere((meal) => meal.id == mealId);
    var prefs = await SharedPreferences.getInstance();

    if (existingId >= 0) {
        favouriteMeals.removeAt(existingId);
        prefsMealId.remove(mealId);
    } else {
        favouriteMeals
            .add(DUMMY_MEALS.firstWhere((meal) => meal.id == mealId));
        prefsMealId.add(mealId);
    }
    notifyListeners();
    prefs.setStringList("prefsMealId", prefsMealId);

  }

  bool isFavourite(String mealId){
    return favouriteMeals.any((meal) => meal.id == mealId);
  }


}