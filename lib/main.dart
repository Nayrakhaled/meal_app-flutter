import 'package:flutter/material.dart';
import 'package:meal_app/providers/meal_provider.dart';
import 'package:meal_app/screen/CategoryDetailScreen.dart';
import 'package:meal_app/screen/CategoryScreen.dart';
import 'package:meal_app/screen/FilterScreen.dart';
import 'package:meal_app/screen/MealDetailScreen.dart';
import 'package:meal_app/screen/TabBottom.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider<MealProvider>(
    create: (ctx) => MealProvider(),
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
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
        '/': (context) => TabBottom(),
        CategoryDetailScreen.routeName: (context) => CategoryDetailScreen(),
        MealDetailScreen.routeName: (context) => MealDetailScreen(),
        FilterScreen.routeName: (context) => FilterScreen(),
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
