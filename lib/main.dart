import 'package:flutter/material.dart';
import 'package:meals/pages/mealDetailPage.dart';

import './pages/homePage.dart';
import 'pages/mealsPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meals',
      theme: ThemeData(
        primaryColor: Colors.pinkAccent,
        accentColor: Colors.amber,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
        visualDensity: VisualDensity.adaptivePlatformDensity,
        textTheme: ThemeData.light().textTheme.copyWith(
              bodyText1: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              bodyText2: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              headline6: TextStyle(
                fontFamily: 'RobotoCondensed',
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
      ),
      // home: MyHomePage(),
      initialRoute: '/',
      routes: {
        '/': (ctx) => MyHomePage(),
        CategoryMealsPage.routeName: (ctx) => CategoryMealsPage(),
        MealDetailPage.routeName: (ctx) => MealDetailPage(),
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(
          builder: (context) => MyHomePage(),
        );
      },
      onGenerateRoute: (settings) {
        return MaterialPageRoute(
          builder: (context) => MyHomePage(),
        );
      },
    );
  }
}
