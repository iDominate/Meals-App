import 'package:flutter/material.dart';
import 'package:meals_app/model/meal.dart';
import 'package:meals_app/screens/meal_detail_screen.dart';

class MealItem extends StatelessWidget {
  final String imageUrl, title, id;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;
  final Function(dynamic)? removeItem;

  MealItem(
      { this.removeItem,
        required this.id,
        required this.imageUrl,
      required this.affordability,
      required this.complexity,
      required this.title,
      required this.duration});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.of(context).pushNamed(MealDetailScreen.id, arguments: id).then((value){
        if(value != null){
          removeItem!(value);
        }
      }),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        elevation: 4,
        margin: EdgeInsets.all(10),
        child: Column(
          children: [
            Stack(
              children: [

                Container(
                    width: double.infinity,
                    height: 200,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(15),
                            topLeft: Radius.circular(15)),
                        image: DecorationImage(
                            image: NetworkImage(imageUrl), fit: BoxFit.fill))),
                Positioned(
                  bottom: 20,
                  right: 10,
                  child: Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                    color: Colors.black54,
                    width: 300,
                    child: Text(
                      title,
                      style: TextStyle(fontSize: 26, color: Colors.white),
                      softWrap: true,
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      Icon(Icons.schedule, color: Theme.of(context).buttonColor,),
                      SizedBox(
                        width: 6,
                      ),
                      Text('$duration min')
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.work, color: Theme.of(context).buttonColor,),
                      SizedBox(
                        width: 6,
                      ),
                      Text(selectComplexity(complexity))
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.attach_money, color: Theme.of(context).buttonColor,),
                      SizedBox(
                        width: 6,
                      ),
                      Text(selectAffordability(affordability))
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  String selectComplexity(Complexity complexity) {
    String _text;
    switch (complexity) {
      case Complexity.Simple:
        _text = 'Simple';
        break;
      case Complexity.Challenging:
        _text = 'Challenging';
        break;
      case Complexity.Hard:
        _text = 'Hard';
        break;
      default:
        _text = 'Unspecified';
    }

    return _text;
  }

  String selectAffordability(Affordability affordability) {
    String _text;
    switch (affordability) {
      case Affordability.Affordable:
        _text = 'Affordable';
        break;
      case Affordability.Pricey:
        _text = 'Pricey';
        break;
      case Affordability.Luxurious:
        _text = 'Luxurious';
        break;
      default:
        _text = 'Unspecified';
    }

    return _text;
  }
}
