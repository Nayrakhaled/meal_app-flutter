import 'package:flutter/material.dart';
import 'package:meal_app/providers/meal_provider.dart';
import 'package:meal_app/providers/theme_provider.dart';
import 'package:meal_app/screen/CategoryDetailScreen.dart';
import 'package:meal_app/screen/CategoryScreen.dart';
import 'package:meal_app/screen/FilterScreen.dart';
import 'package:meal_app/screen/MealDetailScreen.dart';
import 'package:meal_app/screen/TabBottom.dart';
import 'package:meal_app/screen/ThemesScreen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<MealProvider>(
          create: (ctx) => MealProvider(),
        ),
        ChangeNotifierProvider<ThemeProvider>(
          create: (ctx) => ThemeProvider(),
        )
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var primaryColor = Provider.of<ThemeProvider>(context, listen: true).primaryColor;
    var accentColor = Provider.of<ThemeProvider>(context, listen: true).accentColor;
    var theme = Provider.of<ThemeProvider>(context, listen: true).theme;

    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      themeMode: theme,
      theme: ThemeData(
        primaryColor: primaryColor,
        accentColor: accentColor,
        canvasColor: Color.fromRGBO(225, 254, 229, 1),
        fontFamily: "Raleway",
        buttonColor: Colors.black87,
        cardColor: Colors.white,
        shadowColor: Colors.white60,
        textTheme: ThemeData.light().textTheme.copyWith(
              bodyText1: TextStyle(
                color: Color.fromRGBO(20, 50, 58, 1),
              ),
              headline6: TextStyle(
                fontSize: 20,
                color: Colors.black87,
                fontFamily: 'RobotoCondensed',
                fontWeight: FontWeight.bold,
              ),
            ),
      ),
      darkTheme: ThemeData(
        primaryColor: primaryColor,
        accentColor: accentColor,
        canvasColor: Color.fromRGBO(14, 22, 33, 1),
        fontFamily: "Raleway",
        buttonColor: Colors.white70,
        unselectedWidgetColor: Colors.white70,
        cardColor: Color.fromRGBO(35, 34, 39, 1),
        shadowColor: Colors.white60,
        textTheme: ThemeData.dark().textTheme.copyWith(
              bodyText1: TextStyle(
                color: Colors.white60,
              ),
              headline6: TextStyle(
                fontSize: 20,
                color: Colors.white60,
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
        ThemesScreen.routeName: (context) => ThemesScreen(),
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
