import 'package:dartz/dartz.dart';

import '../../../../core/entities/app_error.dart';
import '../../../../core/entities/no_params.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/todo_results_entity.dart';
import '../repository/main_repository.dart';



class GetTodoUsecase extends UseCase<TodoResultsEntity, NoParams> {
  final MainRepository mainRepository;

  GetTodoUsecase(this.mainRepository);

  @override
  Future<Either<AppError, TodoResultsEntity>> call(NoParams params) =>
      mainRepository.getTodos();
}
