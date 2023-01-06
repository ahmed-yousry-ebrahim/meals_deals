import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import './models/meal.dart';

class MealDetailsScreen extends StatelessWidget {
  const MealDetailsScreen({super.key});
  static const routeName = '/meal-details';

  @override
  Widget build(BuildContext context) {
    final meal = ModalRoute.of(context)?.settings.arguments as Meal;

    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
      ),
      body: Text(meal.title),
    );
  }
}
