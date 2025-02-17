import 'package:result_dart/result_dart.dart';
import 'package:titles/src/domain/entities/title_entity.dart';

abstract interface class TitleRepository {
  AsyncResult<List<Title>> getTitles();
  AsyncResult<Unit> addTitle();
}
