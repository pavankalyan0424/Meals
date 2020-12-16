import 'package:flutter/material.dart';
import 'package:meals/models/meals.dart';
import 'package:meals/widgets/mainDrawer.dart';

import 'categoriesPage.dart';
import 'favoritesPage.dart';

class MyHomePage extends StatefulWidget {
  final List<Meal> favoriteMeals;

  const MyHomePage({@required this.favoriteMeals});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;
  List<Map<String, Object>> _pages = [];

  @override
  void initState() {
    super.initState();
    _pages = [
      {'page': CategoriesPage(), 'title': 'Categories'},
      {
        'page': FavoritesPage(favoriteMeals: widget.favoriteMeals),
        'title': 'Favorites'
      },
    ];
  }

  void _selectedPage(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MainDrawer(),
      appBar: AppBar(
        title: Text(
          _pages[_selectedIndex]['title'],
        ),
      ),
      body: _pages[_selectedIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).primaryColor,
        onTap: _selectedPage,
        currentIndex: _selectedIndex,
        selectedItemColor: Theme.of(context).accentColor,
        unselectedItemColor: Colors.white,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.category,
            ),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.star,
            ),
            label: 'Favorites',
          ),
        ],
      ),
    );
  }
}
