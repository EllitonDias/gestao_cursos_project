import 'dart:convert';
import 'package:http/http.dart' as http;

const String apiUrl = 'http://localhost:8080/cursos';

void main() async {
  await criarCurso(title: 'Curso de Dart', description: 'Aprenda Dart do básico ao avançado', duration: 40);

  await listarCursos();

  await obterCurso('1738019127577'); // verifique o id do curso criado no terminal

  await atualizarCurso('1738019127577', 'Curso de Flutter', 'Aprenda Flutter com Dart', 50); // verifique o id do curso criado no terminal

  await excluirCurso('1738019127577'); // verifique o id do curso criado no terminal
}

Future<void> listarCursos() async {
  final response = await http.get(Uri.parse(apiUrl));
  for (final course in jsonDecode(response.body)) {
    print('Curso: $course\n');
  }
}

Future<void> obterCurso(String id) async {
  final response = await http.get(Uri.parse('$apiUrl/$id'));
  print('Curso: ${response.body}\n');
}

Future<void> criarCurso({required String title, required String description, required int duration}) async {
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
  print('Curso atualizado: ${response.body}\n');
}

Future<void> excluirCurso(String id) async {
  final response = await http.delete(Uri.parse('$apiUrl/$id'));
  print('Resposta: ${response.body}');
}
