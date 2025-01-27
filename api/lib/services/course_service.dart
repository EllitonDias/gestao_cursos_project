import 'dart:convert';
import 'package:shelf/shelf.dart';
import '../models/course.dart';

final List<Course> courses = [];

Response listarCursos(Request request) {
  return Response.ok(jsonEncode(courses.map((c) => c.toJson()).toList()), headers: {'Content-Type': 'application/json'});
}

Response obterCurso(Request request, String id) {
  final course = courses.firstWhere((c) => c.id == id, orElse: () => Course(id: '', title: '', description: '', duration: 0));
  return Response.ok(jsonEncode(course.toJson()), headers: {'Content-Type': 'application/json'});
}

Future<Response> criarCurso(Request request) async {
  final payload = await request.readAsString();
  final data = jsonDecode(payload);

  final newCourse = Course(
    id: DateTime.now().millisecondsSinceEpoch.toString(),
    title: data['title'],
    description: data['description'],
    duration: data['duration'],
  );

  courses.add(newCourse);
  return Response.ok(jsonEncode(newCourse.toJson()), headers: {'Content-Type': 'application/json'});
}

Future<Response> atualizarCurso(Request request, String id) async {
  final index = courses.indexWhere((c) => c.id == id);
  if (index == -1) {
    return Response.notFound(jsonEncode({'error': 'Curso não encontrado'}), headers: {'Content-Type': 'application/json'});
  }

  final payload = await request.readAsString();
  final data = jsonDecode(payload);

  courses[index] = Course(
    id: id,
    title: data['title'],
    description: data['description'],
    duration: data['duration'],
  );

  return Response.ok(jsonEncode(courses[index].toJson()), headers: {'Content-Type': 'application/json'});
}

Response excluirCurso(Request request, String id) {
  final index = courses.indexWhere((c) => c.id == id);
  if (index == -1) {
    return Response.notFound(jsonEncode({'error': 'Curso não encontrado'}), headers: {'Content-Type': 'application/json'});
  }

  courses.removeAt(index);
  return Response.ok(jsonEncode({'message': 'Curso removido com sucesso'}), headers: {'Content-Type': 'application/json'});
}
