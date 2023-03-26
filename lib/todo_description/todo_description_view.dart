import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:tod_list_managmant/constapp/text_style_app.dart';
import 'package:tod_list_managmant/constapp/words_app.dart';

@RoutePage<String>()
class TodoDescriptionView extends HookWidget {
  const TodoDescriptionView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: _content(),
      ),
    );
  }

  Widget _content() {
    return Column(
      children: [
        _titlePage(),
      ],
    );
  }

  Widget _titlePage() {
    return Row(
      children: const [
        Text(
          WordsApp.titlePage_DescriptionTodo,
          style: TextStyleAppW.titlePage,
        ),
      ],
    );
  }

  Widget _contentPage() {
    return Column(
      children: [
        Row(
          children: [
            Text("Title todo"),
            const Spacer(),
            Container(
              decoration: const BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.all(
                  Radius.circular(12),
                ),
              ),
            ),
          ],
        ),
        Text("Description"),
        Text("Status"),
      ],
    );
  }
}
