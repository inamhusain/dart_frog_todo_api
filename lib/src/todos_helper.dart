// ignore_for_file: public_member_api_docs, prefer_final_fields, unused_field

import 'dart:async';

import 'package:practice_dart_frog/model/todoModel.dart';
import 'package:uuid/uuid.dart';

class TodoHelper {
  static List<Items> _todosList = [];

  Future<List<Items>> getAllTodo() async {
    return _todosList;
  }

  Future<Items> createTodo({required Map<String, dynamic> json}) async {
    bool completed;

    if (json['completed'] == null) {
      completed = false;
    } else {
      completed = true;
    }
    final Items _todoItem = Items(
      id: const Uuid().v1(),
      title: json['title'].toString(),
      completed: completed,
    );
    _todosList.add(_todoItem);
    return _todoItem;
  }

  bool deleteTodo({id}) {
    var contain = _todosList.where((element) => element.id == id);
    if (contain.isNotEmpty) {
      _todosList.removeWhere((element) => element.id == id);
      return true;
    } else {
      return false;
    }
  }

  editTodo({
    required Map<String, dynamic> todoFromUser,
    id,
  }) async {
    Items _toodFromUser = Items.fromJson(todoFromUser);
    Items _todo = _todosList.firstWhere((element) => element.id == id);
    _todo.completed = _toodFromUser.completed;
    _todo.title = _toodFromUser.title;
    return _todo;
  }

  FutureOr<Iterable<Items>> findTodoByID(String id) {
    Iterable<Items> _todo = _todosList.where((element) => element.id == id);
    return _todo;
  }
}
