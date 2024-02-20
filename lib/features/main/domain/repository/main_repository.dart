import 'package:dartz/dartz.dart';

import '../../../../core/entities/app_error.dart';
import '../entities/todo_results_entity.dart';

abstract class MainRepository {
  Future<Either<AppError, TodoResultsEntity>> getTodos();
}
