import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:todo_c7_mon/Models/Tasks.dart';
import 'package:todo_c7_mon/shared/Components/Days.dart';

CollectionReference<Task> GetTasksCollection() {
  return FirebaseFirestore.instance.collection('Tasks').withConverter<Task>(
        fromFirestore: (snapshot, options) => Task.fromJson(snapshot.data()!),
        toFirestore: (task, options) => task.ToJson(),
      );
}

void AddTask(Task task) {
  var coll = GetTasksCollection();
  var docref = coll.doc();
  task.id = docref.id;
  docref.set(task);
}

void update(Task task) async {
  return await GetTasksCollection().doc(task.id).update(task.ToJson());
}

Stream<QuerySnapshot<Task>> GetTasks() {
  return GetTasksCollection().orderBy('date', descending: false).snapshots();
}
