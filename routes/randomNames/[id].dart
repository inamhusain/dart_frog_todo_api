import 'dart:io';

import 'package:dart_frog/dart_frog.dart';
import 'package:practice_dart_frog/src/random_name_generator.dart';

Response onRequest(RequestContext context, String id) {
  final _randomNamesGenerator = context.read<RandomNameGenerator>();
  var _randomNames = '';

  if (id.contains(RegExp('[a-z]'))) {
    return Response(
      body: 'Id Must be a Number',
      statusCode: HttpStatus.badRequest,
    );
  } else if (int.parse(id) >= _randomNamesGenerator.nameList.length) {
    return Response(body: 'No Data Found', statusCode: HttpStatus.noContent);
  } else {
    _randomNames = _randomNamesGenerator.nameList[int.parse(id)];
  }
  return Response(
    body: _randomNames,
  );
}
