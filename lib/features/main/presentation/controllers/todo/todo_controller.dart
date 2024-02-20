import 'package:get/get.dart';
import 'package:todo_russ_kvant/core/entities/no_params.dart';
import 'package:todo_russ_kvant/features/main/domain/entities/todo_results_entity.dart';
import 'package:todo_russ_kvant/features/main/domain/usecases/todo_usecases.dart';

class TodoController extends GetxController {
  final GetTodoUsecase _getTodoUsecase;
  TodoController(this._getTodoUsecase);

  var todos = Rx<TodoResultsEntity>(TodoResultsEntity.empty());

  fetchData() async {
    final response = await _getTodoUsecase.call(NoParams());

    response.fold(
          (l) {},
          (r) {
        todos.value = r;
      },
    );

    print("Response $response");
  }
}
