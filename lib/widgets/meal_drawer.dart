import 'package:celeb_meal/screens/filter_screen.dart';
import 'package:flutter/material.dart';

class MealDrawer extends StatelessWidget {
  Widget buildDrawerList(
      BuildContext context, String text, IconData icon, Function tapHandler) {
    return ListTile(
      leading: Icon(icon),
      title: Text(
        text,
        style: TextStyle(
            fontFamily: "RobotoCondensed",
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Theme.of(context).primaryColor),
      ),
      onTap: tapHandler,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            height: 120,
            width: double.infinity,
            padding: EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            color: Theme.of(context).primaryColor,
            child: Text(
              "Cooking Up!",
              style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 30,
                  color: Theme.of(context).canvasColor),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          buildDrawerList(context, "Meals", Icons.restaurant, () {
            Navigator.of(context).pushReplacementNamed("/");
          }),
          buildDrawerList(context, "Filters", Icons.settings, () {
            Navigator.of(context).pushReplacementNamed(FilterScreen.filterRouteName);
          })
        ],
      ),
    );
  }
}
