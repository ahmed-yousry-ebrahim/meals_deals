import 'package:flutter/material.dart';

class Settings with ChangeNotifier {
  bool _vegeterian = false;
  bool _vegan = false;
  bool _lactoseFree = false;
  bool _glutenFree = false;

  bool get vegeterian {
    return _vegeterian;
  }

  bool get vegan {
    return _vegan;
  }

  bool get lactoseFree {
    return _lactoseFree;
  }

  bool get glutenFree {
    return _glutenFree;
  }

  void toggleVegeterian() {
    _vegeterian = !(_vegeterian);
    notifyListeners();
  }

  void toggleVegan() {
    _vegan = !(_vegan);
    notifyListeners();
  }

  void toggleLactoseFree() {
    _lactoseFree = !(_lactoseFree);
    notifyListeners();
  }

  void toggleGlutenFree() {
    _glutenFree = !(_glutenFree);
    notifyListeners();
  }
}
