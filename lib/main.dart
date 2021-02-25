import 'package:flutter/material.dart';
import 'package:meal_app/dummy_data.dart';
import 'package:meal_app/module/Meal.dart';
import 'package:meal_app/screen/CategoryDetailScreen.dart';
import 'package:meal_app/screen/CategoryScreen.dart';
import 'package:meal_app/screen/FilterScreen.dart';
import 'package:meal_app/screen/MealDetailScreen.dart';
import 'package:meal_app/screen/TabBottom.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false
  };

  List<Meal> _availiableMeals = DUMMY_MEALS;
  List<Meal> _favouriteMeals = [];

  void _selectedFilter(Map<String, bool> _filterData) {
    setState(() {
      _filters = _filterData;

      _availiableMeals = DUMMY_MEALS.where((meal) {
        if (_filters['gluten'] && !meal.isGlutenFree) return false;
        if (_filters['lactose'] && !meal.isLactoseFree) return false;
        if (_filters['vegan'] && !meal.isVegan) return false;
        if (_filters['vegetarian'] && !meal.isVegetarian) return false;
        return true;
      }).toList();
    });
  }

  void _saveFavourite(String mealId) {
    final existingId = _favouriteMeals.indexWhere((meal) => meal.id == mealId);

    if (existingId >= 0) {
      setState(() {
        _favouriteMeals.removeAt(existingId);
      });
    } else {
      setState(() {
        _favouriteMeals
            .add(DUMMY_MEALS.firstWhere((meal) => meal.id == mealId));
      });
    }
  }

  bool _isMealFavourite(String id) {
   return _favouriteMeals.any((meal) => meal.id == id);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.blue,
        accentColor: Colors.tealAccent,
        canvasColor: Colors.white,
        textTheme: ThemeData.light().textTheme.copyWith(
              body1: TextStyle(
                color: Color.fromRGBO(20, 50, 50, 1),
              ),
              body2: TextStyle(
                color: Color.fromRGBO(20, 50, 50, 1),
              ),
              title: TextStyle(
                fontSize: 20,
                fontFamily: 'RobotoCondensed',
                fontWeight: FontWeight.bold,
              ),
            ),
      ),
      routes: {
        '/': (context) => TabBottom(_favouriteMeals),
        CategoryDetailScreen.routeName: (context) =>
            CategoryDetailScreen(_availiableMeals),
        MealDetailScreen.routeName: (context) =>
            MealDetailScreen(_saveFavourite, _isMealFavourite),
        FilterScreen.routeName: (context) =>
            FilterScreen(_filters, _selectedFilter),
      },
      // home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Meal App"),
      ),
      body:
          CategoryScreen(), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
