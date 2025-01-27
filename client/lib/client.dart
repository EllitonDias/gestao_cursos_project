import 'dart:convert';
import 'package:http/http.dart' as http;

const String apiUrl = 'http://localhost:8080/cursos';

void main() async {
  await criarCurso('Curso de Dart', 'Aprenda Dart do básico ao avançado', 40);

  await listarCursos();

  await obterCurso('1');

  await atualizarCurso('1', 'Curso de Flutter', 'Aprenda Flutter com Dart', 50);

  await excluirCurso('1');
}

Future<void> listarCursos() async {
  final response = await http.get(Uri.parse(apiUrl));
  print('Cursos: ${response.body}');
}

Future<void> obterCurso(String id) async {
  final response = await http.get(Uri.parse('$apiUrl/$id'));
  print('Curso: ${response.body}');
}

Future<void> criarCurso(String title, String description, int duration) async {
  final response = await http.post(
    Uri.parse(apiUrl),
    headers: {'Content-Type': 'application/json'},
    body: jsonEncode({'title': title, 'description': description, 'duration': duration}),
  );
  print('Curso criado: ${response.body}');
}

Future<void> atualizarCurso(String id, String title, String description, int duration) async {
  final response = await http.put(
    Uri.parse('$apiUrl/$id'),
    headers: {'Content-Type': 'application/json'},
    body: jsonEncode({'title': title, 'description': description, 'duration': duration}),
  );
  print('Curso atualizado: ${response.body}');
}

Future<void> excluirCurso(String id) async {
  final response = await http.delete(Uri.parse('$apiUrl/$id'));
  print('Resposta: ${response.body}');
}
