import 'package:get/get.dart';
import 'package:titles/src/data/repositories/post/post_repository.dart';
import 'package:titles/src/domain/entities/title_entity.dart';
import 'package:titles/src/ui/posts/post_add_view.dart';

class TitlesViewmodel extends GetxController {
  final TitleRepository _titleRepository;

  final List<Post> _titles = <Post>[].obs;
  List<Post> get titles => _titles;

  final RxBool _isLoading = false.obs;
  RxBool get isLoading => _isLoading;

  TitlesViewmodel(this._titleRepository);

  getTitles() async {
    _isLoading.value = true;

    var result = await _titleRepository.getPosts();
    result.fold((r) {
      _titles.addAll(r);
    }, (l) {
      print(l.toString());
    });

    _isLoading.value = false;
  }

  newPost() async {
    var result = await Get.to(() => TitleAddView());

    if (result != null) {
      titles.add(result);
    }
  }
}
