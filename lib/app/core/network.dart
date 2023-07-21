
import 'dart:js_interop';

import 'package:connectivity_plus/connectivity_plus.dart';

abstract class NetworkInfoInterface {
  bool get isConnect;
}

class NetworkInfo implements NetworkInfoInterface {
  final Connectivity connectionChecker; //= Connectivity();  

  NetworkInfo(this.connectionChecker);

  @override 
  bool get isConnect {
    // throw UnimplementedError();
    /// Conect ==  true
    final bool connect = connectionChecker.isDefinedAndNotNull;
    return connect;
  }
}