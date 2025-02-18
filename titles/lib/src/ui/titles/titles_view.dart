import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:titles/src/ui/titles/title_add_view.dart';
import 'package:titles/src/ui/titles/viewmodels/titles_viewmodel.dart';

class TitlesView extends StatefulWidget {
  const TitlesView({super.key});

  @override
  State<TitlesView> createState() => _TitlesViewState();
}

class _TitlesViewState extends State<TitlesView> {
  final _controller = GetIt.instance<TitlesViewmodel>();

  @override
  void initState() {
    super.initState();
    _controller.getTitles();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Posts"),
          actions: [
            IconButton(
                onPressed: () {
                  Get.to(() => TitleAddView());
                },
                icon: Icon(Icons.add))
          ],
        ),
        body: Obx(() {
          return _controller.isLoading.value
              ? Center(child: CircularProgressIndicator())
              : _controller.titles.isEmpty
                  ? Text("Nenhum post disponível")
                  : ListView.builder(
                      itemCount: _controller.titles.length,
                      itemBuilder: (context, index) {
                        final post = _controller.titles[index];

                        return ListTile(
                          title: Text(
                            post.title,
                          ),
                          subtitle: Text(
                            post.body,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          trailing: IconButton(
                            onPressed: () {
                              //Get.to(() => PostDetailPage(), arguments: post);
                            },
                            icon: Icon(Icons.arrow_forward_ios_rounded),
                          ),
                        );
                      },
                    );
        }));
  }
}
