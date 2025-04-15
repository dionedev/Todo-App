import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:todoapp/data/models/task_model.dart';

class ToDoLocalRepository {
  static const String key = 'task';

  Future<List<TaskModel>> getAll() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    final String? taskJsonString = sharedPreferences.getString(key);

    if (taskJsonString == null) {
      return [];
    }

    final List<dynamic> tasks = json.decode(taskJsonString);
    return tasks.map((task) => TaskModel.fromMap(task)).toList();
  }

  Future<void> save(List<TaskModel> tasks) async {
    final preferences = await SharedPreferences.getInstance();

    final String taskJsonString = json.encode(
      tasks.map((task) => task.toJson()).toList(),
    );
    await preferences.setString(key, taskJsonString);
  }
}
