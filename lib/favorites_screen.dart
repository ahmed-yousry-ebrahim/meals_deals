import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({super.key});

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  late final Box favorites;

  @override
  void initState() {
    super.initState();
    // Get reference to an already opened box
    favorites = Hive.box('favorites');
  }

  @override
  void dispose() {
    // Closes all Hive boxes
    Hive.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
