import 'package:result_dart/result_dart.dart';
import 'package:titles/src/domain/entities/title_entity.dart';

abstract interface class TitleRepository {
  AsyncResult<List<Post>> getPosts();
  AsyncResult<Post> addPost(Post title);
}
