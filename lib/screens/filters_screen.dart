import 'package:flutter/material.dart';

import 'package:meal_app_screens/widgets/main_drawer.dart';

class FilterScreen extends StatefulWidget {
  final Function setFilters;
  FilterScreen(this.setFilters);
  // ignore: empty_constructor_bodies
  static const routeName = 'favoriteScreen';

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  Widget _builSwitchListTile(
      {required bool currentBool,
      required String title,
      required String subtitle,
      required onHander}) {
    return SwitchListTile(
      title: Text(title),
      subtitle: Text(subtitle),
      value: currentBool,
      onChanged: onHander,
    );
  }

  bool _isGluteenFree = false;
  bool _IsLactose = false;
  bool _isVegan = false;
  bool _isVegeterian = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              Map<String, bool> filters = {
                'gluten': _isGluteenFree,
                'lactose': _IsLactose,
                'vegan': _isVegan,
                'vegeterian': _isVegeterian,
              };
              widget.setFilters(filters);
            },
            icon: Icon(Icons.save),
          ),
        ],
        title: Text(
          'Filter Screen',
        ),
      ),
      drawer: Drawer(child: MainDrawer()),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            // alignment: Alignment.center,
            child: Text('Adjust Your Meal Selectin',
                style: Theme.of(context).textTheme.titleLarge),
          ),
          Expanded(
            child: ListView(
              children: [
                _builSwitchListTile(
                  currentBool: _isGluteenFree,
                  title: 'IsGluteen Free',
                  subtitle: 'Only Include Is Gluteen Free',
                  onHander: (newValue) {
                    setState(() {
                      _isGluteenFree = newValue;
                    });
                  },
                ),
                _builSwitchListTile(
                  currentBool: _IsLactose,
                  title: 'IsLactose Free',
                  subtitle: 'Only Include Is Lactose Free',
                  onHander: (newValue) {
                    setState(() {
                      _IsLactose = newValue;
                    });
                  },
                ),
                _builSwitchListTile(
                  currentBool: _isVegan,
                  title: 'Vegan Free',
                  subtitle: 'Only Include Is Vegan Free',
                  onHander: (newValue) {
                    setState(() {
                      _isVegan = newValue;
                    });
                  },
                ),
                _builSwitchListTile(
                  currentBool: _isVegeterian,
                  title: 'Vegeterian Free',
                  subtitle: 'Only Include Is Vegeterian Free',
                  onHander: (newValue) {
                    setState(() {
                      _isVegeterian = newValue;
                    });
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
