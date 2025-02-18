import 'package:result_dart/result_dart.dart';
import 'package:result_dart/src/types.dart';
import 'package:result_dart/src/unit.dart';
import 'package:titles/src/data/repositories/title/title_repository.dart';
import 'package:titles/src/data/services/titles/title_client_http.dart';
import 'package:titles/src/data/services/titles/title_local_storage.dart';
import 'package:titles/src/domain/entities/title_entity.dart';

class TitleRepositoryImpl implements TitleRepository {
  final TitleLocalStorage _titleLocalStorage;
  final TitleClientHttp _titleClientHttp;


  TitleRepositoryImpl(this._titleLocalStorage, this._titleClientHttp);

  @override
  AsyncResult<Unit> addTitle() {
    throw UnimplementedError();
  }

  @override
  AsyncResult<List<Title>> getTitles() {
    return _titleClientHttp //
    .getTitles()
    .flatMap(_titleLocalStorage.saveTitle);
  }
}
