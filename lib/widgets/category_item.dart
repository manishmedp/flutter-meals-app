import 'package:flutter/material.dart';

import '../screens/category_meals_screen.dart';

class CategoryItem extends StatelessWidget {
  final String id;
  final String title;
  final Color color;

  CategoryItem(this.id, this.title, this.color);

  void _selectCategory(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(CategoryMealsScreen.routeName,
        arguments: {'id': id, 'title': title, 'color': color});
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _selectCategory(context),
      // splashColor: Theme.of(context).primaryColor,
      splashColor: Colors.black,
      // borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: const EdgeInsets.all(15),
        margin: const EdgeInsets.symmetric(horizontal: 8),
        child: Text(
          this.title,
          style: Theme.of(context).textTheme.headline6,
        ),
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [color.withOpacity(0.5), color],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight),
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey[350],
                  offset: const Offset(5.0, 5.0),
                  blurRadius: 10.0,
                  spreadRadius: 1.0),
              BoxShadow(
                  color: Colors.grey[350],
                  offset: const Offset(-5.0, 5.0),
                  blurRadius: 10.0,
                  spreadRadius: 1.0)
            ]),
      ),
    );
  }
}
