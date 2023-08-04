import 'package:flutter_test/flutter_test.dart';
import 'package:tod_list_managmant/app/core/app.locator.dart';

import '../helpers/test_helpers.dart';

void main() {
  group('AlertSheetModel Tests -', () {
    setUp(() => registerServices());
    tearDown(() => locator.reset());
  });
}
