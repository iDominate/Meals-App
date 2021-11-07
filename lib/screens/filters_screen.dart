import 'package:flutter/material.dart';
import 'package:meals_app/providers/meal_provider.dart';
import 'package:meals_app/providers/theme_provider.dart';

import 'package:meals_app/screens/tabs_screen.dart';
import 'package:provider/provider.dart';

class FiltersScreen extends StatefulWidget {
  static const id = '/filters';

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  late Map<String, bool> currentFilters;

  @override
  void initState() {
    super.initState();

    currentFilters = Provider.of<MealProvider>(context, listen:  false).filters;
    currentFilters.forEach((key, value) {print("$key -> $value");});
  }

  @override
  Widget build(BuildContext context) {
    var gluten = Provider.of<MealProvider>(context)
        .filters['gluten'];
    var vegan = Provider.of<MealProvider>(context)
        .filters['vegan'];
    var lactose = Provider.of<MealProvider>(context)
        .filters['lactose'];
    var vegetarian = Provider.of<MealProvider>(context)
        .filters['vegetarian'];


    return Scaffold(
        appBar: AppBar(
          title: Text('Filters'),
        ),
        body: Column(
          children: [
            Container(
              padding: EdgeInsets.all(20),
              child: Text(
                'adjust your meal selections',
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
            Expanded(
                child: ListView(
              children: [
                buildSwitchListTile(gluten!, 'Gluten-Free',
                    'Only includes gluten free meals', (value) {
                  setState(() {
                    Provider.of<MealProvider>(context, listen: false)
                        .filters['gluten'] = value;
                    Provider.of<MealProvider>(context, listen: false)
                        .setFilters();
                  });
                }),
                buildSwitchListTile(lactose!, 'Lactose-Free',
                    'Only includes lactose free meals', (value) {
                  setState(() {
                    Provider.of<MealProvider>(context, listen: false)
                        .filters['lactose'] = value;
                    Provider.of<MealProvider>(context, listen: false)
                        .setFilters();
                  });
                }),
                buildSwitchListTile(vegetarian!, 'Vegetarian',
                    'Only includes vegetarian meals', (value) {
                  setState(() {
                    Provider.of<MealProvider>(context, listen: false)
                        .filters['vegetarian'] = value;
                    Provider.of<MealProvider>(context, listen: false)
                        .setFilters();
                  });
                }),
                buildSwitchListTile(vegan!, 'Vegan',
                    'Only includes vegan meals', (value) {
                  setState(() {
                    Provider.of<MealProvider>(context, listen: false)
                        .filters['vegan'] = value;
                    Provider.of<MealProvider>(context, listen: false)
                        .setFilters();
                  });
                }),
              ],
            ))
          ],
        ));
  }

  Widget buildSwitchListTile(
      bool boolValue, String title, String subtitle, Function(bool) fun) {
    return SwitchListTile(
      value: boolValue,
      inactiveTrackColor:
          Provider.of<ThemeProvider>(context).themeMode == ThemeMode.light
              ? null
              : Colors.black    ,
      onChanged: fun,
      title: Text(title),
      subtitle: Text(subtitle),
    );
  }
}
