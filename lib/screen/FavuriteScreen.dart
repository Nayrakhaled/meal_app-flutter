import 'package:flutter/material.dart';
import 'package:meal_app/module/Meal.dart';
import 'package:meal_app/widget/MealIteam.dart';

class FavoriteScreen extends StatelessWidget {
  final List<Meal> favouriteMeal;

  FavoriteScreen(this.favouriteMeal);

  @override
  Widget build(BuildContext context) {
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
