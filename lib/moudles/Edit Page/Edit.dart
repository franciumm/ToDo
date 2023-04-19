import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_c7_mon/main.dart';
import 'package:todo_c7_mon/shared/styles/my_theme.dart';
import 'package:todo_c7_mon/provider/Prov.dart';

import '../../Models/Tasks.dart';
import '../../shared/Components/AddTask.dart';
import '../../shared/network/local/firebase_utl.dart';
import '../../shared/styles/colors.dart';

var dateedit;

class EditTab extends StatelessWidget {
  Task tsk;
  EditTab(this.tsk);

  @override
  var formkey = GlobalKey<FormState>();
  TextEditingController titlecont = TextEditingController();
  TextEditingController datecont = TextEditingController();
  Widget build(BuildContext context) {
    var prov = Provider.of<Provcl>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: PRIMARY_COLOR,
        bottomOpacity: 0,
        title: Text(
          'To Do List',
          style: TextStyle(
              color:
                  theme == MyThemeData.DarkTheme ? PRIMARY_BLACK : WHITE_COLOR,
              fontWeight: FontWeight.bold,
              fontSize: 25),
        ),
        elevation: 0.0,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            height: 80,
            color: PRIMARY_COLOR,
          ),
          Expanded(
              child: Center(
                  child: Padding(
            padding:
                const EdgeInsets.only(left: 30.0, right: 30.0, bottom: 30.0),
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30)),
              child: Container(
                width: double.infinity,
                color: theme == MyThemeData.lightTheme
                    ? Colors.white
                    : PRIMARY_BLACK,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 15.0,
                      ),
                      child: Text(
                        'Edit Task',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 25),
                      ),
                    ),
                    Form(
                      key: formkey,
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: theme == MyThemeData.lightTheme
                                ? Colors.white
                                : PRIMARY_BLACK),
                        child: Padding(
                          padding: const EdgeInsets.all(28),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 10),
                              TextFormField(
                                  controller: titlecont,
                                  onChanged: (value) {
                                    tsk.title = value;
                                  },
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Enter Title Please';
                                    }
                                    return null;
                                  },
                                  keyboardType: TextInputType.text,
                                  decoration: InputDecoration(
                                      hintText: tsk.title,
                                      hintStyle: TextStyle(
                                          color: theme == MyThemeData.lightTheme
                                              ? PRIMARY_DARK
                                              : Colors.white,
                                          fontWeight: FontWeight.bold),
                                      enabledBorder: UnderlineInputBorder())),
                              SizedBox(height: 50),
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
                                    '${DateTime.fromMicrosecondsSinceEpoch(tsk.date).year} - ${DateTime.fromMicrosecondsSinceEpoch(tsk.date).month} - ${DateTime.fromMicrosecondsSinceEpoch(tsk.date).day}',
                                    style: TextStyle(
                                        color: theme == MyThemeData.lightTheme
                                            ? PRIMARY_COLOR
                                            : Colors.white,
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  onTap: () {
                                    Dateedit(context, prov);
                                  },
                                ),
                              ),
                              SizedBox(height: 20),
                              Center(
                                  child: InkWell(
                                      onTap: () async {
                                        TimeOfDay? newTime =
                                            await showTimePicker(
                                                context: context,
                                                initialTime: Time);
                                        if (newTime == null) {
                                          return;
                                        }
                                        tsk.min = newTime.minute;
                                        tsk.hour = newTime.hour;
                                        prov.Notify();
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          '${tsk.hour} : ${tsk.min}',
                                          style: TextStyle(fontSize: 20),
                                        ),
                                      ))),
                              SizedBox(height: 100),
                              ClipRRect(
                                borderRadius: BorderRadius.circular(40),
                                child: Container(
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(100)),
                                    width: double.infinity,
                                    height: 40,
                                    child: ElevatedButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                        update(tsk);
                                        prov.Notify();

                                        ;
                                      },
                                      child: Text(
                                        'Save Changes',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    )),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )))
        ],
      ),
    );
  }

  void Dateedit(context, prov) async {
    dateedit = (await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(3000),
    ))!;
    tsk.date = DateUtils.dateOnly(dateedit).microsecondsSinceEpoch;
    prov.Notify();
  }
}
