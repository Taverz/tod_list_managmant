// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:stacked_services/stacked_services.dart';
import 'package:tod_list_managmant/app/route.dart';
// import 'package:tod_list_managmant/app/route.dart';

// import '../service/navigation_service.dart';

extension GetItInjectableX on _i1.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  Future<_i1.GetIt> init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  })async {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.lazySingleton<DialogService>(() => DialogService());
    gh.lazySingleton<SnackbarService>(() => SnackbarService());
    gh.lazySingleton<NavigationService>(() => NavigationService()); 
    gh.lazySingleton<AppRouter>(() => AppRouter());
    return this;
  }
}
