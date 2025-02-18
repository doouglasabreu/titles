import 'dart:convert';

import 'package:result_dart/result_dart.dart';
import 'package:titles/src/data/services/local_storage.dart';
import 'package:titles/src/domain/entities/title_entity.dart';

const _titleKey = '_titleKey';

class TitleLocalStorage {
  final LocalStorage _localStorage;

  TitleLocalStorage(this._localStorage);

  AsyncResult<List<Post>> getTitles() {
    return _localStorage //
        .getData(_titleKey)
        .map((json) => (json as List)
            .map((title) => Post.fromJson(jsonDecode(title))) //
            .toList());
  }

  AsyncResult<List<Post>> saveTitle(List<Post> titles) {
    return _localStorage //
        .saveData(_titleKey, jsonEncode(titles))
        .pure(titles);
  }
}
