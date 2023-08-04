import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
// import 'package:tod_list_managmant/app/locator.dart';

extension TestAppMOdule on GetIt {
  void setup() {
    // getIt.registerSingleton<AppModel>(AppModel());
    registerSingleton<AppModel>(AppModelImplementation());
  }
}

abstract class AppModel extends ChangeNotifier {}

class AppModelImplementation extends AppModel {
  int _counter = 0;

  AppModelImplementation() {
    // var ter =  locator.get<AppModelImplementation>();
    /// lets pretend we have to do some async initialization
    // Future.delayed(Duration(seconds: 2)).then((_) => ter.setCount = 23 );
  }

  @override
  // ignore: override_on_non_overriding_member
  int get counter => _counter;

  void set setCount(int value) => _counter;

  @override
  // ignore: override_on_non_overriding_member
  void incrementCounter() {
    _counter++;
    notifyListeners();
  }
}
