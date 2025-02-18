import 'package:result_dart/result_dart.dart';
import 'package:titles/src/data/exceptions/exceptions.dart';
import 'package:titles/src/data/repositories/post/post_repository.dart';
import 'package:titles/src/data/services/posts/post_client_http.dart';
import 'package:titles/src/data/services/posts/title_local_storage.dart';
import 'package:titles/src/domain/entities/title_entity.dart';

class TitleRepositoryImpl implements TitleRepository {
  final TitleLocalStorage _titleLocalStorage;
  final TitleClientHttp _titleClientHttp;

  TitleRepositoryImpl(this._titleLocalStorage, this._titleClientHttp);

  @override
  AsyncResult<Post> addPost(Post title) {
    return _titleClientHttp
        .addTitles(title)
        .flatMap(_titleLocalStorage.saveTitle); //
  }

  @override
  AsyncResult<List<Post>> getPosts() {
    return _titleClientHttp //
        .getTitles()
        .flatMap(_titleLocalStorage.saveTitles)
        .recover((e) {
      if (e is ClientExeception) {
        return _titleLocalStorage.getTitles();
      } else {
        return Failure(e);
      }
    });
  }
}
