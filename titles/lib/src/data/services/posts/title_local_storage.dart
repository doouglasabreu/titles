import 'dart:convert';

import 'package:result_dart/result_dart.dart';
import 'package:titles/src/data/services/local_storage.dart';
import 'package:titles/src/domain/entities/title_entity.dart';

const _titleKey = '_titleKey';

class TitleLocalStorage {
  final LocalStorage _localStorage;

  TitleLocalStorage(this._localStorage);

  AsyncResult<List<Post>> getTitles() async {
    final result = await _localStorage.getData(_titleKey);
    List<Post> posts = [];
    result.fold(
      (data) {
        posts =
            (jsonDecode(data) as List).map((e) => Post.fromJson(e)).toList();
      },
      (error) {
        posts = [];
      },
    );
    return Success(posts);
  }

  AsyncResult<List<Post>> saveTitles(List<Post> titles) {
    return _localStorage //
        .saveData(_titleKey, jsonEncode(titles))
        .pure(titles);
  }

  AsyncResult<Post> saveTitle(Post post) async {
    final result = await _localStorage.getData(_titleKey);
    List<Post> posts = [];
    result.fold(
      (data) {
        posts =
            (jsonDecode(data) as List).map((e) => Post.fromJson(e)).toList();
      },
      (error) {
        posts = [];
      },
    );
    posts.add(post);
    return _localStorage //
        .saveData(_titleKey, jsonEncode(posts))
        .pure(post);
  }
}
