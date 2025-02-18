import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:titles/src/data/repositories/post/post_repository_impl.dart';
import 'package:titles/src/data/services/client_http.dart';
import 'package:titles/src/data/services/local_storage.dart';
import 'package:titles/src/data/services/posts/post_client_http.dart';
import 'package:titles/src/data/services/posts/title_local_storage.dart';
import 'package:titles/src/ui/posts/viewmodels/titles_add_viewmodel.dart';
import 'package:titles/src/ui/posts/viewmodels/titles_viewmodel.dart';

final getIt = GetIt.instance;

setupProviders() {
  getIt.registerLazySingleton(
      () => TitlesAddViewmodel(getIt<TitleRepositoryImpl>()));
  getIt.registerLazySingleton(
      () => TitlesViewmodel(getIt<TitleRepositoryImpl>()));
  getIt.registerLazySingleton(() => TitleRepositoryImpl(
      getIt<TitleLocalStorage>(), getIt<TitleClientHttp>()));
  getIt.registerLazySingleton(() => TitleLocalStorage(LocalStorage()));
  getIt.registerLazySingleton(() => TitleClientHttp(getIt<ClientHttp>()));
  getIt.registerLazySingleton(() => ClientHttp(Dio()));
}
