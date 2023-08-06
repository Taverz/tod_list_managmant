import 'dart:async';

// import 'package:agconnect_auth/agconnect_auth.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:tod_list_managmant/app/core/app.locator.dart';
import 'package:tod_list_managmant/app/core/app.router.dart';

class SplashScreenViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  Future<void> preload() async {
    await Future.delayed(const Duration(seconds: 3));
    // final AGCUser? userCurrent = await AGCAuth.instance.currentUser;
    // if (userCurrent != null) {
    //   _navigationService.navigateToOrganizationListScreen();
    // } else {
      _navigationService.navigateToLoginPageView();
    // }
  }
}

//  void showDialog() {
//     _dialogService.showCustomDialog(
//       variant: DialogType.infoAlert,
//       title: 'Stacked Rocks!',
//       description: 'Give stacked $_counter stars on Github',
//     );
//   }

//   void showBottomSheet() {
//     _bottomSheetService.showCustomSheet(
//       variant: BottomSheetType.notice,
//       title: ksHomeBottomSheetTitle,
//       description: ksHomeBottomSheetDescription,
//     );
//   }
