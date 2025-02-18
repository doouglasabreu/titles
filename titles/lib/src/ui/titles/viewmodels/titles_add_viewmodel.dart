import 'package:get/get.dart';
import 'package:titles/src/data/repositories/title/title_repository.dart';

class TitlesAddViewmodel extends GetxController {
  final TitleRepository _titleRepository;

  final RxBool _isLoading = false.obs;
  RxBool get isLoading => _isLoading;

  TitlesAddViewmodel(this._titleRepository);

  
}
