import 'package:dartz/dartz.dart';

import '../../../../core/entities/app_error.dart';
import '../../../../core/usecases/action.dart';
import '../../domain/entities/todo_results_entity.dart';
import '../../domain/repository/main_repository.dart';
import '../datasources/main_remote_data_source.dart';

class MainRepositoryImpl extends MainRepository {
  final MainRemoteDataSource remoteDataSource;

  MainRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<AppError, TodoResultsEntity>> getTodos() async {
    return await action(task: remoteDataSource.getTodos());
  }
}
