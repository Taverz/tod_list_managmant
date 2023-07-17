import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:tod_list_managmant/app/locatorconfig.dart';

// import 'locator.config.dart';

final locator = GetIt.instance;

@injectableInit
// Future<void> setupLocator()async  => await GetItInjectableX(locator).init(); // $initGetIt(locator);
Future<void> setupLocator()async  => $initGetIt(locator);