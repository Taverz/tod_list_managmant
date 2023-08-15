import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../../data/model/company_model.dart';
import '../../common/appconstant.dart';
import '../../widget/bug_many_tap.dart';
import 'organization_list_viewmodel.dart';

class OrganizationListScreen extends StackedView<OrganizationListViewModel> {
  //extends HookWidget {
  const OrganizationListScreen({Key? key}) : super(key: key);
  @override
  OrganizationListViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      OrganizationListViewModel();

  @override
  Widget builder(
    BuildContext context,
    OrganizationListViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      floatingActionButton:
          ViewModelBuilder<OrganizationListViewModel>.reactive(
              viewModelBuilder: () => viewModel,
              builder: (context, OrganizationListViewModel model, childWidget) {
                return FloatingActionButton(
                  child: const Icon(Icons.add),
                  onPressed: () {
                    TapEventNOMany().taoEvent(
                      tapAccess: () {
                        model.addCompanyButton();
                      },
                    );
                  },
                );
              }),
      body: SafeArea(
        child: Column(
          children: [
            _appBar(
              titlePage: appwordsOrganizations,
              viewModel: viewModel,
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: ViewModelBuilder<OrganizationListViewModel>.reactive(
                  viewModelBuilder: () => viewModel,
                  builder:
                      (context, OrganizationListViewModel model, childWidget) {
                    return FutureBuilder(
                      future: model.getListCompany(),
                      builder: (context, async) {
                        return _contentList(model.getListCompanyData);
                      },
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }

  Widget _appBar(
      {required String titlePage,
      required OrganizationListViewModel viewModel}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ViewModelBuilder<OrganizationListViewModel>.reactive(
            viewModelBuilder: () => viewModel,
            builder: (context, OrganizationListViewModel model, childWidget) {
              return IconButton(
                onPressed: () {
                  TapEventNOMany().taoEvent(
                    tapAccess: () {
                      model.clearCompany();
                    },
                  );
                },
                icon: const Icon(Icons.delete_forever),
              );
            },
          ),
          Text(
            titlePage,
            style: const TextStyle(
              fontSize: 28,
            ),
          ),
          ViewModelBuilder<OrganizationListViewModel>.reactive(
            viewModelBuilder: () => viewModel,
            builder: (context, OrganizationListViewModel model, childWidget) {
              return IconButton(
                onPressed: () {
                  // model.erroreRegistration(messageErrore: "Message11223");
                  // model.warningManyRequestRegistration();
                  //TODO: no
                },
                icon: const Icon(Icons.person_rounded),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _contentList(List<Company_model>? data) {
    if (data == null || data.isEmpty) {
      return const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.hourglass_empty,
              size: 40.0,
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              appwordsEmptyPage,
              style: apptextstyleErrorePage,
            ),
          ],
        ),
      );
    }
    return ListView.builder(
      itemCount: data.length,
      itemBuilder: (context, index) {
        return _elementList(
          nameOrganozation: data[index].name,
        );
      },
    );
  }

  Widget _elementList({required String nameOrganozation}) {
    Widget contentWidget = Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SizedBox(height: 10),
          Text(nameOrganozation),
          const SizedBox(height: 10),
        ],
      ),
    );
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
        borderRadius:
            const BorderRadius.all(Radius.circular(appborderMediumWidget)),
        border: Border.all(
          color: appcolorPrimaryColor.withOpacity(0.5),
          width: 1,
        ),
      ),
      child: contentWidget,
    );
  }
}
