import 'package:flutter/material.dart';

import '../dummy_data.dart';
import '../widgets/category_item.dart';

class CategoriesScreen extends StatelessWidget {
  // const CategoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
        // appBar: AppBar(title: const Text("DeliMeal")),
        GridView(
            padding: const EdgeInsets.all(10),
            children: DUMMY_CATEGORIES.map((catData) {
              return CategoryItem(catData.id, catData.title, catData.color);
            }).toList(),
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200,
                childAspectRatio: 3 / 2,
                mainAxisSpacing: 20));
  }
}
