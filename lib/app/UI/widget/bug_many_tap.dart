import 'package:flutter/material.dart';

/// Избежать много нажатий на кнопку
// DateTime? dateTime;

class TapEventNOMany {
  static DateTime? dateTime;
  final int intervalSecondTap = 4;
  void taoEvent({
    required VoidCallback tapAccess,
    VoidCallback? tapNoAccess,
  }) {
    if (dateTime == null) {
      dateTime = DateTime.now();
      tapAccess();
      return;
    }
    final int diff = (DateTime.now().difference(dateTime!).inSeconds).toInt() ;
    if (intervalSecondTap < diff) {
      dateTime = null;
      tapAccess();
    } else {
      if (tapNoAccess != null) tapNoAccess();
    }
  }
}
