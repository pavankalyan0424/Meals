import 'package:flutter/material.dart';

class CategoryMealsPage extends StatelessWidget {
  static const  String routeName = '/category-meals';
  // final String categoryId;
  // final String categoryTitle;
  //
  // const CategoryMealsPage({this.categoryId, this.categoryTitle});
  @override
  Widget build(BuildContext context) {
    final routeArgs = ModalRoute.of(context).settings.arguments as Map<String, String>;
    final String categoryId = routeArgs['id'];
    final String categoryTitle = routeArgs['title'];
    return Scaffold(
      appBar: AppBar(
        title: Text(
          categoryTitle,
        ),
      ),
      body: Center(
        child: Container(
          child: Text(
            'The Recipes for category!',
          ),
        ),
      ),
    );
  }
}
