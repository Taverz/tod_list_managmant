import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';


extension TestAppMOdule on GetIt {
  void setup() {
    // getIt.registerSingleton<AppModel>(AppModel());
    registerSingleton<AppModel>(AppModelImplementation());
  }  
}


abstract class AppModel extends ChangeNotifier {

}

class AppModelImplementation extends AppModel {
  int _counter = 0;

  AppModelImplementation() {
    var ter = GetIt.I.get<AppModelImplementation>();
    /// lets pretend we have to do some async initialization
    Future.delayed(Duration(seconds: 2)).then((_) => ter.setCount = 23 );
  }

  @override
  int get counter => _counter;

  void set setCount(int value) =>_counter ;

  @override
  void incrementCounter() {
    _counter++;
    notifyListeners();
  }
}