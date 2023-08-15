import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tod_list_managmant/app/data/model/user_model.dart';

void main() {
  test('User model test', () {
    final modelUserErrore = User_model(
      id_user: "dj239dn238d2n39d2n",
      login: "login",
      password: "passwd",
      name: "name",
      email: "email",
    );
    final modelUserConfirmed= User_model(
      id_user: "dj239dn238d2n39d2n",
      login: "loginTyoewk",
      password: "password123456AWs@",
      name: "name",
      email: "login@gmail.com",
    );


  });
}
