import 'package:get/get.dart';
import 'package:titles/src/data/repositories/title/title_repository.dart';
import 'package:titles/src/domain/entities/title_entity.dart';

class TitlesViewmodel extends GetxController {
  final TitleRepository _titleRepository;

  final List<Title> _titles = <Title>[].obs;
  List<Title> get titles => _titles;

  final RxBool _isLoading = false.obs;
  RxBool get isLoading => _isLoading;

  TitlesViewmodel(this._titleRepository);

  getTitles() async {
    _isLoading.value = true;

    var result = await _titleRepository.getTitles();
    result.fold((r) {
      _titles.addAll(r);
    }, (l) {
      print(l.toString());
    });

    _isLoading.value = false;
  }
}
