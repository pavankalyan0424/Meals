import 'package:flutter/material.dart';
import '../dummy_data.dart';
import '../models/meals.dart';

import '../widgets/meal_item.dart';

class CategoryMealsPage extends StatefulWidget {
  static const String routeName = '/category-meals';

  @override
  _CategoryMealsPageState createState() => _CategoryMealsPageState();
}

class _CategoryMealsPageState extends State<CategoryMealsPage> {
  String categoryId;
  String categoryTitle;
  List<Meal> categoryMeals;
  bool _loadedInitData = false;

  void _removeMeal(String mealId) {
    setState(() {
      categoryMeals.removeWhere((meal) => meal.id == mealId);
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!_loadedInitData) {
      final routeArgs =
          ModalRoute.of(context).settings.arguments as Map<String, String>;
      categoryTitle = routeArgs['title'];
      final categoryId = routeArgs['id'];
      categoryMeals = DUMMY_MEALS.where((meal) {
        return meal.categories.contains(categoryId);
      }).toList();
      _loadedInitData = true;
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          categoryTitle,
        ),
      ),
      body: Center(
        child: Container(
          child: ListView.builder(
            itemBuilder: (context, index) {
              final categoryMeal = categoryMeals.elementAt(index);
              return MealItem(
                removeItem: _removeMeal,
                id: categoryMeal.id,
                title: categoryMeal.title,
                affordability: categoryMeal.affordability,
                complexity: categoryMeal.complexity,
                duration: categoryMeal.duration,
                imageUrl: categoryMeal.imageUrl,
              );
            },
            itemCount: categoryMeals.length,
          ),
        ),
      ),
    );
  }
}
