
import 'package:auto_route/annotations.dart';
import 'package:stacked/stacked.dart';


class TodoViewModel extends BaseViewModel {
  List<String> _todo = [];
  List<String> get todos => _todo;

  String _dataTok = "";

  void startupLogic(){
    assert((){
      print("");
      return false;
    }());
  }

  set setDataTok(String vallue) => _dataTok;

  void addTodo(String text){
    _todo.add(text);
    notifyListeners();
  }

}


// class HomeViewModel extends StreamViewModel {
//   final _connectivityService = locator<ConnectivityService>();
//   final _snackbarService = locator<SnackbarService>();
//   final _superheroService = locator<SuperheroService>();
//   final log = getLogger('HomeViewModel');

//   //7
//   SuperheroResponseModel? superHeroDetail;
//   // 3
//   bool connectionStatus = false;
//   bool hasCalled = false;
//   bool hasShownSnackbar = false;

//   // 1
//  Stream<bool> checkConnectivity() async* {
//     yield await _connectivityService.checkInternetConnection();
//   }

//   // 2
//   @override
//   Stream get stream => checkConnectivity();

//   // 4
//   bool get status {
//     stream.listen((event) {
//       connectionStatus = event;
//       notifyListeners();
//   // 5 & 6
//       if (hasCalled == false) getCharacters();
//     });
//     return connectionStatus;
//   }

//   Future<void> getCharacters() async {
//     if (connectionStatus == true) {
//       try {
//         detail = await runBusyFuture(
//           _superheroService.getCharactersDetails(),
//           throwException: true,
//         );
//         // 6b:  We set the 'hasCalled' boolean to true only if the call is successful, which then prevents the app from re-fetching the data
//         hasCalled = true;
//         notifyListeners();
//       } on SocketException catch (e) {
//         hasCalled = true;
//         notifyListeners();
//         // 8
//         _snackbarService.showCustomSnackBar(
//           variant: SnackbarType.negative,
//           message: e.toString(),
//         );
//       } on Exception catch (e) {
//         hasCalled = true;
//         notifyListeners();
//         // 8
//         _snackbarService.showCustomSnackBar(
//           variant: SnackbarType.negative,
//           message: e.toString(),
//         );
//       }
//     } else {
//       log.e('Internet Connectivity Error');
//       if (hasShownSnackbar == false) {
//       // 8
//         _snackbarService.showCustomSnackBar(
//           variant: SnackbarType.negative,
//           message: 'Error: Internet Connection is weak or disconnected',
//           duration: const Duration(seconds: 5),
//         );
//         hasShownSnackbar = true;
//         notifyListeners();
//       }
//     }
//   }

// }





// Scaffold(
//             appBar: AppBar(
//               backgroundColor: viewModel.status ? Colors.green : Colors.red,
//               centerTitle: true,
//               title: const Text(
//                 'Characters List',
//                 style: TextStyle(
//                   fontWeight: FontWeight.bold,
//                   fontSize: 24,
//                   color: Colors.black,
//                 ),
//               ),
//               actions: [
//                 Text(
//                   viewModel.status ? "Online" : "Offline",
//                   style: const TextStyle(color: Colors.black),
//                 )
//               ],
//             ),
//         )



