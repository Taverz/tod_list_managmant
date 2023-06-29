import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_messaging/firebase_messaging.dart' as firebase;

class GoogleFirebasePush {
  static init() async {
    await Firebase.initializeApp();
    await FirebaseMessaging.instance.requestPermission();
    String? tokenn = await FirebaseMessaging.instance.getToken();
  }

  static googleFirebasePushBack() {
    FirebaseMessaging.onBackgroundMessage(_myBackgroundHandler);
  }

  static googleFirebasePushForeground(
      Function(Map<String, dynamic>) callback) async {
    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );
    // FirebaseMessaging.onBackgroundMessage(myBackgroundHandler);
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      // newPushMessage(message.data);
      callback(message.data);
    });
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      // newPushMessage(message.data);
      callback(message.data);
    });
  }

  static googleFirebasePushForegroundMain(
      Function(dynamic) eventPushForegruound) async {
    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );
    // FirebaseMessaging.onBackgroundMessage(myBackgroundHandler);
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      // newPushMessage(message.data);
      _newPushMessageBack(message.data);
    });
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      // newPushMessage(message.data);
      _newPushMessageBack(message.data);
    });
  }

  static Future<void> _myBackgroundHandler(
      firebase.RemoteMessage message) async {
    _newPushMessageBack(message.data);
  }

  static _newPushMessageBack(Map<String, dynamic> message) {
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
            _saveTokenAuthServer(tokAuth, newUser);
          } else {
            String tokAuth = msgOSType == 'notification'
                ? message['token']
                : message[msgOSType]['token'];
            String newUser = msgOSType == 'notification'
                ? message['isNew']
                : message[msgOSType]['isNew'];
            _saveTokenAuthServer(tokAuth, newUser);
          }
        }
        break;
      default:
        {}
        break;
    }
  }

  static _saveTokenAuthServer(String tokenAuth, String newUser) async {
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
    // Navigator.pushNamedAndRemoveUntil(contKey!.currentContext!,'/',(_) => false);
  }
}
