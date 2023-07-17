

import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:tod_list_managmant/app/core/route.dart';
// import 'package:tod_list_managmant/app/routegr.dart';xs

import '../service/navigation_service.dart';


GetIt $initGetIt(
  GetIt get, {
  String? environment,
  EnvironmentFilter? environmentFilter,
}) {
  final gh = GetItHelper(get, environment, environmentFilter);
  gh.lazySingleton<NavigationServiceWW>(() => NavigationServiceWW());
  gh.lazySingleton<NavigationService>(() => NavigationService()); 
  gh.lazySingleton<AppRouter>(() => AppRouter());
  gh.lazySingleton<DialogService>(() => DialogService());
  gh.lazySingleton<SnackbarService>(() => SnackbarService());

  // gh.lazySingleton<AppDatabase>(() => AppDatabase());
  // gh.lazySingleton<CounterService>(() => CounterService());
  // gh.singleton<PostsViewModel>(PostsViewModel());
  return get;
}

