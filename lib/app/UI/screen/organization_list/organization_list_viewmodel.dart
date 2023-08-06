import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../core/app.dialogs.dart';
import '../../../core/app.locator.dart';

class OrganizationListViewModel extends BaseViewModel {
  final _dialogService = locator<DialogService>();

  /// Errore data to registration
  void erroreRegistration({String? messageErrore}) {
    _dialogService.showCustomDialog(
      variant: DialogType.error,
      title: 'Warning!',
      description: 'Give stacked stars.',
    );
  }

  /// Errore after many errore request
  void warningManyRequestRegistration({String? messageWarning}) {
    _dialogService.showCustomDialog(
      variant: DialogType.error,
      title: 'Warning!',
      description: 'Give stacked stars.',
    );
  }
}
