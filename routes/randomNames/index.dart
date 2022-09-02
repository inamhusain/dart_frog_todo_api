// ignore_for_file: unnecessary_null_comparison

import 'package:dart_frog/dart_frog.dart';
import 'package:practice_dart_frog/src/random_name_generator.dart';

Response onRequest(
  RequestContext context,
) {
  final _randomName = context.read<RandomNameGenerator>().getName();

  return Response(
    body: _randomName,
  );
}
