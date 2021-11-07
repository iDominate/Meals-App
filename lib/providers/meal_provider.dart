import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meals_app/model/category.dart';
import 'package:meals_app/model/dummy_data.dart';
import 'package:meals_app/model/meal.dart';
import 'package:shared_preferences/shared_preferences.dart' ;

class MealProvider with ChangeNotifier{

  List<Meal> favouriteMeals = [];

  List<Category> availableCategories = DUMMY_CATEGORIES;





  List<String> prefsId = [];


  void toggleFavourites(String mealId) async{
    final existingIndex = favouriteMeals.indexWhere((element) => element.id == mealId);

    if(existingIndex>=0){


        favouriteMeals.removeAt(existingIndex);
        prefsId.removeWhere((element) => element == mealId);

    } else{

        favouriteMeals.add(DUMMY_MEALS.firstWhere((element) => element.id == mealId));
        prefsId.add(mealId);

    }
    var sharedPrefs = await SharedPreferences.getInstance();





    notifyListeners();

    sharedPrefs.setStringList("favs", prefsId);
    for(int i = 0; i < prefsId.length; i++){

    }
  }

  void setFilters() async {

    var sharedPrefs = await SharedPreferences.getInstance();






      availableMeals = DUMMY_MEALS.where((element) {
        if(filters['gluten'] == true && !element.isGlutenFree){
          return false;
        } else if(filters['lactose'] == true  && !element.isLactoseFree){
          return false;
        } else if(filters['vegan'] == true && !element.isVegan){
          return false;
        } else if(filters['vegetarian'] == true && !element.isVegetarian){
          return false;
        }
        return true;
      }).cast<Meal>().toList();

      List<Category> ac = [];

      availableMeals.forEach((meal) {meal.categories.forEach((cat) {
        DUMMY_CATEGORIES.forEach((catId) {
          
              if(cat == catId.id){
                if(!ac.any((element) => element.id == cat)) ac.add(catId);
              }



        });
      });});
    filters.forEach((key, value) {print("$key -> $value");});

      sharedPrefs.setBool('gluten', filters['gluten']!);
      sharedPrefs.setBool('lactose', filters['lactose']!);
      sharedPrefs.setBool('vegetarian', filters['vegetarian']!);
      sharedPrefs.setBool('vegan', filters['vegan']!);

    availableCategories = ac;
    notifyListeners();

  }


  Future<void> getFiltersFromSharedPrefs() async{

    var sharedPrefs = await SharedPreferences.getInstance();
   
    filters ={
      'gluten': sharedPrefs.getBool('gluten') ?? false,
      'lactose':  sharedPrefs.getBool('lactose') ?? false,
      'vegan':  sharedPrefs.getBool('vegan') ?? false,
      'vegetarian':  sharedPrefs.getBool('vegetarian') ?? false
    };


    notifyListeners();
  }

  List<Meal> availableMeals = DUMMY_MEALS;
  Map<String, bool> filters = {

  };

  retrieveFavouritesFromSharedPrefs() async{
    var sharedPrefs = await SharedPreferences.getInstance();
    prefsId  = sharedPrefs.getStringList("favs")?? List.empty();
    for(int i = 0; i < prefsId.length && prefsId.isNotEmpty; i++)
      {
        favouriteMeals.add(availableMeals.firstWhere((element) => element.id == prefsId[i]));

      }

    notifyListeners();



  }

}

