import 'package:flutter/material.dart';
import './meal_item.dart';
import './dummy_data.dart';

class CategoryMealsScreen extends StatelessWidget {
  static const routeName = '/category-meals';

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)?.settings.arguments as Map<String, String>;
    final categoryTitle = routeArgs['title'];
    final categoryId = routeArgs['id'];

    final categoryMelas = DUMMY_MEALS
        .where(
          (element) => element.categories.contains(categoryId),
        )
        .toList();
    return Scaffold(
      appBar: AppBar(
        title: Text('Recipes'),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return MealItem(categoryMelas[index]);
        },
        itemCount: categoryMelas.length,
      ),
    );
  }
}
