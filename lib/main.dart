import 'package:celeb_meal/data/dummy_data.dart';
import 'package:celeb_meal/models/meal.dart';
import 'package:celeb_meal/screens/bottom_navigation_screen.dart';
import 'package:celeb_meal/screens/filter_screen.dart';

import './screens/meal_detail_screen.dart';

import './screens/categories_screen.dart';
import './screens/category_meals_screen.dart';
import 'package:flutter/material.dart';

void main() => runApp(CelebMeals());

class CelebMeals extends StatefulWidget {
  @override
  _CelebMealsState createState() => _CelebMealsState();
}

class _CelebMealsState extends State<CelebMeals> {
  Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false
  };
  List<Meal> _availableMeals = DUMMY_MEALS;

  void _setFilters(Map<String, bool> filterData) {
    setState(() {
      _filters = filterData;

      _availableMeals = DUMMY_MEALS.where((meal) {
        if(_filters['gluten'] && !meal.isGlutenFree) {
          return false;
        }
        if (_filters['lactose'] && !meal.isLactoseFree) {
          return false;
        }
        if (_filters['vegan'] && !meal.isVegan) {
          return false;
        }
        if (_filters['vegetarian'] && !meal.isVegetarian) {
          return false;
        }
        return true;
      }).toList();
    });
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Celeb Meals',
      theme: ThemeData(
          primarySwatch: Colors.pink,
          accentColor: Colors.amber,
          canvasColor: Color.fromARGB(255, 254, 229, 1),
          fontFamily: 'Raleway',
          textTheme: ThemeData.light().textTheme.copyWith(
              bodyText1: TextStyle(color: Color.fromARGB(20, 51, 51, 1)),
//              bodyText2: TextStyle(color: Color.fromARGB(20, 51, 51, 1)),
              headline6: TextStyle(
                  fontFamily: 'RobotoCondensed',
                  fontSize: 20,
                  fontWeight: FontWeight.bold))),
//      home: CategoriesScreen(),
      initialRoute: '/',
      // default is '/'
      routes: {
//        '/': (context) => TabsScreen(), // Top Navigation
        '/': (context) => BottomNavigationScreen(), // Bottom Navigation
        CategoryMealsScreen.mealScreenRouteName: (context) =>
            CategoryMealsScreen(_availableMeals),
        MealDetailScreen.mealDetailRouteName: (context) => MealDetailScreen(),
        FilterScreen.filterRouteName: (context) => FilterScreen(_filters, _setFilters)
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (context) => CategoriesScreen());
      },
    );
  }
}

class CelebMealsHomePage extends StatefulWidget {
  @override
  _CelebMealsHomePageState createState() => _CelebMealsHomePageState();
}

class _CelebMealsHomePageState extends State<CelebMealsHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Celeb Meals'),
      ),
      body: Center(
        child: Text('Navigation Time!'),
      ),
    );
  }
}
