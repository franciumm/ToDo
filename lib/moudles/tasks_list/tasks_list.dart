import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:slidable_button/slidable_button.dart';
import 'package:todo_c7_mon/Models/Tasks.dart';

import '../../shared/Components/Days.dart';
import '../../shared/Components/TaksItem.dart';
import '../../shared/network/local/firebase_utl.dart';

String result = "Tasks";

class HomePg extends StatefulWidget {
  const HomePg({Key? key}) : super(key: key);

  @override
  State<HomePg> createState() => _HomePgState();
}

class _HomePgState extends State<HomePg> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: SizedBox(
                height: 120,
                child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: 30,
                    itemBuilder: (BuildContext context, int index) {
                      return Days(index);
                    }),
              ),
            ),
          ],
        ),
        HorizontalSlidableButton(
          width: MediaQuery.of(context).size.width / 2,
          buttonWidth: 90.0,
          color: Theme.of(context).backgroundColor.withOpacity(0.5),
          buttonColor: Theme.of(context).primaryColor,
          dismissible: false,
          label: Center(child: Text(result)),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Tasks'),
                Text('Done Tasks'),
              ],
            ),
          ),
          onChanged: (position) {
            setState(() {
              if (position == SlidableButtonPosition.end) {
                result = 'Done Tasks';
                print(result);
              } else {
                result = 'Tasks';
                print(result);
              }
            });
          },
        ),
        result == 'Tasks'
            ? Expanded(
                child: StreamBuilder<QuerySnapshot<Task>>(
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      if (snapshot.hasError) {
                        return Center(
                          child: Text('Something went wrong'),
                        );
                      }
                      var tasks =
                          snapshot.data?.docs.map((e) => e.data()).toList() ??
                              [];

                      return ListView.builder(
                          itemCount: tasks.length,
                          itemBuilder: (context, index) =>
                              tasks[index].IsDone == true
                                  ? SizedBox(height: 0)
                                  : TaskItem(tasks[index]));
                    },
                    stream: GetTasks()),
              )
            : Expanded(
                child: StreamBuilder<QuerySnapshot<Task>>(
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      if (snapshot.hasError) {
                        return Center(
                          child: Text('Something went wrong'),
                        );
                      }
                      var tasks =
                          snapshot.data?.docs.map((e) => e.data()).toList() ??
                              [];

                      return ListView.builder(
                          itemCount: tasks.length,
                          itemBuilder: (context, index) =>
                              tasks[index].IsDone == true
                                  ? TaskItem(tasks[index])
                                  : SizedBox(
                                      height: 0,
                                    ));
                    },
                    stream: GetTasks()),
              ),
      ],
    );
  }
}
