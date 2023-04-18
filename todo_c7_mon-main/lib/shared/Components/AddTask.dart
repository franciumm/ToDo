import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_c7_mon/Models/Tasks.dart';
import 'package:todo_c7_mon/main.dart';
import 'package:todo_c7_mon/shared/styles/colors.dart';
import 'package:todo_c7_mon/shared/styles/my_theme.dart';

import '../../provider/Prov.dart';
import '../network/local/firebase_utl.dart';

var formkey = GlobalKey<FormState>();
TextEditingController titlecont = TextEditingController();
TextEditingController datecont = TextEditingController();
String title = '';
DateTime Datepicked = DateTime.now();
TimeOfDay Time =
    TimeOfDay(hour: DateTime.now().hour, minute: DateTime.now().minute);

Widget Addtsk(ctx, prov) => Form(
      key: formkey,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color:
                theme == MyThemeData.lightTheme ? Colors.white : PRIMARY_DARK),
        child: Padding(
          padding: const EdgeInsets.all(28),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.all(15.0),
                child: Center(
                  child: Text(
                    'Add new Task',
                    style: TextStyle(
                        color: theme == MyThemeData.lightTheme
                            ? PRIMARY_DARK
                            : Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                ),
              ),
              SizedBox(height: 10),
              TextFormField(
                  controller: titlecont,
                  onChanged: (value) {
                    title = value;
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Enter Title Please';
                    }
                    return null;
                  },
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      hintText: 'enter your task',
                      hintStyle: TextStyle(
                          color: theme == MyThemeData.lightTheme
                              ? PRIMARY_DARK
                              : Colors.white,
                          fontWeight: FontWeight.bold),
                      enabledBorder: UnderlineInputBorder())),
              SizedBox(height: 20),
              Center(
                child: Text('Select Time',
                    style: TextStyle(
                        color: theme == MyThemeData.lightTheme
                            ? PRIMARY_DARK
                            : Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20)),
              ),
              SizedBox(height: 20),
              Center(
                child: InkWell(
                  child: Text(
                    '${Datepicked.year} / ${Datepicked.month} / ${Datepicked.day}',
                    style: TextStyle(
                        color: theme == MyThemeData.lightTheme
                            ? PRIMARY_COLOR
                            : Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                  ),
                  onTap: () {
                    Darepicker(ctx, prov);
                  },
                ),
              ),
              SizedBox(height: 20),
              Center(
                  child: InkWell(
                      onTap: () async {
                        TimeOfDay? newTime = await showTimePicker(
                            context: ctx, initialTime: Time);
                        if (newTime == null) {
                          return;
                        }
                        Time = newTime;
                        prov.Notify();
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          '${Time.hour}: ${Time.minute}',
                          style: TextStyle(fontSize: 20),
                        ),
                      ))),
              SizedBox(height: 50),
              Container(
                  width: double.infinity,
                  height: 40,
                  child: ElevatedButton(
                    onPressed: () {
                      if (formkey.currentState!.validate()) {
                        Task task = Task(
                          min: Time.minute,
                          hour: Time.hour,
                          title: title,
                          date: DateUtils.dateOnly(Datepicked)
                              .microsecondsSinceEpoch,
                        );
                        AddTask(task);
                        title = '';
                        titlecont = TextEditingController();
                        Navigator.pop(ctx);
                        prov.Notify();
                      }
                      ;
                    },
                    child: Text(
                      'ADD',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
void Darepicker(context, prov) async {
  Datepicked = (await showDatePicker(
    context: context,
    initialDate: DateTime.now(),
    firstDate: DateTime(1900),
    lastDate: DateTime(3000),
  ))!;
  prov.Notify();
}
