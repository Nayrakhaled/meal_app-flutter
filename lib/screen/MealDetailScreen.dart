import 'package:flutter/material.dart';
import 'package:meal_app/dummy_data.dart';

class MealDetailScreen extends StatelessWidget {
  static const String routeName = 'meal_detail';
  final Function saveFavourite;
  final Function isMealFavourite;

  const MealDetailScreen(this.saveFavourite, this.isMealFavourite);


  Widget buildText(BuildContext context, String title) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20),
      child: Text(
        title,
        style: Theme.of(context).textTheme.title,
      ),
    );
  }

  Widget buildContainer(Widget child) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.blueGrey),
        borderRadius: BorderRadius.circular(10),
      ),
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      height: 200,
      width:250,
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context).settings.arguments as String;
    final selectedMeal = DUMMY_MEALS.firstWhere((meal) => meal.id == mealId);

    return Scaffold(
      appBar: AppBar(
        title: Text(selectedMeal.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(
                selectedMeal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            buildText(context, "Ingradients"),
            buildContainer(
              ListView.builder(
                itemBuilder: (context, index) => Card(
                  color: Theme.of(context).accentColor,
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    child: Text(selectedMeal.ingredients[index]),
                  ),
                ),
                itemCount: selectedMeal.ingredients.length,
              ),
            ),
            buildText(context, "Steps"),
            buildContainer(ListView.builder(
              itemBuilder: (context, index) =>
              Column(
                children: [
                  ListTile(
                    leading: CircleAvatar(
                      child:  Text("#${index+1}"),
                    ) ,
                    title: Text(selectedMeal.steps[index]),
                  ),
                  // Divider(),
                ],
              ),
itemCount: selectedMeal.steps.length,
            ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        //kda wa ana b3mal pop bb3t kema m3ha
        child: Icon(isMealFavourite(mealId)?Icons.star:Icons.star_border),
        onPressed: ()=>saveFavourite(mealId),
      ),
    );
  }
}
