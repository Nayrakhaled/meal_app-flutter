import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:meal_app/providers/theme_provider.dart';
import 'package:meal_app/widget/MainDrawer.dart';
import 'package:provider/provider.dart';

class ThemesScreen extends StatelessWidget {
  static const String routeName = '/theme';

  Widget buildRadioListTitle(
      ThemeMode themVal, String text, IconData icon, BuildContext ctx) {
    return RadioListTile(
      secondary: Icon(icon, color: Theme.of(ctx).buttonColor),
      value: themVal,
      groupValue: Provider.of<ThemeProvider>(ctx, listen: true).theme,
      onChanged: (newThemeVal) => Provider.of<ThemeProvider>(ctx, listen: false)
          .themeModeChange(newThemeVal),
      title: Text(text),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Your Themes"),
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'Adjust your meal selection.',
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                Container(
                  child: Text('Choose your Theme Mode ',
                    style: Theme.of(context).textTheme.headline6 ,
                )),
                buildRadioListTitle(
                    ThemeMode.system, "System Default theme", null, context),
                buildRadioListTitle(ThemeMode.light, "Light theme",
                    Icons.wb_sunny_outlined, context),
                buildRadioListTitle(ThemeMode.dark, "Dark theme",
                    Icons.nights_stay_outlined, context),
                buildListTitle(context, "primary"),
                buildListTitle(context, "accent"),
              ],
            ),
          )
        ],
      ),
      drawer: MainDrawer(),
    );
  }

  ListTile buildListTitle(BuildContext context, text) {
    var primaryColor =
        Provider.of<ThemeProvider>(context, listen: true).primaryColor;
    var accentColor =
        Provider.of<ThemeProvider>(context, listen: true).accentColor;
    return ListTile(
      title: Text("Choose your $text color",
          style: Theme.of(context).textTheme.headline6),
      trailing: CircleAvatar(
          backgroundColor: text == 'primary' ? primaryColor : accentColor),
      onTap: () {
        showDialog(
          context: context,
          builder: (BuildContext ctx) {
            return AlertDialog(
              elevation: 4,
              titlePadding: EdgeInsets.all(0),
              contentPadding: EdgeInsets.all(0),
              content: SingleChildScrollView(
                child: ColorPicker(
                  pickerColor: text == 'primary'
                      ? Provider.of<ThemeProvider>(ctx, listen: true)
                          .primaryColor
                      : Provider.of<ThemeProvider>(ctx, listen: true)
                          .accentColor,
                  onColorChanged: (newColor) =>
                      Provider.of<ThemeProvider>(ctx, listen: false)
                          .onChange(newColor, text == "primary" ? 1 : 2),
                  colorPickerWidth: 300.0,
                  pickerAreaHeightPercent: 0.7,
                  enableAlpha: true,
                  displayThumbColor: false,
                  showLabel: false,
                ),
              ),
            );
          },
        );
      },
    );
  }
}
