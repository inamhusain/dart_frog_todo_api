import 'package:dart_frog/dart_frog.dart';
import 'package:practice_dart_frog/src/random_name_generator.dart';
import 'package:practice_dart_frog/src/todos_helper.dart';

Handler middleware(Handler handler) {
  return handler
      .use(requestLogger())
      .use(provider<RandomNameGenerator>((context) => RandomNameGenerator()))
      .use(provider<TodoHelper>((context) => TodoHelper()));
}
