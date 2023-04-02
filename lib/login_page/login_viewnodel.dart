

import 'package:stacked/stacked.dart';

class LoginViewModel extends BaseViewModel {
  // final _bottomSheetService = locator<BottomSheetService>();

  
  bool? confirmWriteData({required String password, required String login}){
    if(password != "" || password.length < 3){
      return false;
    }
    if(login != "" || !login.contains("@")){
      return false;
    }
    return true;
  }
}