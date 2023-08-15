

class ResultApiModelDataW {}

// abstract interface
abstract class IApiAdapter {
  Future<List<ResultApiModelDataW>> get({
    required Map<String, String> headers,
    required String urll,
  }) async =>
      throw UnimplementedError();
  Future<List<ResultApiModelDataW>> post({
    required Map<String, String> headers,
    required Map? body,
    required String urll,
  }) async =>
      throw UnimplementedError();
}

abstract class ApiExceptionW implements Exception {}

class ApiExceptionTimeOut extends ApiExceptionW {}

class ApiExceptionServer extends ApiExceptionW {}

class ApiExceptionNetworkDisconnect extends ApiExceptionW {}

class ApiExceptionBadResponse extends ApiExceptionW {}
class ApiExceptionOther extends ApiExceptionW {}
class ApiExceptionConvertResult extends ApiExceptionW {}




class ApiAdapterDioW implements IApiAdapter {
  // late final Object data;

  // ApiAdapterDioW._(this.data);
  ApiAdapterDioW() {
    // return ApiAdapterDioW._(Object());
  }

  @override
  Future<List<ResultApiModelDataW>> get({
    required Map<String, String> headers,
    required String urll,
  }) {
    // TODO: implement get
    throw UnimplementedError();
  }

  @override
  Future<List<ResultApiModelDataW>> post({
    required Map<String, String> headers,
    required Map? body,
    required String urll,
  }) {
    // TODO: implement post
    throw UnimplementedError();
  }
}
