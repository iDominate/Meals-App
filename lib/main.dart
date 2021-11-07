import 'package:flutter/material.dart';



import 'package:meals_app/providers/meal_provider.dart';
import 'package:meals_app/providers/theme_provider.dart';
import 'package:meals_app/screens/categories_screen.dart';
import 'package:meals_app/screens/category_meals_screen.dart';
import 'package:meals_app/screens/filters_screen.dart';
import 'package:meals_app/screens/meal_detail_screen.dart';
import 'package:meals_app/screens/tabs_screen.dart';
import 'package:meals_app/screens/theme_screen.dart';
import 'package:provider/provider.dart';

void main() {

  runApp(
      MultiProvider(providers:[ ChangeNotifierProvider<MealProvider>(
        create: (ctx) =>MealProvider(),

      ),
        ChangeNotifierProvider<ThemeProvider>(create:
        (_) => ThemeProvider()
        ),



      ], child: MyApp(),)
  );
}



class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    Provider.of<MealProvider>(context, listen: false).getFiltersFromSharedPrefs();
    Provider.of<MealProvider>(context, listen: false).retrieveFavouritesFromSharedPrefs();
    Provider.of<ThemeProvider>(context).getThemeModeFromSharedPrefs();
    Provider.of<ThemeProvider>(context).getColorsFromSharedPrefs();
    var primaryColor = Provider.of<ThemeProvider>(context).primaryColor;
    var accentColor = Provider.of<ThemeProvider>(context).accentColor;



    return MaterialApp(
      themeMode: Provider.of<ThemeProvider>(context).themeMode,
      title: 'Flutter Demo',

      darkTheme: ThemeData(

        unselectedWidgetColor: Colors.white,

        buttonColor: Colors.white70,
        cardColor: Color.fromRGBO(25, 34, 39, 1),
        shadowColor: Colors.white60,
        accentColor: accentColor,
        canvasColor: Color.fromRGBO(14, 22, 33, 1),
        textTheme: ThemeData.dark().textTheme.copyWith(
          headline1: TextStyle(
            color: Color.fromRGBO(20, 51, 51, 1)
          ),
          bodyText1: TextStyle(
              color: Colors.white60
          ),
          headline6: TextStyle(
            color: Colors.white60,
            fontSize: 24,
            fontFamily: 'RobotoCondensed',
              fontWeight: FontWeight.bold
          )
        ),
        // is not restarted.
        primarySwatch: primaryColor,
      ),

      theme: ThemeData(
        unselectedWidgetColor: Colors.black,

        buttonColor: Colors.white70,
        cardColor: Colors.white,
        shadowColor: Colors.white60,
        accentColor: accentColor,
        canvasColor: Color.fromRGBO(255, 254, 229,1),
        textTheme: ThemeData.light().textTheme.copyWith(
            
            bodyText1: TextStyle(
                color: Color.fromRGBO(20, 50, 50, 1)
            ),
            headline6: TextStyle(
                color: Colors.black,
                fontSize: 24,
                fontFamily: 'RobotoCondensed',
                fontWeight: FontWeight.bold
            )
        ),
        // is not restarted.
        primarySwatch: primaryColor,
      ),
      routes: {
        FiltersScreen.id:(_) => FiltersScreen(),
        TabsScreen.id: (_) => TabsScreen(),
        CategoriesScreen.id: (_) => CategoriesScreen(),
        CategoryMealsScreen.id: (_) => CategoryMealsScreen(),
        MealDetailScreen.id: (_) => MealDetailScreen(),
        ThemeScreen.id: (_) => ThemeScreen(),
      },

    );
  }
}




