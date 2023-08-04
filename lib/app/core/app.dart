// import 'package:tod_list_managmant/ui/bottom_sheets/notice/notice_sheet.dart';
// import 'package:tod_list_managmant/ui/dialogs/info_alert/info_alert_dialog.dart';
// import 'package:tod_list_managmant/ui/views/home/home_view.dart';
// import 'package:tod_list_managmant/ui/views/startup/startup_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:tod_list_managmant/app/UI/screen/login_page/login_page.dart';
import 'package:tod_list_managmant/app/UI/screen/organization_list/organization_list_page.dart';
import 'package:tod_list_managmant/app/UI/screen/profile/profile_page.dart';
import 'package:tod_list_managmant/app/UI/screen/splash_preloader_page/splash_preloader_page.dart';
import 'package:tod_list_managmant/app/UI/screen/todo_description/todo_description_page.dart';

import '../UI/bottom_sheets/alert/alert_sheet.dart';
import '../UI/bottom_sheets/notice/notice_sheet.dart';
import '../UI/dialogs/error/error_dialog.dart';
import '../UI/dialogs/info_alert/info_alert_dialog.dart';
import '../UI/screen/todo_list/todo_viewmodel.dart';

// import 'package:tod_list_managmant/app/UI/bottom_sheets/alert/alert_sheet.dart';

// @stacked-import
@StackedApp(
  routes: [
    MaterialRoute(page: LoginPageView),
    MaterialRoute(page: SplashPreloaderPageView),
    MaterialRoute(
      page: OrganizationListScreen,
      children: [
        MaterialRoute(page: ProfilePageView),
        MaterialRoute(
          page: TodoView,
          children: [
            MaterialRoute(page: TodoDescriptionView),
          ],
        ),
      ],
    ),
// @stacked-route
  ],
  dependencies: [
    LazySingleton(classType: BottomSheetService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: NavigationService),
    // LazySingleton(classType: StripeService),
// @stacked-service
  ],
  bottomsheets: [
    StackedBottomsheet(classType: NoticeSheet),
    StackedBottomsheet(classType: AlertSheet),
    StackedBottomsheet(classType: AlertSheet),
// @stacked-bottom-sheet
  ],
  dialogs: [
    StackedDialog(classType: InfoAlertDialog),
    StackedDialog(classType: ErrorDialog),
// @stacked-dialog
  ],
)
class App {}
