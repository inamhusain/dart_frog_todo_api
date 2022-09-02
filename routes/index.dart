import 'package:dart_frog/dart_frog.dart';

Response onRequest(RequestContext context) {
  const _wlcm = "Welcome to DartFrog Example.";
  const _randomNamesGET = "randomNames <get>";
  const _randomNamesIdGET = r"randomNames\id <get>";
  const _todosGET = r"todos <get>";
  const _todosByIdGET =
      r"todos <get> by id : Url : http://localhost:8080/todos/<id>";

  const _todosPOST =
      "todos <post> add json type data in body - raw \n  => {\'title\' : \' Any String \' , \'completed\' : bool}";
  const _todosDELETE = r"todos <delete> Url : todos\<id>";
  const _todosPUT =
      "todos <put> add json type data in body - raw /\n  => Url :  todos\\<id> \n  => {\'title\' : \' Any String \' , \'completed\' : bool}";

  const _bodyString =
      '$_wlcm \n\n ROUTES : \n\n - $_randomNamesGET \n\n - $_randomNamesIdGET \n\n - $_todosGET \n\n - $_todosByIdGET \n\n - $_todosPOST \n\n - $_todosPUT \n\n - $_todosDELETE \n\n\n';
  const _introString = 'Example Done by "https://husain.ml"';
  
  return Response(
    body: "$_bodyString $_introString",
  );
}
