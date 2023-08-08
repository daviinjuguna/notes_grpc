import 'dart:io';

import 'package:protos/protos.dart';
import 'package:server/note_service.dart';

void main(List<String> arguments) async {
  final server = Server.create(services: [
    NoteService(),
  ]);

  final port = int.parse(Platform.environment['PORT'] ?? '4000');
  await server.serve(port: port);

  print('Server listening on port ${server.port}...🚀');
}
