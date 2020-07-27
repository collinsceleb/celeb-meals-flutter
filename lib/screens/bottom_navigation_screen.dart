import 'package:celeb_meal/screens/categories_screen.dart';
import 'package:celeb_meal/screens/favorites_screen.dart';
import 'package:celeb_meal/widgets/meal_drawer.dart';
import 'package:flutter/material.dart';

class BottomNavigationScreen extends StatefulWidget {
  @override
  _BottomNavigationScreenState createState() => _BottomNavigationScreenState();
}

class _BottomNavigationScreenState extends State<BottomNavigationScreen> {
  final List<Map<String, Object>> _pages = [
    {'page': CategoriesScreen(), 'title': "Categories"},
    {'page': FavouritesScreen(), 'title': "Your Favorites"}
  ];
  int _selectedPageIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[_selectedPageIndex]['title']),
      ),
      drawer: MealDrawer(),
      body: _pages[_selectedPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
          onTap: _selectPage,
          backgroundColor: Theme.of(context).primaryColor,
          unselectedItemColor: Colors.white,
          selectedItemColor: Theme.of(context).accentColor,
          currentIndex: _selectedPageIndex,
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.category), title: Text("Categories")),
            BottomNavigationBarItem(
                icon: Icon(Icons.star), title: Text("Favorites"))
          ]),
    );
  }
}
