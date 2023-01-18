import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import './meal_item.dart';
import './models/meal.dart';

class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({super.key});

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  Box? _favorites;
  late Future _boxLoadFuture;

  Future _openBox() async {
    _favorites = await Hive.openBox('favorites');
    return;
  }

  @override
  void initState() {
    super.initState();
    _boxLoadFuture = _openBox();
  }

  @override
  void dispose() {
    // Closes all Hive boxes
    Hive.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _boxLoadFuture,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            // while waiting for `Hive.openBox()` to finish
            return const CircularProgressIndicator();
          } else {
            if (snapshot.hasError) {
              // if `Hive.openBox()` threw an error
              return Center(child: Text('Error:\n\n ${snapshot.error}'));
            } else {
              return ListView.builder(
                itemBuilder: (context, index) {
                  return MealItem(Meal.fromJson(_favorites?.getAt(index)));
                },
                itemCount: _favorites?.length,
              );
            }
          }
        });
  }
}
