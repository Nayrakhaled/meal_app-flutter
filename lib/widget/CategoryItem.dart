import 'package:flutter/material.dart';
import 'package:meal_app/screen/CategoryDetailScreen.dart';

class CategoryItem extends StatelessWidget {

  final String id;
  final String title;
  final Color color;

  const CategoryItem(this.id, this.title, this.color);

  void selectedCategory(BuildContext context) {
    Navigator.of(context).pushNamed(
      CategoryDetailScreen.routeName,
      arguments: {
        'id' : id,
        'title' : title,
      },);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectedCategory(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: EdgeInsets.all(20),
        child: Text(title, style: Theme
            .of(context)
            .textTheme
            .title,),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              color.withOpacity(0.4),
              color
            ],
          ),
          borderRadius: BorderRadius.circular(15),
        ),
      ),);
  }
}
