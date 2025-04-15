import 'package:flutter/material.dart';
import 'package:todoapp/data/models/task_model.dart';
import 'package:todoapp/shared/app_colors.dart';

class TaskCard extends StatelessWidget {
  final TaskModel task;
  final ValueChanged<bool?> onChanged;
  final VoidCallback onPressed;

  const TaskCard({
    super.key,
    required this.task,
    required this.onChanged,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 6,
        horizontal: 4,
      ),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: AppColors.borderLight,
        ),
      ),
      child: Row(
        spacing: 4,
        children: [
          Transform.scale(
            scale: 1.2,
            child: Checkbox(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(100),
              ),
              checkColor: AppColors.white,
              activeColor: AppColors.primaryLight,
              value: task.isDone,
              onChanged: onChanged,
            ),
          ),
          Expanded(
            child: Text(
              task.task ?? '',
              style: TextStyle(
                fontSize: 16,
                color: task.isDone
                    ? AppColors.textSecondaryLight
                    : AppColors.textPrimaryLight,
                fontWeight: FontWeight.w600,
                decoration: task.isDone ? TextDecoration.lineThrough : null,
              ),
            ),
          ),
          IconButton(
            onPressed: onPressed,
            icon: Icon(
              Icons.delete,
              color: AppColors.accentLight,
            ),
          ),
        ],
      ),
    );
  }
}
