import 'package:flutter/material.dart';
import 'package:meals/widgets/mainDrawer.dart';

class FiltersPage extends StatelessWidget {
  static const String routeName = '/filters';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MainDrawer(),
      appBar: AppBar(
        title: Text(
          'Your Filters',
        ),
      ),
      body: Container(),
    );
  }
}
