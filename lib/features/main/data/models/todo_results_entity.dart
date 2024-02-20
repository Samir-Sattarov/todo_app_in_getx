import '../../domain/entities/todo_results_entity.dart';
import 'todo_model.dart';

class TodoResultsModel extends TodoResultsEntity {
  const TodoResultsModel({required super.todos});

  factory TodoResultsModel.fromJson(List<dynamic> json) {
    return TodoResultsModel(
      todos: json.map((e) => TodoModel.fromJson(e)).toList(),
    );
  }
}
