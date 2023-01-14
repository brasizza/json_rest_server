import 'package:get_it/get_it.dart';
import 'package:json_rest_server/src/core/helper/json_helper.dart';
import 'package:shelf/shelf.dart';

class OptionHandler {
  Future<Response> execute(Request request) async {
    final _jsonHelper = GetIt.I.get<JsonHelper>();

    return Response(200, headers: _jsonHelper.jsonReturn);
  }
}
