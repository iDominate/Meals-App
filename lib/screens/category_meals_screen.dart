import 'package:flutter/material.dart';

import 'package:meals_app/model/meal.dart';
import 'package:meals_app/providers/meal_provider.dart';
import 'package:meals_app/widgets/meal_item.dart';
import 'package:provider/provider.dart';

class CategoryMealsScreen extends StatefulWidget {
  static const id = '/categoryMeals';





  @override
  _CategoryMealsScreenState createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
 late String _categoryId, _categoryTitle;
 late List<Meal> _categoryMeals;
 late Map<String, dynamic> _args;

 @override
  void didChangeDependencies() {
   List<Meal> meals = Provider.of<MealProvider>(context).availableMeals;

    super.didChangeDependencies();
    _args = ModalRoute
        .of(context)!
        .settings
        .arguments as Map<String, dynamic>;
    _categoryId = _args['id'];
    _categoryTitle = _args['title'];
    _categoryMeals = meals.where((element) =>
        element.categories.contains(_categoryId)).toList();
  }



  @override
  Widget build(BuildContext context) {

   var width = MediaQuery.of(context).size.width;
   var isLandscape = MediaQuery.of(context).orientation == Orientation.landscape ? true : false;




    return Scaffold(
      appBar: AppBar(

        title: Text(_categoryTitle),
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: width <= 400 ? 400 : 500 ,
            childAspectRatio: isLandscape ? width/(width*.71) : width/(width*.715),
            crossAxisSpacing: 20,
            mainAxisSpacing: 20
        ),
        itemBuilder: (_, index) {
        var currentMeal = _categoryMeals[index];

        return MealItem(imageUrl: currentMeal.imageUrl,
            affordability: currentMeal.affordability,
            complexity: currentMeal.complexity,
            title: currentMeal.title,
            id: currentMeal.id,
            removeItem: _removeItem,
            duration: currentMeal.duration);
      }, itemCount: _categoryMeals.length,));





  }

  void _removeItem(id){
    setState(() {
      _categoryMeals.removeWhere((element) => element.id == id);
    });
  }
}

