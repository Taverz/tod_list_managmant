// import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_hooks/flutter_hooks.dart';
// import 'package:get_it/get_it.dart';
// import 'package:get_it/get_it.dart';
import 'package:stacked/stacked.dart';
// import 'package:tod_list_managmant/app/route.dart';

// import '../../../app/route.dart';
import '../../../constapp/icond.dart';
import 'splashscreen_viewmodel.dart';

// @RoutePage<String>(name: "SplashPreloader")
class SplashPreloaderPageView extends StackedView<SplashScreenViewModel> {
//  extends HookWidget {
  const SplashPreloaderPageView({Key? key}) : super(key: key);

  @override
  SplashScreenViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      SplashScreenViewModel();

  @override
  Widget builder(
    BuildContext context,
    SplashScreenViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      body: SafeArea(
        child: _content(),
      ),
    );
  }

  Widget _content() {
    return ViewModelBuilder<SplashScreenViewModel>.reactive(
      viewModelBuilder: () => SplashScreenViewModel(),
      builder: (context, mode, childWidget) {
        mode.preload();
        return Container(
          height: double.infinity,
          width: double.infinity,
          margin: const EdgeInsets.all(20),
          child: const Center(
            child: ImageIcon(
              IconsApp.logoBig,
              size: 80,
            ),
          ),
        );
      },
    );
  }
}
