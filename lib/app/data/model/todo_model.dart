// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

enum PriorityTodoTask {
  today,
  month,
  urgency,
  high,
  low,
  medium,
}

extension PriorityTodoTaskXX on PriorityTodoTask {
  String toStr() => toString();
  static PriorityTodoTask convert(String en) {
    switch (en) {
      case "PriorityTodoTask.low":
        return PriorityTodoTask.low;
      case "PriorityTodoTask.high":
        return PriorityTodoTask.high;
      case "PriorityTodoTask.medium":
        return PriorityTodoTask.medium;
      case "PriorityTodoTask.month":
        return PriorityTodoTask.month;
      case "PriorityTodoTask.today":
        return PriorityTodoTask.today;
      case "PriorityTodoTask.urgency":
        return PriorityTodoTask.urgency;
      default:
        return PriorityTodoTask.low;
    }
  }
}

class Todo_model {
  String id_todo;
  String id_user_creater;
  String id_user_executor;

  String name;
  String description;

  /// UTC date
  String dateTime_create;

  /// Convert to enum
  PriorityTodoTask priority_task;
  Todo_model({
    required this.id_todo,
    required this.id_user_creater,
    required this.id_user_executor,
    required this.name,
    required this.description,
    required this.dateTime_create,
    required this.priority_task,
  }):assert(name.isNotEmpty & dateTime_create.isNotEmpty);

  Todo_model copyWith({
    String? id_todo,
    String? id_user_creater,
    String? id_user_executor,
    String? name,
    String? description,
    String? dateTime_create,
    PriorityTodoTask? priority_task,
  }) {
    return Todo_model(
      id_todo: id_todo ?? this.id_todo,
      id_user_creater: id_user_creater ?? this.id_user_creater,
      id_user_executor: id_user_executor ?? this.id_user_executor,
      name: name ?? this.name,
      description: description ?? this.description,
      dateTime_create: dateTime_create ?? this.dateTime_create,
      priority_task: priority_task ?? this.priority_task,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id_todo': id_todo,
      'id_user_creater': id_user_creater,
      'id_user_executor': id_user_executor,
      'name': name,
      'description': description,
      'dateTime_create': dateTime_create,
      'priority_task': priority_task.toStr(),
    };
  }

  factory Todo_model.fromMap(Map<String, dynamic> map) {
    return Todo_model(
      id_todo: map['id_todo'] as String,
      id_user_creater: map['id_user_creater'] as String,
      id_user_executor: map['id_user_executor'] as String,
      name: map['name'] as String,
      description: map['description'] as String,
      dateTime_create: map['dateTime_create'] as String,
      priority_task: PriorityTodoTaskXX.convert(
          (map['priority_task'] as Map<String, dynamic>).toString()),
    );
  }

  String toJson() => json.encode(toMap());

  factory Todo_model.fromJson(String source) =>
      Todo_model.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Todo_model(id_todo: $id_todo, id_user_creater: $id_user_creater, id_user_executor: $id_user_executor, name: $name, description: $description, dateTime_create: $dateTime_create, priority_task: $priority_task)';
  }

  @override
  bool operator ==(covariant Todo_model other) {
    if (identical(this, other)) return true;

    return other.id_todo == id_todo &&
        other.id_user_creater == id_user_creater &&
        other.id_user_executor == id_user_executor &&
        other.name == name &&
        other.description == description &&
        other.dateTime_create == dateTime_create &&
        other.priority_task == priority_task;
  }

  @override
  int get hashCode {
    return id_todo.hashCode ^
        id_user_creater.hashCode ^
        id_user_executor.hashCode ^
        name.hashCode ^
        description.hashCode ^
        dateTime_create.hashCode ^
        priority_task.hashCode;
  }
}
