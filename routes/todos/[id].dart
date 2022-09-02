import 'dart:async';
import 'dart:io';

import 'package:dart_frog/dart_frog.dart';
import 'package:practice_dart_frog/model/todoModel.dart';
import 'package:practice_dart_frog/src/todos_helper.dart';

FutureOr<Response> onRequest(RequestContext context, String id) async {
  final _todoDataSource = context.read<TodoHelper>();
  Iterable<Items> _todo = await _todoDataSource.findTodoByID(id);
  if (_todo.isEmpty) {
    return Response.json(
      statusCode: HttpStatus.noContent,
      body: 'No todo found',
    );
  }

  switch (context.request.method) {
    case HttpMethod.get:
      return Response.json(
        body: {'items': _todo.first},
      );

    case HttpMethod.delete:
      return _delete(context, id);

    case HttpMethod.put:
      return _edit(context, id);

    case HttpMethod.head:

    case HttpMethod.options:

    case HttpMethod.patch:
    case HttpMethod.post:
      return Response(statusCode: HttpStatus.methodNotAllowed);
  }
}

FutureOr<Response> _delete(RequestContext context, String id) async {
  final _todoDataSource = context.read<TodoHelper>();
  bool isDelete = await _todoDataSource.deleteTodo(id: id);
  print(isDelete);
  return isDelete
      ? Response(statusCode: HttpStatus.ok, body: 'Item Deleted')
      : Response(statusCode: HttpStatus.notFound, body: 'No items found');
}

FutureOr<Response> _edit(RequestContext context, String id) async {
  final _todoDataSource = context.read<TodoHelper>();
  final newTodo = await _todoDataSource.editTodo(
    todoFromUser: await context.request.json(),
    id: id,
  );
  return Response.json(body: {"items": newTodo});
}
