import 'package:flutter/material.dart';

import 'package:meals_app/screens/filters_screen.dart';
import 'package:meals_app/screens/theme_screen.dart';
import 'package:provider/provider.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {


    return Drawer(
      elevation: 0,
      child: Column(
        children: [
          Container(
            color: Theme
                .of(context)
                .accentColor,
            alignment: Alignment.centerLeft,
            height: 120,

            width: double.infinity,
            padding: EdgeInsets.all(20),
            child: Text('Cooking Up!', style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w900,
                color: Theme
                    .of(context)
                    .textTheme
                    .bodyText1!
                    .color
            ),),
          ),
          SizedBox(height: 20,),
          ListTile(
            onTap: () {
              Navigator.of(context).pop();
            },

            leading: Icon(Icons.restaurant, size: 26, color: Theme
                .of(context)
                .buttonColor,),
            title: Text('Meal', style: TextStyle(

                fontSize: 24,
                fontFamily: 'RobotoCondensed',
                fontWeight: FontWeight.bold
            ),),
          ),
          ListTile(
            onTap: () {
              Navigator.of(context).pushNamed(FiltersScreen.id);
            },

            leading: Icon(Icons.settings, size: 26, color: Theme
                .of(context)
                .buttonColor),
            title: Text('Filters', style: TextStyle(
                fontSize: 24,
                fontFamily: 'RobotoCondensed',
                fontWeight: FontWeight.bold
            ),),
          ),
          ListTile(
            onTap: () {
              Navigator.of(context).pushNamed(ThemeScreen.id);
            },

            leading: Icon(Icons.color_lens, size: 26, color: Theme
                .of(context)
                .buttonColor),
            title: Text('Themes', style: TextStyle(
                fontSize: 24,
                fontFamily: 'RobotoCondensed',
                fontWeight: FontWeight.bold
            ),),
          ),
          Divider(height: 10, color: Colors.black54,),
          Container(
            alignment: Alignment.centerRight,
            padding: const EdgeInsets.only(top: 20, right: 22),
            child: Text('Choose your preferred language', style: Theme
                .of(context)
                .textTheme
                .headline6,),
          ),

        ],
      ),
    );
  }
}
