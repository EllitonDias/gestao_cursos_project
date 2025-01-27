import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart' as io;
import 'routes/course_routes.dart';

void startServer() async {
  final handler = Pipeline()
      .addMiddleware(logRequests())
      .addHandler(courseRoutes);

  final server = await io.serve(handler, 'localhost', 8080);
  print('API rodando em http://${server.address.host}:${server.port}');
}
