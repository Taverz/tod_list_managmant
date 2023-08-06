import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:tod_list_managmant/app/UI/screen/todo_description/todo_description_viewmodel.dart';

import '../../common/appconstant.dart';

// @RoutePage<String>(name:"TodoDescription")
class TodoDescriptionView extends StackedView<TodoDescriptionViewModel> {
  // extends HookWidget {
  const TodoDescriptionView({Key? key}) : super(key: key);

  @override
  TodoDescriptionViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      TodoDescriptionViewModel();

  @override
  Widget builder(
    BuildContext context,
    TodoDescriptionViewModel viewModel,
    Widget? child,
  ) {
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
    return const Row(
      children: [
        Text(
          appwordsTitlePage_DescriptionTodo,
          style: apptextstyleTitlePage,
        ),
      ],
    );
  }

  Widget _contentPage() {
    return Column(
      children: [
        Row(
          children: [
            const Text("Title todo"),
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
        const Text("Description"),
        const Text("Status"),
      ],
    );
  }
}
