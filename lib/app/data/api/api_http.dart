import 'dart:convert';

import 'api.dart';

import 'package:http/http.dart' as http;

//TODO: timeOut settings

class ApiAdapterHttpW implements IApiAdapter {
  // late final Http http;

  // ApiAdapterHttpW._(this.http);
  ApiAdapterHttpW() {
    // return ApiAdapterHttpW._(Http());
  }

  final int _timeOutReq = 5;

  @override
  Future<List<ResultApiModelDataW>> get({
    required Map<String, String> headers,
    required String urll,
  }) async {
    try {
      // headers['Content-Type'] = 'application/json';
      // headers['Accept'] = 'application/json';
      // headers['Authorization'] = 'Bearer $_token';
      final uri = Uri.parse(urll);
      final response = await http
          .get(
            uri,
            headers: headers,
          )
          .timeout(Duration(seconds: _timeOutReq));
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');
      // TODO: mirror
      final decodedResponse =
          jsonDecode(utf8.decode(response.bodyBytes)) as Map;
    } catch (e) {}
    throw UnimplementedError();
  }

  @override
  Future<List<ResultApiModelDataW>> post({
    required Map<String, String> headers,
    required Map? body,
    required String urll,
  }) async {
    try {
      // headers['Content-Type'] = 'application/json';
      // headers['Accept'] = 'application/json';
      // headers['Authorization'] = 'Bearer $_token';
      final uri = Uri.parse(urll);
      final response = await http
          .post(
            uri,
            body: body,
            headers: headers,
          )
          .timeout(Duration(seconds: _timeOutReq));
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');
      // TODO: mirror
      final decodedResponse =
          jsonDecode(utf8.decode(response.bodyBytes)) as Map;
    } catch (e) {}

    throw UnimplementedError();
  }

  dynamic exceptionHandler() {}
}
