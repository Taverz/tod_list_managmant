import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
// import 'package:handling_network_connectivity/app/app.locator.dart';
// import 'package:handling_network_connectivity/utils/enums.dart';
import 'package:stacked_services/stacked_services.dart';

enum SnackbarType { positive, negative }

Future<void> setupSnackBarUI(GetIt locator) async {
  await locator.allReady();
  final service = locator<SnackbarService>();
  // Registers a config to be used when calling showSnackbar
  service.registerCustomSnackbarConfig(
    variant: SnackbarType.positive,
    config: SnackbarConfig(
      backgroundColor: Colors.green,
      textColor: Colors.white,
      snackPosition: SnackPosition.TOP,
      snackStyle: SnackStyle.GROUNDED,
      borderRadius: 48,
      icon: const Icon(
        Icons.info,
        color: Colors.white,
        size: 20,
      ),
    ),
  );
  service.registerCustomSnackbarConfig(
    variant: SnackbarType.negative,
    config: SnackbarConfig(
      backgroundColor: Colors.red,
      textColor: Colors.white,
      snackPosition: SnackPosition.BOTTOM,
      snackStyle: SnackStyle.GROUNDED,
      borderRadius: 48,
      icon: const Icon(
        Icons.info,
        color: Colors.white,
        size: 20,
      ),
    ),
  );
}
