import 'dart:math';

import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:tod_list_managmant/app/data/model/company_model.dart';

import '../../../core/app.dialogs.dart';
import '../../../core/app.locator.dart';
import '../../../data/local_sql/driftdatabase.dart';
import '../../../data/repository/repository_simple.dart';

class OrganizatioonModelata {
  OrganizatioonModelata();
  List<Company_model>? getListCompany = null;
}

class OrganizationListViewModel extends BaseViewModel {
  final _dialogService = locator<DialogService>();
  final _repositoryService = locator<RepositorySimple>();
  // OrganizatioonModelata? dataModels = OrganizatioonModelata();
  List<Company_model>? getListCompanyData = null;

  void addCompanyButton() async {
    //TODO: show alert dialog
    await _addCompanyConfirm("NameCompany");
  }

  Future _addCompanyConfirm(String nameCompany) async {
    String ranomID = "0";
    for (int i = 0; i < 9; i++) {
      final random = Random().nextInt(100);
      ranomID += random.toString();
    }
    try {
      await _repositoryService.addCompany(
          Company_model(id_company: ranomID, name: nameCompany + Random().nextInt(100).toString()));
      getListCompanyData = await getListCompany();
      rebuildUi();
    } catch (e) {
      erroreDataRepository();
    }
  }

  Future<List<Company_model>> getListCompany() async {
    try {
      final List<Company_model> result = (await _repositoryService
              .getAllCompany())
          .map<Company_model>(
              (e) => Company_model(id_company: e.id_company, name: e.name))
          .toList();
      // dataModels!.getListCompany = result;
      getListCompanyData = result;
      return result;
    } catch (e) {
      erroreDataRepository();
      throw Exception();
    }
  }

  void clearCompany() async {
    try {
      final List<Companyobj> result =
          (await _repositoryService.getAllCompany()).toList();
      for (Companyobj company in result) {
        await _repositoryService.deleteCompany(company);
      }
      rebuildUi();
    } catch (e) {
      erroreDataRepository();
    }
  }

  /// Errore data to registration
  void erroreRegistration({String? messageErrore}) {
    _dialogService.showCustomDialog(
      variant: DialogType.error,
      title: 'Errore!',
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

  void erroreDataRepository() {
    _dialogService.showCustomDialog(
      variant: DialogType.error,
      title: 'Warning!',
      description: 'Give stacked stars.',
    );
  }
}
