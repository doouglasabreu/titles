import 'package:result_dart/result_dart.dart';
import 'package:titles/src/data/services/client_http.dart';
import 'package:titles/src/domain/entities/title_entity.dart';

class TitleClientHttp {
  final ClientHttp _clientHttp;

  TitleClientHttp(this._clientHttp);

  AsyncResult<List<Title>> getTitles() async  {
    
    final response = await _clientHttp.get('https://jsonplaceholder.typicode.com/posts');
    
    return response.map((titles) {
      return (titles.data as List) //
      .map((title) => Title.fromJson(title)) //
      .toList();
    });
  }

}