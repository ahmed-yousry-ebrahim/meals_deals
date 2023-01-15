import 'package:flutter/material.dart';
import './meal_item.dart';
import './dummy_data.dart';
import 'package:provider/provider.dart';
import 'providers/settings.dart';

class CategoryMealsScreen extends StatelessWidget {
  static const routeName = '/category-meals';

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)?.settings.arguments as Map<String, String>;
    final categoryTitle = routeArgs['title'];
    final categoryId = routeArgs['id'];
    final settings = Provider.of<Settings>(context);

    final categoryMelas = DUMMY_MEALS
        .where(
          (element) => ((element.categories.contains(categoryId)) &&
              (!settings.vegeterian ||
                  element.isVegetarian == settings.vegeterian) &&
              (!settings.vegan || element.isVegan == settings.vegan) &&
              (!settings.lactoseFree ||
                  element.isLactoseFree == settings.lactoseFree) &&
              (!settings.glutenFree ||
                  element.isGlutenFree == settings.glutenFree)),
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
