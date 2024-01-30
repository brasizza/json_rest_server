import 'dart:convert';

import 'package:get_it/get_it.dart';
import 'package:shelf/shelf.dart';

import '../../repositories/database_repository.dart';

class PostHandler {
  final _databaseRepository = GetIt.I.get<DatabaseRepository>();
  Future<Map<String, dynamic>?> execute(Request request) async {
    final Uri(pathSegments: [table, ...]) = request.url;

    if (_databaseRepository.tableExists(table)) {
      var body = await request.readAsString();

      if (body.contains('#userAuthRef')) {
        body = body.replaceAll('#userAuthRef', request.headers['user'] ?? '0');
      }
      return _databaseRepository.save(table, jsonDecode(body));
    }
    return null;
  }
}
