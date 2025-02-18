import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:titles/src/ui/titles/viewmodels/titles_add_viewmodel.dart';

class TitleAddView extends StatefulWidget {
  const TitleAddView({super.key});

  @override
  State<TitleAddView> createState() => _TitleAddViewState();
}

class _TitleAddViewState extends State<TitleAddView> {
   final _controller = GetIt.instance<TitlesAddViewmodel>();

  @override
  Widget build(BuildContext context) {
    
  return Scaffold(
      appBar: AppBar(
        title: Text('Criar Novo Post'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          child: Column(
            children: [
              TextFormField(
                
                decoration: InputDecoration(labelText: 'Título'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira o título';
                  }
                  return null;
                },
              ),
              TextFormField(
              
                decoration: InputDecoration(labelText: 'Conteúdo'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira o conteúdo';
                  }
                  return null;
                },
              ),
              TextFormField(
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
                        },
                        child: Text('Criar Post'),
                      );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
