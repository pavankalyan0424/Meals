import 'package:flutter/material.dart';
import 'package:meals/models/meals.dart';
import 'package:meals/widgets/meal_item.dart';

class FavoritesPage extends StatelessWidget {
  final List<Meal> favoriteMeals;

  const FavoritesPage({@required this.favoriteMeals});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: favoriteMeals.isEmpty
            ? Text(
                'You have no favorites yet - start adding some!',
              )
            : ListView.builder(
                itemBuilder: (context, index) {
                  final categoryMeal = favoriteMeals.elementAt(index);
                  return MealItem(
                    id: categoryMeal.id,
                    title: categoryMeal.title,
                    affordability: categoryMeal.affordability,
                    complexity: categoryMeal.complexity,
                    duration: categoryMeal.duration,
                    imageUrl: categoryMeal.imageUrl,
                  );
                },
                itemCount: favoriteMeals.length,
              ),
      ),
    );
  }
}
