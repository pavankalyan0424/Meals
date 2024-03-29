import 'package:flutter/material.dart';

import './dummy_data.dart';
import './models/meals.dart';
import './pages/filtersPage.dart';
import './pages/homePage.dart';
import './pages/mealDetailPage.dart';
import 'pages/mealsPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<bool> filters = [false, false, false, false];
  List<Meal> _availableMeals = DUMMY_MEALS;
  List<Meal> _favoriteMeals = [];

  void _toggleFavorite(String mealId) {
    final existingIndex =
        _favoriteMeals.indexWhere((meal) => meal.id == mealId);
    if (existingIndex >= 0) {
      setState(() {
        _favoriteMeals.removeAt(existingIndex);
      });
    } else {
      setState(() {
        _favoriteMeals.add(DUMMY_MEALS.firstWhere((meal) => mealId == meal.id));
      });
    }
  }
bool _isFavorite(String id){
    return _favoriteMeals.any((meal)=>meal.id==id);
}
  void _setFilters(List<bool> filterData) {
    setState(() {
      filters = filterData;
    });
    _availableMeals = DUMMY_MEALS.where((meal) {
      if (filters[0] && !meal.isGlutenFree) {
        return false;
      }
      if (filters[1] && !meal.isLactoseFree) {
        return false;
      }
      if (filters[2] && !meal.isVegetarian) {
        return false;
      }
      if (filters[3] && !meal.isVegan) {
        return false;
      }
      return true;
    }).toList();
  }

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
        '/': (ctx) => MyHomePage(
              favoriteMeals: _favoriteMeals,
            ),
        CategoryMealsPage.routeName: (ctx) =>
            CategoryMealsPage(_availableMeals),
        MealDetailPage.routeName: (ctx) =>
            MealDetailPage(toggleFavorite: _toggleFavorite, isFavorite: _isFavorite,),
        FiltersPage.routeName: (ctx) => FiltersPage(_setFilters, filters),
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(
          builder: (context) => MyHomePage(
            favoriteMeals: _favoriteMeals,
          ),
        );
      },
      onGenerateRoute: (settings) {
        return MaterialPageRoute(
          builder: (context) => MyHomePage(
            favoriteMeals: _favoriteMeals,
          ),
        );
      },
    );
  }
}
