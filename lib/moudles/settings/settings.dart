import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_c7_mon/main.dart';
import 'package:todo_c7_mon/shared/styles/my_theme.dart';
import 'package:todo_c7_mon/provider/Prov.dart';

import '../../shared/styles/colors.dart';

class SettingsTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<Provcl>(context);
    List<String> Dropitems = ['English', 'Arabic'];
    List<String> Modes = ['Light', 'Dark'];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: double.infinity,
          height: 80,
          color: PRIMARY_COLOR,
        ),
        const SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10.0, left: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Language',
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: theme == MyThemeData.DarkTheme
                        ? WHITE_COLOR
                        : PRIMARY_DARK),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 30.0),
                child: Container(
                  margin: const EdgeInsets.all(15.0),
                  decoration: BoxDecoration(
                      color: theme == MyThemeData.DarkTheme
                          ? PRIMARY_DARK
                          : WHITE_COLOR,
                      border: Border.all(color: Colors.blueAccent)),
                  width: double.infinity,
                  child: DropdownButton(
                    elevation: 0,
                    style: const TextStyle(color: Colors.blue),
                    underline: Container(),
                    value: provider.dropdownvalue,
                    icon: const Icon(Icons.keyboard_arrow_down),
                    onChanged: (value) {
                      if (value != null) {
                        provider.changelang((value as String));
                      }
                    },
                    items: Dropitems.map((lang) {
                      return DropdownMenuItem(
                        value: lang,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            lang,
                            style: TextStyle(
                                color: PRIMARY_COLOR,
                                fontWeight: FontWeight.bold,
                                fontSize: 19),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ),
              SizedBox(height: 40),
              Text(
                'Mode',
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: theme == MyThemeData.DarkTheme
                        ? WHITE_COLOR
                        : PRIMARY_DARK),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 30.0),
                child: Container(
                  width: double.infinity,
                  margin: const EdgeInsets.all(15.0),
                  decoration: BoxDecoration(
                      color: theme == MyThemeData.DarkTheme
                          ? PRIMARY_DARK
                          : WHITE_COLOR,
                      border: Border.all(color: Colors.blueAccent)),
                  child: DropdownButton(
                    elevation: 0,
                    style: const TextStyle(color: Colors.blue),
                    underline: Container(),
                    value: provider.Modesvalue,
                    icon: const Icon(Icons.keyboard_arrow_down),
                    onChanged: (value) {
                      provider.changemode((value as String?)!);
                    },
                    items: Modes.map((mode) {
                      return DropdownMenuItem(
                        value: mode,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            mode,
                            style: TextStyle(
                                color: PRIMARY_COLOR,
                                fontWeight: FontWeight.bold,
                                fontSize: 19),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
