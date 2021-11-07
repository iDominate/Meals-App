import 'package:flutter/material.dart';
import 'package:meals_app/screens/category_meals_screen.dart';

class CategoryItem extends StatelessWidget {
  final String id, title;
  final Color color;

 const CategoryItem({required this.id,required this.title,this.color = Colors.orange});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Theme.of(context).primaryColor,
      onTap: () => Navigator.of(context).pushNamed(CategoryMealsScreen.id, arguments: {
        'id': id, 'title': title
      }),
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: EdgeInsets.all(15),
        child: Text(title, style: Theme.of(context).textTheme.headline6,),
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            color.withOpacity(.4),
            color
          ], begin: Alignment.topLeft, end: Alignment.bottomRight),
          borderRadius: BorderRadius.circular(15)
        ),
      ),
    );
  }
}
