import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:titles/src/ui/posts/viewmodels/titles_add_viewmodel.dart';

class TitleAddView extends StatefulWidget {
  const TitleAddView({super.key});

  @override
  State<TitleAddView> createState() => _TitleAddViewState();
}

class _TitleAddViewState extends State<TitleAddView> {
  final _controller = GetIt.instance<TitlesAddViewmodel>();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    super.dispose();
    GetIt.instance.resetLazySingleton<TitlesAddViewmodel>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Criar Novo Post'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  controller: _controller.titleController,
                  decoration: InputDecoration(labelText: 'Título'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, insira o título';
                    } else if (value.length < 5 || value.length > 50) {
                      return 'O título deve ter de 5 a 50 caracteres';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _controller.contentController,
                  decoration: InputDecoration(labelText: 'Conteúdo'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, insira o conteúdo';
                    } else if (value.length < 10 || value.length > 150) {
                      return 'O conteúdo deve ter de 10 a 150 caracteres';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _controller.authorIdController,
                  decoration: InputDecoration(labelText: 'ID do Autor'),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, insira o ID do autor';
                    }
                    if (int.tryParse(value) == null) {
                      return 'Por favor, insira um número válido';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _controller.titleIdController,
                  decoration: InputDecoration(labelText: 'ID do Título'),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, insira o ID do título';
                    }
                    if (int.tryParse(value) == null) {
                      return 'Por favor, insira um número válido';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                Obx(() {
                  return _controller.isLoading.value
                      ? CircularProgressIndicator()
                      : ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              _controller.savePost();
                            }
                          },
                          child: Text('Criar Post'),
                        );
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
