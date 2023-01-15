import 'package:flutter/material.dart';
import './main_drawer.dart';
import './providers/settings.dart';
import 'package:provider/provider.dart';

class SettingsScreen extends StatefulWidget {
  static const routeName = '/settings';

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    final settings = Provider.of<Settings>(context);

    bool _vegeterian = settings.vegeterian;
    bool _vegan = settings.vegan;
    bool _lactoseFree = settings.lactoseFree;
    bool _glutenFree = settings.glutenFree;

    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      drawer: MainDrawer(),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 8.0,
            ),
            child: Text(
              'Adjust your meal selection',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
              child: ListView(
            children: [
              SwitchListTile(
                  value: _vegeterian,
                  title: Text('Vegeterian'),
                  subtitle: Text('Only vegeterian dishes!'),
                  secondary: Icon(Icons.energy_savings_leaf_outlined),
                  onChanged: ((value) => {
                        setState(
                          () {
                            _vegeterian = value;
                            settings.toggleVegeterian();
                          },
                        )
                      })),
              SwitchListTile(
                  value: _vegan,
                  title: Text('Vegan'),
                  subtitle: Text('Only vegan dishes!'),
                  secondary: Icon(Icons.face_outlined),
                  onChanged: ((value) => {
                        setState(
                          () {
                            _vegan = value;
                            settings.toggleVegan();
                          },
                        )
                      })),
              SwitchListTile(
                  value: _lactoseFree,
                  title: Text('Loactose free'),
                  subtitle: Text('Only lactose-free dishes!'),
                  secondary: Icon(Icons.fastfood_outlined),
                  onChanged: ((value) => {
                        setState(
                          () {
                            _lactoseFree = value;
                            settings.toggleLactoseFree();
                          },
                        )
                      })),
              SwitchListTile(
                  value: _glutenFree,
                  title: Text('Gluten free'),
                  subtitle: Text('Only gluten-free dishes!'),
                  secondary: Icon(Icons.breakfast_dining_outlined),
                  onChanged: ((value) => {
                        setState(
                          () {
                            _glutenFree = value;
                            settings.toggleGlutenFree();
                          },
                        )
                      })),
            ],
          ))
        ]),
      ),
    );
  }
}
