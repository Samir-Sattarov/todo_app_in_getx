
import '../../domain/entities/todo_entity.dart';



class TodoModel extends TodoEntity {
  const TodoModel({
    required super.userId,
    required super.id,
    required super.title,
    required super.completed,
  });

  factory TodoModel.fromJson(Map<String, dynamic> json) => TodoModel(
        userId: json["userId"],
        id: json["id"],
        title: json["title"],
        completed: json["completed"],
      );

  factory TodoModel.fromEntity(TodoEntity entity) => TodoModel(
    userId: entity.userId,
    id: entity.id,
    title: entity.title,
    completed: entity.completed,
  );


  Map<String, dynamic> toJson() => {
        "userId": userId,
        "id": id,
        "title": title,
        "completed": completed,
      };
}
