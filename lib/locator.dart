import 'package:dio/dio.dart' as dio;
import 'package:dio/dio.dart' ;
import 'package:get_it/get_it.dart';



final locator = GetIt.I;

void setup() {
  // ================ Core ================ //

  locator.registerLazySingleton<Dio>(
    () => Dio(),
  );

  // ================ External ================ //

  // ================ BLoC / Cubit ================ //


  // ================ UseCases ================ //


  // ================ Repository / Datasource ================ //

  // ================ REPOSITORY ================ //


  // ================ DATASOURCE ================ //

}
