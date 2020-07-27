import 'package:celeb_meal/models/meal.dart';
import 'package:celeb_meal/widgets/meal_item.dart';
import 'package:flutter/material.dart';


class CategoryMealsScreen extends StatefulWidget {
  static const mealScreenRouteName = '/category-meals';

  final List<Meal> _availableMeals;

  CategoryMealsScreen(this._availableMeals);

  @override
  _CategoryMealsScreenState createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {

  String categoryTitle;
  List<Meal> displayedMeals;
  var _loadedInitData = false;

//  @override
//  void initState() {
//
//    super.initState();
//  }

  @override
  void didChangeDependencies() {
    if (!_loadedInitData) {
      final routeArguments =
      ModalRoute.of(context).settings.arguments as Map<String, String>;
      categoryTitle = routeArguments['title'];
      final categoryId = routeArguments['id'];
      displayedMeals = widget._availableMeals.where((meal) {
        return meal.categories.contains(categoryId);
      }).toList();
      _loadedInitData = true;
    }
    super.didChangeDependencies();
  }

  void _removeItem(String mealId) {
    setState(() {
      displayedMeals.removeWhere((meal) => meal.id == mealId);
    });
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return MealItem(
            id: displayedMeals[index].id,
            title: displayedMeals[index].title,
            imageUrl: displayedMeals[index].imageUrl,
            duration: displayedMeals[index].duration,
            affordability: displayedMeals[index].affordability,
            complexity: displayedMeals[index].complexity,
            removeItem: _removeItem,
          );
        },
        itemCount: displayedMeals.length,
      ),
    );
  }


}
