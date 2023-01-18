import 'package:flutter/material.dart';
import './models/meal.dart';
import 'package:hive/hive.dart';

class MealDetailsScreen extends StatefulWidget {
  const MealDetailsScreen({super.key});
  static const routeName = '/meal-details';

  @override
  State<MealDetailsScreen> createState() => _MealDetailsScreenState();
}

class _MealDetailsScreenState extends State<MealDetailsScreen> {
  late Meal meal;
  Box? _favorites;
  bool _isFavorite = false;
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

  void toggleFavorite() {
    if (_isFavorite) {
      _favorites?.delete(meal.id);
      setState(() {
        _isFavorite = false;
      });
    } else {
      _favorites?.put(meal.id, meal.toJson());
      setState(() {
        _isFavorite = true;
      });
    }
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
              meal = ModalRoute.of(context)?.settings.arguments as Meal;
              _isFavorite = _favorites?.get(meal.id) != null ? true : false;

              return Scaffold(
                appBar: AppBar(
                  title: Text(meal.title),
                  actions: [
                    IconButton(
                        icon: _isFavorite
                            ? Icon(Icons.bookmark_added)
                            : Icon(Icons.bookmark_add),
                        tooltip: 'Add to favorites',
                        onPressed: toggleFavorite),
                  ],
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
                          padding: EdgeInsets.symmetric(
                              vertical: 20, horizontal: 10),
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
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
                                Padding(
                                  padding: EdgeInsets.symmetric(vertical: 5),
                                  child: Text(
                                    'Ingredients: ',
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                ),
                                ...meal.ingredients
                                    .map((ingredient) => Text(
                                          ingredient,
                                        ))
                                    .toList(),
                                Padding(
                                  padding: EdgeInsets.symmetric(vertical: 5),
                                  child: Text(
                                    'Steps: ',
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                ),
                                ...meal.steps
                                    .map((step) => Text(
                                          step,
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
        });
  }
}
