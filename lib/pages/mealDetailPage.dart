import 'package:flutter/material.dart';

class MealDetailPage extends StatelessWidget {
  static const routeName = '/meal-detail';

  @override
  Widget build(BuildContext context) {
    final String mealId = ModalRoute.of(context).settings.arguments as String;
    return Scaffold(
      body: Container(child: Text(mealId,),),
    );
  }
}
