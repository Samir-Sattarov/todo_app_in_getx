import 'package:flutter/material.dart';

import '../../domain/entities/todo_entity.dart';

class TodoCardWidget extends StatelessWidget {
  final TodoEntity entity;
  const TodoCardWidget({Key? key, required this.entity}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 10,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: Text(
                entity.title,
              ),
            ),
            entity.completed
                ? const Icon(
                    Icons.check,
                    color: Colors.green,
                  )
                : const Icon(
                    Icons.close,
                    color: Colors.red,
                  ),
          ],
        ),
      ),
    );
  }
}
