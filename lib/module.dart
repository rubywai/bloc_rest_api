
import 'package:bloc_rest_api/bloc/get/cubit/getcontact_cubit.dart';
import 'package:bloc_rest_api/data/api/apiservice.dart';
import 'package:bloc_rest_api/data/contact_repository.dart';
import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';

var getIt = GetIt.I;
void locator(){
  Dio dio = Dio();
  dio.interceptors.add(LogInterceptor(
  ));
  getIt.registerLazySingleton(() => dio);

  getIt.registerLazySingleton(() =>  ApiService(getIt.call()));

  getIt.registerLazySingleton(() =>  ContactRepository(getIt.call()));

  getIt.registerFactory(() => GetcontactCubit(getIt.call()));


  

}