import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:stacked/stacked.dart';

import '../../../constapp/constant_app.dart';
import 'organization_list_viewmodel.dart';

@RoutePage<String>(name: "OrganizationList")
class OrganizationListScreen extends HookWidget {
  const OrganizationListScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          //TODO: add organization
        },
      ),
      body: SafeArea(
        child: Column(
          children: [
            _appBar(
              titlePage: WordsApp.organizations,
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: _contentList(null),
            ),
          ],
        ),
      ),
    );
  }

  Widget _appBar({required String titlePage}) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SizedBox(width: 30),
          Text(
            titlePage,
            style: const TextStyle(
              fontSize: 28,
            ),
          ),
          ViewModelBuilder<OrganizationListViewModel>.reactive(
            viewModelBuilder: () => OrganizationListViewModel(),
            builder: (context, OrganizationListViewModel model, childWidget) {
              return IconButton(
                onPressed: () {
                  // model.erroreRegistration(messageErrore: "Message11223");
                  // model.warningManyRequestRegistration();
                },
                icon: const Icon(Icons.person_rounded),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _contentList(dynamic data) {
    if (data == null) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(
              Icons.hourglass_empty,
              size: 40.0,
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              WordsApp.emptyPage,
              style: TextStyleAppW.errorePage,
            ),
          ],
        ),
      );
    }
    return ListView.builder(
      itemCount: 2,
      itemBuilder: (context, index) {
        return _elementList(
          nameOrganozation: "",
          countTask: "",
        );
      },
    );
  }

  Widget _elementList(
      {required String nameOrganozation, required String countTask}) {
    Widget _contentWidget = Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SizedBox(height: 10),
          Text(nameOrganozation),
          const SizedBox(height: 10),
          Text(countTask),
          const SizedBox(height: 10),
        ],
      ),
    );
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
        borderRadius:
            const BorderRadius.all(Radius.circular(BorderWidget.mediumWidget)),
        border: Border.all(
            color: AppColors.primaryColor.withOpacity(0.5), width: 1),
      ),
      child: _contentWidget,
    );
  }
}
