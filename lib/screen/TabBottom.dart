import 'package:flutter/material.dart';
import 'package:meal_app/module/Meal.dart';
import 'package:meal_app/screen/CategoryScreen.dart';
import 'package:meal_app/screen/FavuriteScreen.dart';
import 'package:meal_app/widget/MainDrawer.dart';

class TabBottom extends StatefulWidget {
  @override
  _TabBottomState createState() => _TabBottomState();
}

class _TabBottomState extends State<TabBottom> {
  List<Map<String, Object>> _listPage;
  int _selectedPageIndex = 0;

  @override
  void initState() {
    _listPage = [
      {"page": CategoryScreen(), "title": "Categories"},
      {"page": FavoriteScreen(), "title": "Your Favourites"}
    ];
    super.initState();
  }

  void _selectPage(int value) {
    setState(() {
      _selectedPageIndex = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_listPage[_selectedPageIndex]['title']),
      ),
      body: _listPage[_selectedPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        backgroundColor: Theme.of(context).primaryColor,
        selectedItemColor: Theme.of(context).accentColor,
        unselectedItemColor: Colors.white,
        currentIndex: _selectedPageIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            title: Text("Categories"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            title: Text("Favourites"),
          ),
        ],
      ),
      drawer: MainDrawer(),
    );
  }
}
