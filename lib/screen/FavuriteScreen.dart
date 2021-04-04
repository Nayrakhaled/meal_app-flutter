import 'package:flutter/material.dart';
import 'package:meal_app/module/Meal.dart';
import 'package:meal_app/providers/meal_provider.dart';
import 'package:meal_app/widget/MealIteam.dart';
import 'package:provider/provider.dart';

class FavoriteScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    final List<Meal> favouriteMeal = Provider.of<MealProvider>(context, listen: true).favouriteMeals;

    if (favouriteMeal.isEmpty)
      return Center(
        child: Text('You have no favourites yet '),
      );
    else
      return ListView.builder(
        itemBuilder: (contex, index) {
          return MealItem(
            id: favouriteMeal[index].id,
            title: favouriteMeal[index].title,
            imageUrl: favouriteMeal[index].imageUrl,
            duration: favouriteMeal[index].duration,
            complexity: favouriteMeal[index].complexity,
            affordability: favouriteMeal[index].affordability,
          );
        },
        itemCount: favouriteMeal.length,
      );
  }
}
