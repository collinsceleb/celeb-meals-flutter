import 'package:celeb_meal/widgets/meal_drawer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FilterScreen extends StatefulWidget {
  static const filterRouteName = "/filters";

  final Function saveFilters;

  final Map<String, bool> currentFilters;

  FilterScreen(this.currentFilters, this.saveFilters);

  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  var _glutenFree = false;
  var _lactoseFree = false;
  var _vegan = false;
  var _vegetarian = false;


  @override
  void initState() {
    _glutenFree = widget.currentFilters['gluten'];
    _lactoseFree = widget.currentFilters['lactose'];
    _vegan = widget.currentFilters['vegan'];
    _vegetarian = widget.currentFilters['vegetarian'];
    super.initState();
  }

  Widget _buildFilterSwitchTile(String title, String description,
      bool currentValue, Function updateValue) {
    return SwitchListTile(
      title: Text(title),
      value: currentValue,
      onChanged: updateValue,
      subtitle: Text(description),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Your Filters"),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.save),
              onPressed: () {
                final selectedFilters = {
                  'gluten': _glutenFree,
                  'lactose': _lactoseFree,
                  'vegan': _vegan,
                  'vegetarian': _vegetarian
                };
                widget.saveFilters(selectedFilters);
              })
        ],
      ),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              "Adjust your meal selection.",
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          Expanded(
              child: ListView(
            children: <Widget>[
              _buildFilterSwitchTile(
                "Gluten-free",
                "Only include gluten-free meals.",
                _glutenFree,
                (newValue) {
                  setState(
                    () {
                      _glutenFree = newValue;
                    },
                  );
                },
              ),
              _buildFilterSwitchTile(
                "Vegetarian",
                "Only include vegetarian meals.",
                _vegetarian,
                (newValue) {
                  setState(
                    () {
                      _vegetarian = newValue;
                    },
                  );
                },
              ),
              _buildFilterSwitchTile(
                "Vegan",
                "Only include vegan meals.",
                _vegan,
                (newValue) {
                  setState(
                    () {
                      _vegan = newValue;
                    },
                  );
                },
              ),
              _buildFilterSwitchTile(
                "Lactose-free",
                "Only include lactose-free meals.",
                _lactoseFree,
                (newValue) {
                  setState(
                    () {
                      _lactoseFree = newValue;
                    },
                  );
                },
              ),
            ],
          ))
        ],
      ),
      drawer: MealDrawer(),
    );
  }
}
