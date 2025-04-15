import 'package:flutter/foundation.dart';
import 'package:todoapp/data/models/task_model.dart';
import 'package:todoapp/data/repositories/to_do_local_repository.dart';
import 'package:uuid/uuid.dart';

class ToDoController extends ChangeNotifier {
  final ToDoLocalRepository toDoLocalRepository;

  ToDoController({
    required this.toDoLocalRepository,
  });

  List<TaskModel> _tasks = [];
  List<TaskModel> get tasks => _tasks;
  final uuid = Uuid();

  Future<void> load() async {
    _tasks = await toDoLocalRepository.getAll();
    notifyListeners();
  }

  Future<void> create({required String taskDescription}) async {
    final task = TaskModel(
      id: uuid.v4(),
      task: taskDescription,
      isDone: false,
    );
    _tasks.add(task);
    await toDoLocalRepository.save(_tasks);
    notifyListeners();
  }

  Future<void> markAsCompleted(String id) async {
    _tasks = _tasks.map((task) {
      if (task.id == id) {
        return task.copyWith(isDone: !task.isDone);
      }
      return task;
    }).toList();

    await toDoLocalRepository.save(_tasks);
    notifyListeners();
  }

  Future<void> remove(String id) async {
    _tasks.removeWhere((task) => task.id == id);
    await toDoLocalRepository.save(_tasks);
    notifyListeners();
  }
}
