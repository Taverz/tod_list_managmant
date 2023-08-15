

import 'api.dart';

//TODO: timeOut settings
class ApiAdapterDioW  implements IApiAdapter{
  // late final Object data;

  // ApiAdapterDioW._(this.data);
  ApiAdapterDioW(){
    // return ApiAdapterDioW._(Object());
  }
  
  @override
  Future<List<ResultApiModelDataW>> get({required Map<String, String> headers,
      required String urll,}) {
    // TODO: implement get
    throw UnimplementedError();
  }
  
  @override
  Future<List<ResultApiModelDataW>> post({required Map<String, String> headers,
      required Map? body,
      required String urll,}) async {
    // final Map<String, String> myHeader = headers;
    // // myHeader['Content-Type'] = 'application/json';
    // // myHeader['Accept'] = 'application/json';
    // // myHeader['Authorization'] = 'Bearer $_token';
    // Dio dioW = Dio();
    // (dioW.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
    //     (HttpClient dioClient) {
    //   dioClient.badCertificateCallback =
    //       ((X509Certificate cert, String host, int port) => true);
    //   return dioClient;
    // };
    // dioW.options = BaseOptions(headers: myHeader);
    // try {
    //   final ress = await dioW.post(
    //     urll,
    //     // headers: {
    //     //   'Authorization': 'Bearer $token',
    //     //   'dev': appDetails['dev']!,
    //     //   'version': '${appDetails['version']!}.${appDetails['build']!}',
    //     // },
    //     data: body,
    //   );
    //   return ress;
    // } on DioException catch (ex) {
    //   // if (e is DioError) {}
    //   if (ex.type == DioExceptionType.connectionTimeout) {

    //     throw Exception();
    //   } else if (ex.type == DioExceptionType.badResponse) {

    //     throw Exception();
    //   } else if (ex.type == DioExceptionType.receiveTimeout) {

    //     throw Exception();
    //   } else if (ex.type == DioExceptionType.sendTimeout) {

    //     throw Exception();
    //   } else if (ex.type == DioExceptionType.connectionError) {

    //     throw Exception();
    //   } else if (ex.type == DioExceptionType.cancel) {

    //     throw Exception();
    //   } else if (ex.type == DioExceptionType.unknown) {

    //     throw Exception();
    //   } else {

    //     throw Exception();
    //   }
    // }
// TODO: mirror

    throw Exception();
  }

}



// mixin ApiPostW extends ApiW {
//   Future<dynamic> post({required Map<String, String> headers,
//       required Map? body,
//       required String urll}) async {
//     final Map<String, String> myHeader = headers;
//     // myHeader['Content-Type'] = 'application/json';
//     // myHeader['Accept'] = 'application/json';
//     // myHeader['Authorization'] = 'Bearer $_token';
//     Dio dioW = Dio();
//     (dioW.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
//         (HttpClient dioClient) {
//       dioClient.badCertificateCallback =
//           ((X509Certificate cert, String host, int port) => true);
//       return dioClient;
//     };
//     dioW.options = BaseOptions(headers: myHeader);
//     try {
//       final ress = await dioW.post(
//         urll,
//         // headers: {
//         //   'Authorization': 'Bearer $token',
//         //   'dev': appDetails['dev']!,
//         //   'version': '${appDetails['version']!}.${appDetails['build']!}',
//         // },
//         data: body,
//       );
//       return ress;
//     } on DioException catch (ex) {
//       // if (e is DioError) {}
//       if (ex.type == DioExceptionType.connectionTimeout) {

//         throw Exception();
//       } else if (ex.type == DioExceptionType.badResponse) {

//         throw Exception();
//       } else if (ex.type == DioExceptionType.receiveTimeout) {

//         throw Exception();
//       } else if (ex.type == DioExceptionType.sendTimeout) {

//         throw Exception();
//       } else if (ex.type == DioExceptionType.connectionError) {

//         throw Exception();
//       } else if (ex.type == DioExceptionType.cancel) {

//         throw Exception();
//       } else if (ex.type == DioExceptionType.unknown) {

//         throw Exception();
//       } else {

//         throw Exception();
//       }
//     }
//   }
// }