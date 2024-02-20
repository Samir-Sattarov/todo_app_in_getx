import 'dart:math';

import 'package:flutter/material.dart';
import 'package:todo_russ_kvant/core/widgets/text_form_fied_widget.dart';

import '../../data/models/todo_model.dart';
import '../../domain/entities/todo_entity.dart';

class TodoEditScreen extends StatefulWidget {
  final TodoEntity? todo;
  final Function(TodoEntity todo) onSave;
  const TodoEditScreen({Key? key, this.todo, required this.onSave})
      : super(key: key);

  @override
  State<TodoEditScreen> createState() => _TodoEditScreenState();
}

class _TodoEditScreenState extends State<TodoEditScreen> {
  final TextEditingController controllerTitle = TextEditingController();
  bool isCompleted = false;

  @override
  void initState() {
    if(widget.todo != null) {
      controllerTitle.text = widget.todo!.title;
      isCompleted = widget.todo!.completed;
    }
    super.initState();
  }
  @override
  void dispose() {
    controllerTitle.dispose();
    isCompleted = false;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Todo edit",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              const SizedBox(height: 10),
              TextFormFieldWidget(
                  controller: controllerTitle, hint: "Task title"),
              const SizedBox(height: 10),
              Row(
                children: <Widget>[
                  const Text('Is completed'),
                  const Spacer(),
                  Checkbox(
                    value: isCompleted,
                    onChanged: (bool? value) {
                      setState(() {
                        isCompleted = value ?? false;
                      });
                    },
                  ),
                ],
              ),
              const SizedBox(height: 30),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    if (widget.todo != null) {
                      final editedTodo = widget.todo!.copyWith(
                        title: controllerTitle.text,
                        completed: isCompleted,
                      );
                      widget.onSave.call(TodoModel.fromEntity(editedTodo));
                    } else {
                      final random = Random().nextInt(100000);
                      final newTodo = TodoModel(
                        userId: random,
                        id: random,
                        title: controllerTitle.text,
                        completed: isCompleted,
                      );
                      widget.onSave.call(TodoModel.fromEntity(newTodo));
                    }
                    Navigator.pop(context);
                  },
                  child: const Text("Save"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
