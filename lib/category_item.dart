import 'package:celeb_meal/category_meals_screen.dart';
import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  final String title;
  final Color color;

  CategoryItem(this.title, this.color);

  void selectCategory(BuildContext buildContext) {
    Navigator.of(buildContext).push(MaterialPageRoute(builder: (_) {
      return CategoryMealsScreen();
    },),);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectCategory(context),
      splashColor: Theme
          .of(context)
          .primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Text(title, style: Theme
            .of(context)
            .textTheme
            .headline6,),
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [
                  color.withOpacity(0.7),
                  color,
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomLeft
            ),
            borderRadius: BorderRadius.circular(15)
        ),
      ),
    );
  }
}
