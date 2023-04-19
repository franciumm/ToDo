import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';
import 'package:todo_c7_mon/shared/styles/colors.dart';
import 'package:todo_c7_mon/shared/styles/my_theme.dart';
import '../../Models/Tasks.dart';
import '../../main.dart';
import '../../moudles/Edit Page/Edit.dart';
import '../../provider/Prov.dart';
import '../network/local/firebase_utl.dart';

Color Tskclr = PRIMARY_COLOR;

class TaskItem extends StatelessWidget {
  Task tsk;

  TaskItem(this.tsk);

  @override
  Widget build(BuildContext context) {
    var prov = Provider.of<Provcl>(context);
    return Slidable(
      key: UniqueKey(),

      startActionPane: ActionPane(
        motion: const ScrollMotion(),
        dismissible: DismissiblePane(onDismissed: () {
          dodelete(context, tsk);
        }),
        children: [
          SlidableAction(
            borderRadius: BorderRadius.horizontal(left: Radius.circular(10)),
            onPressed: (context) => dodelete(context, tsk),
            backgroundColor: Color(0xFFFE4A49),
            foregroundColor: Colors.white,
            icon: Icons.delete,
            label: 'Delete',
          ),
        ],
      ),
      endActionPane: ActionPane(motion: const ScrollMotion(), children: [
        SlidableAction(
          onPressed: (context) => doedit(context, tsk),
          backgroundColor: Color(0xFF21B7CA),
          foregroundColor: Colors.white,
          icon: Icons.edit,
          label: 'Edit',
        ),
      ]),
      // The end action pane is the one at the right or the bottom side.

      child: Padding(
        padding: EdgeInsets.all(4.0),
        child: Container(
          margin: EdgeInsets.all(10),
          width: double.infinity,
          height: 90,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color:
                theme == MyThemeData.DarkTheme ? PRIMARY_BLACK : Colors.white,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Container(
                      height: 62,
                      width: 4,
                      decoration: BoxDecoration(
                          color: tsk.IsDone ? GREEN_COLOR : Tskclr,
                          borderRadius: BorderRadius.circular(15)),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20, left: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          tsk.title,
                          style: TextStyle(
                              color: tsk.IsDone ? GREEN_COLOR : Tskclr,
                              fontWeight: FontWeight.bold,
                              fontSize: 19),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Icon(
                              CupertinoIcons.time,
                              color: theme == MyThemeData.DarkTheme
                                  ? WHITE_COLOR
                                  : Colors.black54,
                              size: 12,
                            ),
                            Text(
                              '${tsk.hour}:${tsk.min}',
                              style: TextStyle(
                                  color: theme == MyThemeData.DarkTheme
                                      ? WHITE_COLOR
                                      : Colors.black54,
                                  fontSize: 13),
                            )
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
              tsk.IsDone
                  ? Text(
                      'Done!',
                      style: TextStyle(
                          color: GREEN_COLOR,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    )
                  : Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Container(
                        width: 69,
                        height: 34,
                        decoration: BoxDecoration(
                            color: Tskclr,
                            borderRadius: BorderRadius.circular(10)),
                        child: MaterialButton(
                          onPressed: () {
                            tsk.IsDone = true;
                            GetTasksCollection()
                                .doc(tsk.id)
                                .update(tsk.ToJson());
                            prov.Notify();
                          },
                          child: Icon(
                            Icons.check,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    )
            ],
          ),
        ),
      ),
    );
  }
}

doedit(BuildContext context, Task tsk) {
  Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => EditTab(tsk),
      ));
}

dodelete(BuildContext context, Task tsk) async {
  return await GetTasksCollection().doc(tsk.id).delete();
}
