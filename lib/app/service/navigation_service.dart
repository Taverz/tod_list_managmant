import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@injectable
class NavigationServiceWW {
  final GlobalKey<NavigatorState> navigatorKey =
      new GlobalKey<NavigatorState>();

  Future<dynamic> navigateTo(String routeName, {dynamic arguments}) {
    return navigatorKey.currentState!
        .pushNamed(routeName, arguments: arguments);
  }

  void goBack() {
    return navigatorKey.currentState!.pop();
  }
}
