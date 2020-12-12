import 'package:flutter/material.dart';
import 'package:meals/dummy_data.dart';

import '../widgets/meal_item.dart';

class CategoryMealsPage extends StatelessWidget {
  static const String routeName = '/category-meals';

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final String categoryId = routeArgs['id'];
    final String categoryTitle = routeArgs['title'];
    final categoryMeals = DUMMY_MEALS.where((meal) {
      return meal.categories.contains(categoryId);
    });
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
