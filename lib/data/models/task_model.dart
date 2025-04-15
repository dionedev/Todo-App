class TaskModel {
  final String id;
  final String? task;
  final bool isDone;

  TaskModel({
    required this.id,
    required this.task,
    required this.isDone,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'description': task,
      'isDone': isDone,
    };
  }

  factory TaskModel.fromMap(Map<String, dynamic> json) {
    return TaskModel(
      id: json['id'],
      task: json['description'] ?? '',
      isDone: json['isDone'] ?? false,
    );
  }

  TaskModel copyWith({
    String? id,
    String? task,
    bool? isDone,
  }) {
    return TaskModel(
      id: id ?? this.id,
      task: task ?? this.task,
      isDone: isDone ?? this.isDone,
    );
  }

  @override
  String toString() => 'TaskModel(id: $id, task: $task, isDone: $isDone)';
}
