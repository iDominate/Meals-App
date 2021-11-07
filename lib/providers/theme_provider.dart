import 'package:flutter/material.dart';
import 'package:meals_app/model/category.dart';
import 'package:meals_app/model/dummy_data.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider with ChangeNotifier {
  var primaryColor = Colors.red;
  var accentColor = Colors.amber;
  ThemeMode themeMode = ThemeMode.system;


  String themeText = 's';

  void toggleTheme(ThemeMode mode) async{
    themeMode = mode;
    _getThemeText(themeMode);
    notifyListeners();

    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString('themeMode', themeText);
  }

  void changeColor(Color color, int n) async {
     n == 1
        ? primaryColor = _convertToMaterialColor(color.value)
        : accentColor = _convertToMaterialColor(color.value);
    notifyListeners();
     SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
     sharedPreferences.setInt('primary', primaryColor.value);
     sharedPreferences.setInt('accent', accentColor.value);
  }

  _getThemeText(ThemeMode mode)
  {
    if(mode == ThemeMode.system)
      {
        themeText = 's';
      }
    else if(mode == ThemeMode.light)
      {
        themeText = 'l';
      }
    else
      {
        themeText = 'd';
      }
  }

  getThemeModeFromSharedPrefs() async
  {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    themeText = sharedPreferences.getString('themeMode') ?? 's';
    _getThemeModeFromText(themeText);
    notifyListeners();
  }

  getColorsFromSharedPrefs() async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    int primaryColorHex= sharedPreferences.getInt('primary') ?? primaryColor.value;
    int accentColorHex= sharedPreferences.getInt('accent') ?? accentColor.value;
    primaryColor = _convertToMaterialColor(primaryColorHex);
    accentColor = _convertToMaterialColor(accentColorHex);
    notifyListeners();
  }

  _getThemeModeFromText(String themeString){
    if(themeText == 's'){
      themeMode = ThemeMode.system;
    }else if(themeText == 'l')
    {
      themeMode = ThemeMode.light;
    }else{
      themeMode = ThemeMode.dark;
    }
  }

  MaterialColor _convertToMaterialColor(color) {
    return MaterialColor(
      color,
      <int, Color>{
        50: Color(0xFFFFEBEE),
        100: Color(0xFFFFCDD2),
        200: Color(0xFFEF9A9A),
        300: Color(0xFFE57373),
        400: Color(0xFFEF5350),
        500: Color(color),
        600: Color(0xFFE53935),
        700: Color(0xFFD32F2F),
        800: Color(0xFFC62828),
        900: Color(0xFFB71C1C),
      },
    );
  }
}
