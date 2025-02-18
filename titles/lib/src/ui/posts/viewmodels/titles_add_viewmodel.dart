import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:titles/src/data/repositories/post/post_repository.dart';
import 'package:titles/src/domain/entities/title_entity.dart';

class TitlesAddViewmodel extends GetxController {
  final TitleRepository _titleRepository;
  final TextEditingController titleController = TextEditingController();
  final TextEditingController contentController = TextEditingController();
  final TextEditingController authorIdController = TextEditingController();
  final TextEditingController titleIdController = TextEditingController();

  final RxBool _isLoading = false.obs;
  RxBool get isLoading => _isLoading;

  TitlesAddViewmodel(this._titleRepository);

  savePost() async {
    _isLoading.value = true;
    Post post = Post(
        id: int.parse(titleIdController.text),
        userId: int.parse(authorIdController.text),
        title: titleController.text,
        body: contentController.text);
    var result = await _titleRepository.addPost(post);
    result.fold(
        (r) => {Get.back(result: r)},
        (l) => {
              Get.snackbar(
                "Erro ao salvar",
                "Ocorreu um erro ao salvar o post. Tente novamente!",
                snackPosition: SnackPosition.BOTTOM,
                backgroundColor: Colors.red,
                colorText: Colors.white,
                duration: const Duration(seconds: 3),
              )
            });
    _isLoading.value = false;
  }
}
