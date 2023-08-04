import 'package:connectivity_plus/connectivity_plus.dart';

abstract class NetworkInfoInterface {
  Future<bool> isConnectGet();
}

class NetworkInfo implements NetworkInfoInterface {
  final Connectivity connectionChecker; //= Connectivity();

  NetworkInfo(this.connectionChecker);

  @override
  Future<bool> isConnectGet() async {
    // throw UnimplementedError();
    /// Conect ==  true
    final ConnectivityResult connect =
        await connectionChecker.checkConnectivity();
    bool result = false;
    if (connect == ConnectivityResult.mobile) {
      result = true;
    } else if (connect == ConnectivityResult.ethernet) {
      result = true;
    } else if (connect == ConnectivityResult.wifi) {
      result = true;
    } else if (connect == ConnectivityResult.vpn) {
      result = true;
    }
    return result;
  }
}
