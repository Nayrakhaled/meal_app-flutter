import 'package:flutter/material.dart';
import 'package:meal_app/providers/theme_provider.dart';
import 'package:meal_app/widget/MainDrawer.dart';
import 'package:meal_app/providers/meal_provider.dart';
import 'package:provider/provider.dart';

class FilterScreen extends StatefulWidget {
  static const String routeName = '/filter';

  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  Widget buildSwitchListTitle(
      String title, String desc, bool currentValue, Function onChange) {
    return SwitchListTile(
      title: Text(title),
      value: currentValue,
      subtitle: Text(desc),
      onChanged: onChange,
      inactiveTrackColor:
          Provider.of<ThemeProvider>(context, listen: true).theme ==
                  ThemeMode.light
              ? null
              : Colors.black,
    );
  }

  @override
  Widget build(BuildContext context) {
    final Map<String, bool> currentFilter =
        Provider.of<MealProvider>(context, listen: true).filters;

    return Scaffold(
      appBar: AppBar(
        title: Text("Your Filters"),
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'Adjust your meal selection.',
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                buildSwitchListTitle(
                    'Gluten-free',
                    'Only include Gluten-free meals',
                    currentFilter['gluten'], (newValue) {
                  setState(() {
                    currentFilter['gluten'] = newValue;
                  });
                  Provider.of<MealProvider>(context, listen: false)
                      .selectedFilter();
                }),
                buildSwitchListTitle(
                    'Lactose-free',
                    'Only include Lactose-free meals',
                    currentFilter['lactose'], (newValue) {
                  setState(() {
                    currentFilter['lactose'] = newValue;
                  });
                  Provider.of<MealProvider>(context, listen: false)
                      .selectedFilter();
                }),
                buildSwitchListTitle(
                    'vegan', 'Only include Vegan meals', currentFilter['vegan'],
                    (newValue) {
                  setState(() {
                    currentFilter['vegan'] = newValue;
                  });
                  Provider.of<MealProvider>(context, listen: false)
                      .selectedFilter();
                }),
                buildSwitchListTitle(
                    'Vegetarian',
                    'Only include Vegetarian meals',
                    currentFilter['vegetarian'], (newValue) {
                  setState(() {
                    currentFilter['vegetarian'] = newValue;
                  });
                  Provider.of<MealProvider>(context, listen: false)
                      .selectedFilter();
                }),
              ],
            ),
          ),
        ],
      ),
      drawer: MainDrawer(),
    );
  }
}
