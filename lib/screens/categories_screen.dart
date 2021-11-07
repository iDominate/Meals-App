

import 'package:flutter/material.dart';
import 'package:meals_app/model/dummy_data.dart';
import 'package:meals_app/providers/meal_provider.dart';
import 'package:meals_app/providers/theme_provider.dart';
import 'package:meals_app/screens/theme_screen.dart';
import 'package:meals_app/widgets/category_item.dart';
import 'package:provider/provider.dart';

class CategoriesScreen extends StatelessWidget {

  static const id = '/category';


  @override
  Widget build(BuildContext context) {

    return Scaffold(

      body: GridView(gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20
      ),
        children: Provider.of<MealProvider>(context).availableCategories.map((e) => CategoryItem(id: e.id, title: e.title, color: e.color,)).toList(),
        padding: EdgeInsets.all(25),),
    );
  }
}
