import 'package:get_it/get_it.dart';
import '../../../core/network/network_conection.dart';
import '../data/datasources/post_local_datasource.dart';
import '../data/datasources/post_remote_datasource.dart';
import '../data/repositories/post_repositories_impl.dart';
import '../domain/repositories/post_repositories.dart';
import '../domain/usecases/delete_post.dart';
import '../domain/usecases/get_all_post.dart';
import '../domain/usecases/update_post.dart';
import 'bloc/add_update_delete/add_delete_update_dart_bloc.dart';
import 'package:http/http.dart'as http;
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../domain/usecases/add_post.dart';
import 'bloc/bloc/posts_bloc.dart';

final sl = GetIt.instance;
Future<void> init() async{
  //bloc
  sl.registerFactory(() => PostsBloc(getAllPosts: sl()));
  sl.registerFactory(() => AddDeleteUpdateDartBloc(
    addPostUseCase: sl(),
     deletePostUseCase: sl(),
      updatePostUseCase: sl()));
      //UseCase
      sl.registerLazySingleton(() => GetAllPostsUseCase(sl()));
      sl.registerLazySingleton(() => AddPostUseCase(sl()));
      sl.registerLazySingleton(() => UpdatePostUseCase(sl()));
      sl.registerLazySingleton(() => DeletePostUseCase(sl()));

      //Repositoris
      sl.registerLazySingleton<PostsRepositories>(() => PostRepositoriesImpl(
        localData: sl(),
         remoteData: sl(),
          networkInfo: sl()));
          
          //DataSources

          sl.registerLazySingleton<PostRemoteData>(() => PostRemoteDataImpl(client: sl()));
          sl.registerLazySingleton<PostLocalData>(() => PostLocalDataImpl(sharedPreferences: sl()));

          //Core

          sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));

          //External
          final sharedPreferences = await SharedPreferences.getInstance();
          sl.registerLazySingleton(() => sharedPreferences);
          sl.registerLazySingleton(() =>http.Client());
          sl.registerLazySingleton(() => InternetConnectionChecker());
}