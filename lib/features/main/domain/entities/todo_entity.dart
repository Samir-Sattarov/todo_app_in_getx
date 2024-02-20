import 'package:equatable/equatable.dart';

class TodoEntity extends Equatable {
  final int userId;
  final int id;
  final String title;
  final bool completed;

  const TodoEntity({
    required this.userId,
    required this.id,
    required this.title,
    required this.completed,
  });

  TodoEntity copyWith({
    int? userId,
    int? id,
    String? title,
    bool? completed,
  }) {
    return TodoEntity(
      userId: userId ?? this.userId,
      id: id ?? this.id,
      title: title ?? this.title,
      completed: completed ?? this.completed,
    );
  }

  @override
  List<Object?> get props => [userId, id, title, completed];
}
