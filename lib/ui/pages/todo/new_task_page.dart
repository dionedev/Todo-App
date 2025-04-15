import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoapp/shared/app_colors.dart';
import 'package:todoapp/shared/components/td_button.dart';
import 'package:todoapp/shared/components/td_text_form_field.dart';
import 'package:todoapp/ui/pages/todo/to_do_controller.dart';

class NewTaskPage extends StatefulWidget {
  const NewTaskPage({super.key});

  @override
  State<NewTaskPage> createState() => _NewTaskPageState();
}

class _NewTaskPageState extends State<NewTaskPage> {
  final taskController = TextEditingController();

  @override
  void dispose() {
    taskController.dispose();
    super.dispose();
  }

  void saveTask() {
    final task = taskController.text.trim();

    if (task.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Digite uma tarefa'),
        ),
      );
      return;
    }
    final controller = Provider.of<ToDoController>(context, listen: false);
    controller.create(taskDescription: task);
    taskController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Nova tarefa',
          style: TextStyle(
            color: AppColors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back,
            color: AppColors.white,
          ),
        ),
        backgroundColor: AppColors.primaryLight,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 24,
            horizontal: 16,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: TdTextFormField(
                  labelText: 'Tarefa',
                  hintText: 'Qual tarefa tem para hoje?',
                  controller: taskController,
                ),
              ),
              TdButton(
                label: 'Salvar',
                onPressed: saveTask,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
