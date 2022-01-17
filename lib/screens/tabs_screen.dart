import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meal_app_udemy/models/meal.dart';
import 'package:meal_app_udemy/screens/categories_screen.dart';
import 'package:meal_app_udemy/widgets/main_drawer.dart';

import 'favorites.dart';

class TabsScreen extends StatefulWidget {
  static final routeName = "/TabsScreen";
  final List<Meal> favoriteMeals;

  TabsScreen(this.favoriteMeals);

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _selectedPage = 0;

  void _selectPage(int index) {
    setState(() {
      _selectedPage = index;
    });
  }

  List<Map<String, Object>> _pages;

  @override
  void initState() {
    _pages = [
      {"page": CategoriesScreen(), "title": "Categories"},
      {"page": Favorites(widget.favoriteMeals), "title": "Favorites"},
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(_pages[_selectedPage]['title'])),
      body: _pages[_selectedPage]['page'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        currentIndex: _selectedPage,
        backgroundColor: Theme.of(context).primaryColor,
        selectedItemColor: Theme.of(context).accentColor,
        unselectedItemColor: Colors.white,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.category), title: Text("Categories")),
          BottomNavigationBarItem(
              icon: Icon(Icons.star), title: Text("Favorites"))
        ],
      ),
      drawer: MainDrawer(),
    );
  }
}
