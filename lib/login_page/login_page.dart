import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:stacked/stacked.dart';
import 'package:tod_list_managmant/login_page/login_viewnodel.dart';

import '../constapp/colorsapp.dart';
import '../constapp/icond.dart';

@RoutePage<String>(name: "LoginPage") 
class LoginPageView extends HookWidget {
  const LoginPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: _content(),
      ),
    );
  }

  Widget _content() {
    final TextEditingController _controllerLogin = useTextEditingController();
    final TextEditingController _controllerPassword =
        useTextEditingController();
    return ViewModelBuilder<LoginViewModel>.reactive(
        viewModelBuilder: () => LoginViewModel(),
        builder: (context, model, childWidget) {
          return Column(
            children: [
              const ImageIcon(IconsApp.logoBig),
              _textField(
                  textEditingController: _controllerLogin, name: "login"),
              _textField(
                  textEditingController: _controllerPassword, name: "password"),
              _buttonConfirm(
                onTap: () {
                  bool? result = model.confirmWriteData(
                      password: _controllerPassword.text,
                      login: _controllerLogin.text);
                  if (result == null || result == false) {
                    //TODO: errores
                  } else {
                    //TODO: AutoRoute
                  }
                },
              ),
            ],
          );
        });
  }

  Widget _textField({
    required TextEditingController textEditingController,
    required String name,
  }) {
    return Column(
      children: [
        Text(
          name,
          style: TextStyle(),
        ),
        Container(
          decoration: BoxDecoration(),
          child: TextField(
            controller: textEditingController,
            decoration: const InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(8)),
                borderSide: BorderSide(color: AppColors.surfaceColor),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buttonConfirm({required Function() onTap}) {
    return InkWell(
      onTap: () => onTap(),
      child: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          color: AppColors.secondaryColor,
        ),
        child: Center(child: Text("Confirm")),
      ),
    );
  }
}
