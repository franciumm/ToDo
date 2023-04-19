import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todo_c7_mon/main.dart';
import 'package:todo_c7_mon/shared/styles/my_theme.dart';
import '../../provider/Prov.dart';
import '../styles/colors.dart';

DateTime selectedDate = DateUtils.dateOnly(DateTime.now());

Widget Days(
  int index,
) =>
    InkWell(
      onTap: () {
        selectedDate =
            DateUtils.dateOnly(DateTime.now().add(Duration(days: index)));
        print(selectedDate.microsecondsSinceEpoch);
      },
      child: Column(
        children: [
          Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              color: PRIMARY_COLOR,
              child: Stack(alignment: Alignment.bottomLeft, children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10, top: 28, right: 13),
                  child: Container(
                    color: PRIMARY_COLOR,
                    child: Container(
                      alignment: Alignment.center,
                      height: 39.5,
                      width: 58,
                      decoration: BoxDecoration(
                          color: theme == MyThemeData.DarkTheme
                              ? BLACK_COLOR
                              : Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(7),
                            topRight: Radius.circular(7),
                          )),
                      child: Text(
                        ('${DateFormat.E().format(DateTime.now().add(Duration(days: index)))}'),
                        style: TextStyle(
                            color: theme == MyThemeData.DarkTheme
                                ? Colors.white
                                : BLACK_COLOR,
                            fontWeight: FontWeight.bold,
                            fontSize: 19),
                      ),
                    ),
                  ),
                ),
              ]),
            ),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 10, right: 13),
              child: Container(
                alignment: Alignment.center,
                height: 39.5,
                width: 58,
                decoration: BoxDecoration(
                    color: theme == MyThemeData.DarkTheme
                        ? BLACK_COLOR
                        : Colors.white,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(7),
                      bottomRight: Radius.circular(7),
                    )),
                child: Text(
                  '${DateTime.now().add(Duration(days: index)).day}',
                  style: TextStyle(
                      color: theme == MyThemeData.DarkTheme
                          ? Colors.white
                          : BLACK_COLOR,
                      fontWeight: FontWeight.bold,
                      fontSize: 19),
                ),
              ),
            ),
          ),
        ],
      ),
    );
