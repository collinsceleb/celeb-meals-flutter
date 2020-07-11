import 'package:celeb_meal/categories_screen.dart';
import 'package:flutter/material.dart';

void main() => runApp(CelebMeals());

class CelebMeals extends StatelessWidget {
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
          bodyText1: TextStyle(
            color: Color.fromARGB(20, 51, 51, 1)
          ),
          bodyText2: TextStyle(
              color: Color.fromARGB(20, 51, 51, 1)
          ),
          headline6: TextStyle(
            fontFamily: 'RoboCondensed',
            fontSize: 20,
            fontWeight: FontWeight.bold
          )
        )
      ),
      home: CategoriesScreen(),
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
