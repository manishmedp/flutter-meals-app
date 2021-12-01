import 'package:flutter/material.dart';

import '../models/meal.dart';
import '../widgets/meal_item.dart';

class CategoryMealsScreen extends StatefulWidget {
  static const routeName = '/category-meals';
  final List<Meal> availableMeals;

  CategoryMealsScreen(this.availableMeals);

  @override
  _CategoryMealsScreenState createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  String categoryTitle;
  List<Meal> displayMeals;
  bool _loadedInitData = false;
  Color categoryColor;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (!_loadedInitData) {
      final routeArgs =
          ModalRoute.of(context).settings.arguments as Map<String, Object>;
      categoryTitle = routeArgs['title'];
      final categoryId = routeArgs['id'];
      categoryColor = routeArgs['color'];
      displayMeals = widget.availableMeals.where((meal) {
        return meal.categories.contains(categoryId);
      }).toList();
      _loadedInitData = true;
    }

    super.didChangeDependencies();
  }

  void _removeMeal(String mealId) {
    setState(() {
      displayMeals.removeWhere((meal) => meal.id == mealId);
    });
  }

  @override
  Widget build(BuildContext context) {
    //  final categoryId = routeArgs['id'];

    return Scaffold(
        appBar: AppBar(
          title: Text(categoryTitle),
          backgroundColor: categoryColor,
        ),
        body: ListView.builder(
          itemBuilder: (ctx, index) {
            return MealItem(
              id: displayMeals[index].id,
              title: displayMeals[index].title,
              affordability: displayMeals[index].affordability,
              complexity: displayMeals[index].complexity,
              duration: displayMeals[index].duration,
              imageUrl: displayMeals[index].imageUrl,
              // removeItem: () => _removeMeal(displayMeals[index].id),
              // removeItem: _removeMeal,
            );
          },
          itemCount: displayMeals.length,
        ));
  }
}
