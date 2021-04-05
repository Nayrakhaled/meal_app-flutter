import 'package:flutter/material.dart';

class ThemeProvider with ChangeNotifier {

  var primaryColor = Colors.blue;
  var accentColor = Colors.cyan;
  var theme = ThemeMode.system;

  onChange(newColor, n) async {
    n == 1
        ? primaryColor = _toMaterialColor(newColor.hashCode)
        : accentColor = _toMaterialColor(newColor.hashCode);
    notifyListeners();
  }

  MaterialColor _toMaterialColor(colorValue) {
    return MaterialColor(colorValue, <int, Color>{
    50: Color(0xFFE3F2FD),
    100: Color(0xFFBBDEFB),
    200: Color(0xFF90CAF9),
    300: Color(0xFF64B5F6),
    400: Color(0xFF42A5F5),
    500: Color(colorValue),
    600: Color(0xFF1E88E5),
    700: Color(0xFF1976D2),
    800: Color(0xFF1565C0),
    900: Color(0xFF0D47A1),
    },);

  }

  void themeModeChange(newThemeVal) {
    theme = newThemeVal;
    notifyListeners();
  }
}