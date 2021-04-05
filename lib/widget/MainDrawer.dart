import 'package:flutter/material.dart';
import 'package:meal_app/screen/FilterScreen.dart';
import 'package:meal_app/screen/ThemesScreen.dart';

class MainDrawer extends StatelessWidget {
  Widget buildListTitle(String title, IconData icon, Function Tab, BuildContext ctx) {
    return ListTile(
      leading: Icon(
        icon,
        color: Theme.of(ctx).buttonColor,
        size: 26,
      ),
      title: Text(
        title,
        style: TextStyle(
          fontSize: 24,
          color: Theme.of(ctx).textTheme.bodyText1.color,
          fontFamily: 'RobotoCondensed',
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: Tab,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 0,
      child: Column(
        children: [
          Container(
            height: 120,
            width: double.infinity,
            padding: EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            color: Theme.of(context).accentColor,
            child: Text("Cooking Up!!",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w900,
                  color: Theme.of(context).primaryColor,
                )),
          ),
          SizedBox(height: 20),
          buildListTitle("Meal", Icons.restaurant, (){Navigator.of(context).pushReplacementNamed('/');},context),
          buildListTitle("Filters", Icons.settings, (){Navigator.of(context).pushReplacementNamed(FilterScreen.routeName);}, context),
          buildListTitle("Themes", Icons.color_lens, (){Navigator.of(context).pushReplacementNamed(ThemesScreen.routeName);}, context),
        ],
      ),
    );
  }
}
