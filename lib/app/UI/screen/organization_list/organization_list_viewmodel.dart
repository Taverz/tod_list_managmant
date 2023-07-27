import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:tod_list_managmant/app/core/locator.dart';

import '../../widget/dialog/dialog_custom.dart';

class OrganizationListViewModel extends BaseViewModel {
  final _dialogService = locator.get<DialogService>();

  /// Errore data to registration
  void erroreRegistration({String? messageErrore}) {
    //  _dialogService.showDialog();
  }

  /// Errore after many errore request
  void warningManyRequestRegistration({String? messageWarning}) {
    _dialogService.showCustomDialog(
      //variant / customData
      variant: DialogType.basic,
      customData: DialogType.basic,
       // Which builder you'd like to call that was assigned in the builders function above.
      title: messageWarning ?? 'Warning',
      // description: 'Sheck out the builder in the dialog_ui_register.dart file',
      // mainButtonTitle: 'Ok',
    ); //.showDialog();
  }
}
