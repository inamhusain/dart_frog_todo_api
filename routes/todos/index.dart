import 'dart:async';
import 'dart:io';

import 'package:dart_frog/dart_frog.dart';
import 'package:practice_dart_frog/src/todos_helper.dart';

FutureOr<Response> onRequest(RequestContext context) {
  switch (context.request.method) {
    case HttpMethod.get:
      return _get(context);

    case HttpMethod.post:
      return _post(context);

    case HttpMethod.delete:
    // return _delete(context);

    case HttpMethod.head:

    case HttpMethod.options:

    case HttpMethod.patch:

    case HttpMethod.put:
      return Response(statusCode: HttpStatus.methodNotAllowed);
  }
}

FutureOr<Response> _get(RequestContext context) async {
  final _todoDataSource = context.read<TodoHelper>();
  final _todoList = await _todoDataSource.getAllTodo();
  return Response.json(body: {'items': _todoList});
}

FutureOr<Response> _post(RequestContext context) async {
  final _todoDataSource = context.read<TodoHelper>();
  final _todoList =
      await _todoDataSource.createTodo(json: await context.request.json());
  return Response.json(statusCode: HttpStatus.created, body: {
    'items': _todoList,
  });
}
