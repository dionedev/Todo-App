import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoapp/shared/app_colors.dart';
import 'package:todoapp/shared/components/td_button.dart';
import 'package:todoapp/shared/utils/services.dart';
import 'package:todoapp/ui/pages/todo/to_do_controller.dart';
import 'package:todoapp/ui/pages/todo/widgets/task_card.dart';

class TodoPage extends StatefulWidget {
  const TodoPage({super.key});

  @override
  State<TodoPage> createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      if (mounted) {
        Provider.of<ToDoController>(context, listen: false).load();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Todo',
          style: TextStyle(
            color: AppColors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
        backgroundColor: AppColors.primaryLight,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 24,
          horizontal: 16,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: Text(
                Services.formatDate(),
                style: TextStyle(
                  color: AppColors.textPrimaryLight,
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Consumer<ToDoController>(
              builder: (context, controller, _) {
                return controller.tasks.isEmpty
                    ? Expanded(
                        flex: 8,
                        child: Center(
                          child: Text(
                            'Nenhuma tarefa por aqui...',
                            style: TextStyle(
                              fontSize: 18,
                              color: AppColors.textPrimaryLight,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      )
                    : Expanded(
                        flex: 8,
                        child: ListView.builder(
                          itemCount: controller.tasks.length,
                          itemBuilder: (context, index) {
                            final task = controller.tasks[index];
                            return Padding(
                              padding: EdgeInsets.only(bottom: 8),
                              child: TaskCard(
                                task: task,
                                onChanged: (_) {
                                  controller.markAsCompleted(task.id);
                                },
                                onPressed: () {
                                  controller.remove(task.id);
                                },
                              ),
                            );
                          },
                        ),
                      );
              },
            ),
            Spacer(),
            TdButton(
              label: 'Nova tarefa',
              onPressed: () {
                Navigator.pushNamed(context, '/new');
              },
            )
          ],
        ),
      ),
    );
  }
}
