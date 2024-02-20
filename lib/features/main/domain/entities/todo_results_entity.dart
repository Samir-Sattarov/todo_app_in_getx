import 'package:equatable/equatable.dart';

import 'todo_entity.dart';

class TodoResultsEntity extends Equatable{
  final List<TodoEntity> todos;

  const TodoResultsEntity({
    required this.todos,
  });

  factory TodoResultsEntity.empty() {
    return const TodoResultsEntity(todos: [],);
  }

  @override
  List<Object?> get props => [todos.length];

}
