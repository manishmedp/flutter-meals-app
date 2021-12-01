import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/screens/categories_screen.dart';
import 'package:flutter_complete_guide/screens/favorites_screen.dart';

class TabsScreen extends StatefulWidget {
  static const routeName = "/tabs-screen";

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        initialIndex: 0,
        child: Scaffold(
          appBar: AppBar(
              title: Text("Meals"),
              bottom: TabBar(tabs: [
                Tab(
                  icon: Icon(Icons.category),
                  text: "Categories",
                ),
                Tab(
                  icon: Icon(Icons.star),
                  text: "Favorite",
                )
              ])),
          body: TabBarView(children: [CategoriesScreen(), FavoritesScreen()]),
        ));
  }
}
