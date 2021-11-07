import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:meals_app/model/dummy_data.dart';
import 'package:meals_app/providers/meal_provider.dart';
import 'package:provider/provider.dart';

class MealDetailScreen extends StatelessWidget {
  static const id = '/detail';






  @override
  Widget build(BuildContext context) {

    var width = MediaQuery.of(context).size.width;
    var isLandscape = MediaQuery.of(context).orientation == Orientation.landscape ? true : false;
    final accentColor = Theme.of(context).accentColor;


    final mealId = ModalRoute.of(context)!.settings.arguments as String;
    final selectedMeal = DUMMY_MEALS.firstWhere((element) => element.id.contains(mealId));

    var liSteps = ListView.builder(itemBuilder: (_, index){
      return Card(
        color: accentColor,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
          child: Text(selectedMeal.ingredients[index], style: TextStyle(color: useWhiteForeground( accentColor) ? Colors.white : Colors.black),),
        ),
      );
    }, itemCount: selectedMeal.ingredients.length,);
    var ingradient = ListView.builder(itemBuilder: (_, index){
      return Card(
        color: accentColor,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
          child: Text(selectedMeal.ingredients[index], style: TextStyle(color: useWhiteForeground( accentColor) ? Colors.white : Colors.black),),
        ),
      );
    }, itemCount: selectedMeal.ingredients.length,);
    return Scaffold(
      appBar: AppBar(
        title: Text(selectedMeal.title                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   ,),
      ),
      body: ListView(

        children: [
          Container(
            height: 200,
            width: double.infinity,
            child: Image.network(selectedMeal.imageUrl, fit: BoxFit.cover,),
          ),
         isLandscape ? Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  showSectionText(context, 'Ingredients'),
                  showContainer(ingradient),
                ],
              ),
              Column(
                children: [
                  showSectionText(context, 'Steps'),
                  showContainer(liSteps),
                ],
              )
            ],
          ) : showSectionText(context, 'Ingredients'),
      showContainer(ingradient),
          showSectionText(context, 'Steps'),
          showContainer(liSteps),



        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Provider.of<MealProvider>(context).favouriteMeals.any((element) => element.id == mealId) ? Icons.star : Icons.star_border),
        onPressed: () => Provider.of<MealProvider>(context, listen: false).toggleFavourites(mealId),
      ),
    );
  }
  
}

Widget showSectionText(BuildContext context, String string){
  return Container(
    alignment: Alignment.center,
    margin: EdgeInsets.symmetric(vertical: 10),
    child: Text(string, style: Theme.of(context).textTheme.headline6,),
  );
}

Widget showContainer(Widget child){
  return Container(
    decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10)
    ),
    margin: EdgeInsets.all(10),
    padding: EdgeInsets.all(10),
    height: 150,
    width: 300,
    child: child
  );
}
