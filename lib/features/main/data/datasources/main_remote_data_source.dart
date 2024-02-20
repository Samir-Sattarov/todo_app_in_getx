
import '../../../../core/api/api_client.dart';
import '../../../../core/api/api_constants.dart';
import '../models/todo_results_entity.dart';

abstract class MainRemoteDataSource {
  Future<TodoResultsModel> getTodos();
}

class MainRemoteDataSourceImpl extends MainRemoteDataSource {
  final ApiClient client;

  MainRemoteDataSourceImpl(this.client);

  @override
  Future<TodoResultsModel> getTodos() async {
    final response = await client.get(ApiConstants.todos);

    final results = TodoResultsModel.fromJson(response);

    return results;
  }


}
