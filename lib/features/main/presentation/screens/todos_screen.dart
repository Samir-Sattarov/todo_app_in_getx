import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_russ_kvant/features/main/presentation/controllers/todo/todo_controller.dart';
import 'package:todo_russ_kvant/features/main/presentation/screens/todo_edit_screen.dart';

import '../../domain/entities/todo_entity.dart';
import '../widget/todo_card_widget.dart';

class TodosScreen extends StatefulWidget {
  const TodosScreen({Key? key}) : super(key: key);

  @override
  State<TodosScreen> createState() => _TodosScreenState();
}

class _TodosScreenState extends State<TodosScreen> {
  late TodoController controller;

  @override
  void initState() {
    controller = Get.find<TodoController>()..fetchData();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Todos screen",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Obx(
          () {
            final todoResults = controller.todos.value.todos;

            return ListView.builder(
              itemCount: todoResults.length,
              itemBuilder: (context, index) {
                final todo = todoResults[index];
                return GestureDetector(
                  onTap: () => Get.to(
                    TodoEditScreen(
                      todo: todo,
                      onSave: (editedTodo) {
                        todoResults[index] = editedTodo;
                        setState(() {});
                      },
                    ),
                  ),
                  child: TodoCardWidget(
                    entity: todo,
                  ),
                );
              },
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
        onPressed: () {
          Get.to(
            TodoEditScreen(
              onSave: (TodoEntity todo) {
                controller.todos.value.todos.insert(0, todo);
                setState(() {});
              },
            ),
          );
        },
      ),
    );
  }
}
