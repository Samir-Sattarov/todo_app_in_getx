import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:todo_russ_kvant/features/main/data/datasources/main_remote_data_source.dart';
import 'package:todo_russ_kvant/features/main/domain/usecases/todo_usecases.dart';
import 'package:todo_russ_kvant/features/main/presentation/controllers/todo/todo_controller.dart';

import 'core/api/api_client.dart';
import 'features/main/data/repository/main_repository_impl.dart';
import 'features/main/domain/repository/main_repository.dart';

final locator = Get;
setup() {

  // ================ Controller ================ //
  locator.lazyPut(() => TodoController(locator.find()));

  // ================ UseCases ================ //

  locator.lazyPut<GetTodoUsecase>(() => GetTodoUsecase(locator.find()));

  // ================ Repository / Datasource ================ //

  locator.lazyPut<MainRepository>(() => MainRepositoryImpl(locator.find()));

  locator.lazyPut<MainRemoteDataSource>(
      () => MainRemoteDataSourceImpl(locator.find()));
  // ================ Core ================ //

  // ================ External ================ //
  locator.lazyPut<Dio>(() => Dio());
  locator.lazyPut<ApiClient>(() => ApiClientImpl(locator.find()));
}
