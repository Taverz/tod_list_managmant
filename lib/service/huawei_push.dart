import 'dart:convert';

import 'package:flutter/services.dart';
// import 'package:huawei_push/huawei_push.dart' as Channel;
import 'package:huawei_push/huawei_push.dart';

class HuaweiPush {
  void initPushHuawei() async {
    assert((){
      Push.enableLogger();
      return true;
    }());
    // Push.setAutoInitEnabled(true);
    await Push.turnOnPush();
  }

  void listenerToken(
    Function(String) token,
    Function(String) errore,
  ) {
    Push.getTokenStream.listen((tokenData) {

      token(tokenData);
    }, onError: (Object objectErrore) {
      PlatformException e = objectErrore as PlatformException;
      errore(e.message.toString());
    });
  }

  Future<void> getToken() async {
    String? aaiid = await Push.getAAID();
    Push.getToken(aaiid ?? "");
  }

  void removeBackgroundMessageHandler() async {
    await Push.removeBackgroundMessageHandler();
  }

  void _onTokenEvent(dynamic event) {
    String token = event.toString();

  }

  void _onTokenError(Object error) {
    PlatformException e = error as PlatformException;
  }

  void _onNewIntent(String? intentString) {
    // For navigating to the custom intent page (deep link) the custom
    // intent that sent from the push kit console is:
    // app://app2
    intentString = intentString ?? '';
    if (intentString != '') {
      List<String> parsedString = intentString.split('://');
      if (parsedString[1] == 'app2') {}
    }
  }

  void _onIntentError(Object err) {
    PlatformException e = err as PlatformException;
  }

  Future<void> initPlatformStateHuawei() async {}

  /// В шторку если свернуто, при открытии вызовется
  void onNotificationOpenedApp() {
    Push.onNotificationOpenedApp.listen(_onNotificationOpenedApp);
  }

  void _onNotificationOpenedApp(dynamic initialNotification) {
    if (initialNotification != null && initialNotification is Map) {
      // authorization
      Map<String, dynamic> _opo = initialNotification["extras"]; // extras
      _newPushMessageBack(_opo);
    }
  }

  /// В приложение если открыто
  void onNotificationInformationOpenedApp(Function(String) callbackDataPush) {
    /// Приходят пушки информационные
    Push.onMessageReceivedStream.listen((event) {
      print("HUAWEI onMessageReceivedStream " + event.data.toString());
      if (event.data != null) {
        Map<String, dynamic> _nap = json.decode(event.data!);
        callbackDataPush(event.data!);
        //  _newPushMessageBack(_nap);
      }
    });
  }

  /// В приложение если открыто
  void onNotificationInformationOpenedApp2(Function(String) callbackDataPush) {
    /// Приходят пушки информационные
    Push.onMessageReceivedStream.listen((event) {
      if (event.data != null) {
        Map<String, dynamic> _nap = json.decode(event.data!);
        _newPushMessageBack(_nap);
      }
    });
  }

  void backgrounMessage(Function(String) callbackDataPush) async {
    try {
      bool? backgroundMessageHandler =
          await Push.registerBackgroundMessageHandler(
              (RemoteMessage objectpush) {
        if (objectpush.data != null) {
          final String stringJson = objectpush.data.toString();
          final Map jsonDataBig = json.decode(stringJson);
          final Map<String, dynamic> jsonCropData = {
            "data": {"isNew": 0, "token": "", "type": "send_auth_notify"},
          };
          _newPushMessageBack(jsonCropData);
        }
      });
    } catch (e) {}
  }

  static _newPushMessageBack(Map<String, dynamic> message) {
    // print("new BACGROUND PushMessage KK " + message.toString());
    late String msgOSType;
    if (message.containsKey('data')) {
      // Handle data message
      msgOSType = 'data';
    } else {
      msgOSType = 'notification';
    }

    String? msgType = msgOSType == 'notification'
        ? message['type']
        : message[msgOSType]['type'];

    switch (msgType) {
      case "send_auth_notify":
        {
          if (msgOSType == 'notification') {
            String tokAuth = msgOSType == 'notification'
                ? message['token']
                : message[msgOSType]['token'];
            String newUser = msgOSType == 'notification'
                ? message['isNew']
                : message[msgOSType]['isNew'];
            _setTokenAuthPush(tokAuth, newUser);
          } else {
            String tokAuth = msgOSType == 'notification'
                ? message['token']
                : message[msgOSType]['token'];
            String newUser = msgOSType == 'notification'
                ? message['isNew']
                : message[msgOSType]['isNew'];
            _setTokenAuthPush(tokAuth, newUser);
          }
        }
        break;
      default:
        {
          print("new BACGROUND PushMessage DEFAULT");
        }
        break;
    }
  }

  static _setTokenAuthPush(String tokenAuth, String newUser) async {
    // await FlutterStorage.deleteAuthToken();
    // await FlutterStorage.saveAuthToken(tokenAuth);

    // if (newUser == "1") {
    //   await FlutterStorageRegistration.saveAuthToken(true);
    // } else {
    //   await FlutterStorageRegistration.saveAuthToken(false);
    // }
    _restartApp();
  }

  static void _restartApp() async {
    // Restart.restartApp();
    //  Navigator.pushNamedAndRemoveUntil(contKey!.currentContext!,'/',(_) => false);
  }

  void _backgroundMessageCallback(RemoteMessage? remoteMessage) async {
    if (remoteMessage != null) {
      String? data = remoteMessage.data;
      if (data != null) {
        Push.localNotification(
          <String, String>{
            HMSLocalNotificationAttr.TITLE: '[Headless] DataMessage Received',
            HMSLocalNotificationAttr.MESSAGE: data,
          },
        );
      } else {}
    }
  }

  void getInitialNotification() async {
    final dynamic initialNotification = await Push.getInitialNotification();
  }
}
