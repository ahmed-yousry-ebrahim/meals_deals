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
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(10),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.network(
                meal.imageUrl,
                height: 250,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(30),
                        topLeft: Radius.circular(30))),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                            children: [
                              Icon(
                                Icons.access_alarm_rounded,
                                color: Colors.redAccent,
                              ),
                              Text('${meal.duration} min'),
                            ],
                          ),
                          Column(
                            children: [
                              Icon(
                                Icons.work_rounded,
                                color: Colors.redAccent,
                              ),
                              Text(meal.complexityText),
                            ],
                          )
                        ],
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 15),
                        child: Text(
                          meal.title,
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Text(
                        'Ingredients: ',
                        style: TextStyle(color: Colors.grey),
                      ),
                      ...meal.ingredients
                          .map((ingredient) => Text(
                                ingredient,
                              ))
                          .toList(),
                    ]),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
