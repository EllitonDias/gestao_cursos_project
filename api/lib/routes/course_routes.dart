import 'package:shelf_router/shelf_router.dart';
import '../services/course_service.dart';

final courseRoutes = Router()
  ..get('/cursos', listarCursos)
  ..get('/cursos/<id>', obterCurso)
  ..post('/cursos', criarCurso)
  ..put('/cursos/<id>', atualizarCurso)
  ..delete('/cursos/<id>', excluirCurso);
