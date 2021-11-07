import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:meals_app/providers/theme_provider.dart';
import 'package:provider/provider.dart';


class ThemeScreen extends StatefulWidget {
  static final id = 'theme';

  @override
  _ThemeScreenState createState() => _ThemeScreenState();
}

class _ThemeScreenState extends State<ThemeScreen> {
  Widget buildSwitchListTile(String title, String description,
      bool initialValue, Function(bool) updateValue) {
    return SwitchListTile(
      value: initialValue,
      onChanged: updateValue,
      title: Text(title),
      subtitle: Text(description),
      inactiveTrackColor: Colors.black,);
  }

  Widget buildRadioListTile(String title, IconData? icon, BuildContext context,
      ThemeMode mode) {
    return RadioListTile<ThemeMode>(
      value: mode,
      secondary: Icon(icon, color: Theme
          .of(context)
          .buttonColor,),
      groupValue: Provider
          .of<ThemeProvider>(context)
          .themeMode,
      onChanged: (newValue) =>
          Provider.of<ThemeProvider>(context, listen: false).toggleTheme(
              newValue!),
      title: Text(title),);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Your Theme"),),
        body: Column(
          children: [
            Container(
              padding: EdgeInsets.all(20),
              child: Text("Adjust your theme selection", style: Theme
                  .of(context)
                  .textTheme
                  .headline6,),
            ),
            Expanded(child: ListView(
              children: [
                Container(
                  padding: EdgeInsets.all(20),
                  child: Text("Choose your theme mode", style: Theme
                      .of(context)
                      .textTheme
                      .headline6,),
                ),
                buildRadioListTile(
                    "System Default Theme", null, context, ThemeMode.system),
                buildRadioListTile(
                    "Light Theme", Icons.wb_sunny_outlined, context,
                    ThemeMode.light),
                buildRadioListTile(
                    "Dark Theme", Icons.nights_stay_outlined, context,
                    ThemeMode.dark),
                buildListTile(context, "primary"),
                buildListTile(context, "accent"),

              ],
            ))
          ],

        )

    );
  }

  Widget buildListTile(BuildContext context, String type) {
    var primaryColor = Provider
        .of<ThemeProvider>(context)
        .primaryColor;
    var accentColor = Provider
        .of<ThemeProvider>(context)
        .accentColor;
    return ListTile(
      title: Text("choose your $type color", style: Theme
          .of(context)
          .textTheme
          .headline6,),
      trailing: CircleAvatar(
        backgroundColor: type == 'primary' ? Provider
            .of<ThemeProvider>(context)
            .primaryColor :
        Provider
            .of<ThemeProvider>(context)
            .accentColor,
      ),
      onTap: () {
        showDialog(context: context, builder: (_) {
          return AlertDialog(
            elevation: 4,
            titlePadding: EdgeInsets.all(0),
            contentPadding: EdgeInsets.all(0),
            content: SingleChildScrollView(
              child: ColorPicker(
                pickerColor: type == "primary" ? Provider.of<ThemeProvider>(context).primaryColor : Provider.of<ThemeProvider>(context).accentColor,
                onColorChanged: (color) =>
                    Provider.of<ThemeProvider>(context, listen: false).changeColor(
                        color, type == "primary" ? 1 : 2),
                colorPickerWidth: 300,
                pickerAreaHeightPercent: .7,
                enableAlpha: false,
                displayThumbColor: true,
                showLabel: false,
              ),
            ),
          );
        });
      },

    );
  }
}
