import 'api.dart';

//TODO: timeOut settings
//TODO: mock data add format map and json file

class ApiAdapterMockDataW implements IApiAdapter {
  // late final MockdataModels mockData;

  // ApiAdapterMockDataW._(this.mockData);
  ApiAdapterMockDataW() {
    // return ApiAdapterMockDataW._(MockdataModels());
  }

  @override
  Future<List<ResultApiModelDataW>> get({
    required Map<String, String> headers,
    required String urll,
  }) {// TODO: mirror
    // TODO: implement get
    throw UnimplementedError();
  }

  @override
  Future<List<ResultApiModelDataW>> post({
    required Map<String, String> headers,
    required Map? body,
    required String urll,
  }) {// TODO: mirror
    // TODO: implement post
    throw UnimplementedError();
  }
}
