import 'package:flutter/material.dart';
import 'package:meal_app/module/Meal.dart';
import 'package:meal_app/widget/MealIteam.dart';
import 'package:meal_app/providers/meal_provider.dart';
import 'package:provider/provider.dart';

class CategoryDetailScreen extends StatefulWidget {
  static const String routeName = 'category_meal';


  @override
  _CategoryDetailScreenState createState() => _CategoryDetailScreenState();
}

class _CategoryDetailScreenState extends State<CategoryDetailScreen> {
  String categoryTitle;
  List<Meal> categoryMeals;

  @override
  void didChangeDependencies() {
    final List<Meal> _availableMeals = Provider.of<MealProvider>(context, listen: true).availableMeals;
    final routeArg =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final categoryId = routeArg['id'];
    categoryTitle = routeArg['title'];
    // dah 3l4an 2laf 3la fol 2ly fy el dummy meal wa
    // 24of el category hwa ely ana dos 3l3h wla l2
    categoryMeals = _availableMeals.where((meal) {
      return meal.categories.contains(categoryId);
    }).toList();
  }

  void _removeItem(String mealId) {
    setState(() {
      categoryMeals.removeWhere((meal) => meal.id == mealId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: ListView.builder(
        itemBuilder: (contex, index) {
          return MealItem(
            id: categoryMeals[index].id,
            title: categoryMeals[index].title,
            imageUrl: categoryMeals[index].imageUrl,
            duration: categoryMeals[index].duration,
            complexity: categoryMeals[index].complexity,
            affordability: categoryMeals[index].affordability,
          );
        },
        itemCount: categoryMeals.length,
      ),
    );
  }
}
