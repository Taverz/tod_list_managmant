
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:tod_list_managmant/app/UI/common/appconstant.dart';
import 'splashscreen_viewmodel.dart';

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
        child: _content(viewModel),
      ),
    );
  }

  Widget _content(SplashScreenViewModel viewModel) {
    return ViewModelBuilder<SplashScreenViewModel>.reactive(
      viewModelBuilder: () => viewModel,
      builder: (context, mode, childWidget) {
        mode.preload();
        return Container(
          height: double.infinity,
          width: double.infinity,
          margin: const EdgeInsets.all(20),
          child: const Center(
            child: ImageIcon(
              appIconLogoBig,
              size: 80,
            ),
          ),
        );
      },
    );
  }
}
