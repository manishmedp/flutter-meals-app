// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

import '../models/meal.dart';
import '../screens/categories_screen.dart';
import '../screens/favorites_screen.dart';
import '../widgets/main_drawer.dart';

class TabsScreen extends StatefulWidget {
  static const routeName = "/tabs-screen";

  final List<Meal> favoriteMeals;

  TabsScreen(this.favoriteMeals);

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  List<Map<String, Object>> _pages;
  int _selectedPageIndex = 0;

  @override
  void initState() {
    super.initState();
    _pages = [
      {
        'page': CategoriesScreen(),
        'title': "Categories",
      },
      {'page': FavoritesScreen(widget.favoriteMeals), 'title': "Favorites"}
    ];
  }

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(_pages[_selectedPageIndex]['title'])),
      drawer: Drawer(
        child: MainDrawer(),
      ),
      body: _pages[_selectedPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
          onTap: _selectPage,
          backgroundColor: Theme.of(context).primaryColor,
          unselectedItemColor: Colors.white,
          selectedItemColor: Theme.of(context).accentColor,
          currentIndex: _selectedPageIndex,
          selectedFontSize: 12,
          unselectedFontSize: 12,
          // type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
                backgroundColor: Theme.of(context).primaryColor,
                icon: Icon(Icons.category),
                label: "Categories"),
            BottomNavigationBarItem(icon: Icon(Icons.star), label: "Favorites"),
          ]),
    );
  }
}
