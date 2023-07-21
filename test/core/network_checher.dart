import 'dart:js_interop';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tod_list_managmant/app/core/network.dart';

class MockDataCpnnectionChecker extends Mock implements Connectivity {}

void main() {
  late NetworkInfo networkInfo;
  late MockDataCpnnectionChecker mockDataConnectionChecker;

  setUp(() {
    mockDataConnectionChecker = MockDataCpnnectionChecker();
    networkInfo = NetworkInfo(mockDataConnectionChecker);
  });

  group(
    'isConnected',
    () async {
      test('should forward connection result data true', () async{
        final bool tHanasConnectionFuture = true;

        final bool result = networkInfo.isConnect;
        verify(()=>mockDataConnectionChecker.isDefinedAndNotNull); //.called(true);
        expect(result, tHanasConnectionFuture);
      },);
    },
  );
}
