import 'package:flutter/material.dart';
import 'package:meals_app/model/meal.dart';
import 'package:meals_app/providers/meal_provider.dart';
import 'package:meals_app/screens/categories_screen.dart';
import 'package:meals_app/screens/favourites_screen.dart';
import 'package:meals_app/widgets/main_drawer.dart';
import 'package:provider/provider.dart';

class TabsScreen extends StatefulWidget {
  static const id = '/';





  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();



    _pages = [
      {
        'page': CategoriesScreen(),
        'title': 'Categories'
      },
      {
        'page': FavouritesScreen(),
        'title': 'Favourites'
      }
    ];

  }
  late List<Map<String, dynamic>> _pages;


  int _selectedPageIndex = 0;
  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[_selectedPageIndex]['title']),
      ),
      drawer: MainDrawer(),

      body: _pages[_selectedPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedPageIndex,
        selectedItemColor: Theme.of(context).accentColor,
        unselectedItemColor: Colors.white,
        onTap: (index){
          setState(() {
            _selectedPageIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.category), label: 'Categories'),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Favourites'),
        ],
        backgroundColor: Theme.of(context).primaryColor,
      ),
    );
  }
}
