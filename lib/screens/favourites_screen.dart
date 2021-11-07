

import 'package:flutter/material.dart';
import 'package:meals_app/model/meal.dart';
import 'package:meals_app/providers/meal_provider.dart';
import 'package:meals_app/widgets/meal_item.dart';
import 'package:provider/provider.dart';

class FavouritesScreen extends StatelessWidget {



  @override
  Widget build(BuildContext context) {
    var isLandscape = MediaQuery.of(context).orientation == Orientation.landscape ? true : false;
    var width = MediaQuery.of(context).size.width;
    final List<Meal> _favouritesMeal = Provider.of<MealProvider>(context).favouriteMeals;
    if(_favouritesMeal.isEmpty){
      return Center(child: Text('You have no favourites yet - start adding some'),);
    }
    return GridView.builder(
      gridDelegate:SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: width <= 400 ? 400 : 500 ,
        childAspectRatio: isLandscape ? width/(width*.71) : width/(width*.715),
        crossAxisSpacing: 20,
        mainAxisSpacing: 20
    ),
      itemBuilder: (_, index) {
      var currentMeal = _favouritesMeal[index];
      return MealItem(imageUrl: currentMeal.imageUrl,
          affordability: currentMeal.affordability,
          complexity: currentMeal.complexity,
          title: currentMeal.title,
          id: currentMeal.id,

          duration: currentMeal.duration);
    }, itemCount: _favouritesMeal.length,);
  }
}
