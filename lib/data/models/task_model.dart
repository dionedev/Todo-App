import 'package:flutter/widgets.dart';

class TaskModel {
  final int id;
  final String title;
  final String? description;
  final bool isDone;

  TaskModel({
    required this.id,
    required this.title,
    required this.description,
    required this.isDone,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'isDone': isDone,
    };
  }

  factory TaskModel.fromMap(Map<String, dynamic> json) {
    return TaskModel(
      id: json['id'],
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      isDone: json['isDone'] ?? false,
    );
  }

  TaskModel copyWith({
    int? id,
    String? title,
    String? description,
    bool? isDone,
  }) {
    return TaskModel(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      isDone: isDone ?? this.isDone,
    );
  }

  @override
  String toString() {
    return 'TaskModel(id: $id, title: $title, description: $description, isDone: $isDone)';
  }
}
