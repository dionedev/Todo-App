import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:provider/provider.dart';
import 'package:todoapp/data/repositories/to_do_local_repository.dart';
import 'package:todoapp/shared/app_colors.dart';
import 'package:todoapp/ui/pages/todo/new_task_page.dart';
import 'package:todoapp/ui/pages/todo/to_do_controller.dart';
import 'package:todoapp/ui/pages/todo/todo_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting('pt_BR');

  runApp(
    ChangeNotifierProvider(
      create: (context) => ToDoController(
        toDoLocalRepository: ToDoLocalRepository(),
      ),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ToDo App',
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: AppColors.backgroundLight,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: '/todo',
      routes: {
        '/todo': (context) => TodoPage(),
        '/new': (context) => NewTaskPage(),
      },
    );
  }
}
