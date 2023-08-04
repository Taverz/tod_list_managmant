// import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:stacked/stacked.dart';
import 'package:tod_list_managmant/app/UI/screen/profile/profile_viewmodel.dart';

// @RoutePage<String>(name: "ProfilePage")
class ProfilePageView extends StackedView<ProfileViewModel> {
  //extends HookWidget {
  const ProfilePageView({Key? key}) : super(key: key);
  @override
  ProfileViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      ProfileViewModel();

  @override
  Widget builder(
    BuildContext context,
    ProfileViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      body: SafeArea(
        child: _content(),
      ),
    );
  }

  Widget _content() {
    return Container();
  }
}
