import 'package:dio/dio.dart';
import 'package:result_dart/result_dart.dart';
import 'package:titles/src/data/exceptions/exceptions.dart';
import 'package:titles/src/data/services/client_http.dart';
import 'package:titles/src/domain/entities/title_entity.dart';

class TitleClientHttp {
  final ClientHttp _clientHttp;

  TitleClientHttp(this._clientHttp);

  AsyncResult<List<Post>> getTitles() async {
    try {
      final response =
          await _clientHttp.get('https://jsonplaceholder.typicode.com/posts');

      final posts = response.map((titles) {
        return (titles.data as List) //
            .map((title) => Post.fromJson(title)) //
            .toList();
      });
      return posts;
    } on DioException {
      return Failure(ClientExeception("Erro no client"));
    }
  }

  AsyncResult<Post> addTitles(Post title) async {
    try {
      await _clientHttp.post(
          'https://jsonplaceholder.typicode.com/posts', title.toJson());
      return Success(title);
    } on DioException {
      return Failure(ClientExeception("Erro no client"));
    }
  }
}
