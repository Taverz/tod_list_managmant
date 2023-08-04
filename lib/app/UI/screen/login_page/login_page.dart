// import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:stacked/stacked.dart';

import '../../../constapp/colorsapp.dart';
import '../../../constapp/icond.dart';
import '../../../constapp/words_app.dart';
import 'login_viewnodel.dart';

// @RoutePage<String>(name: "LoginPage")
class LoginPageView extends StackedView<LoginViewModel> {
  //extends HookWidget {
  LoginPageView({Key? key}) : super(key: key);

  final _fromKey = GlobalKey<FormState>();
  final RegExp emailValid =
      RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
  final RegExp passwordValid = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9]");
  static const int minimuLenghtSimbvol = 5;
  static const double sizeIcon = 80;
  static const double circularBorder = 8;
  static const double marginWidget = 10;

  @override
  LoginViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      LoginViewModel();

  @override
  Widget builder(
    BuildContext context,
    LoginViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _title(),
              _content(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _title() {
    return Column(
      children: const [
        ImageIcon(
          IconsApp.logoBig,
          size: sizeIcon,
        ),
        Text(
          WordsApp.login,
          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 28),
        ),
      ],
    );
  }

  Widget _content() {
    final TextEditingController _controllerLogin = useTextEditingController();
    final TextEditingController _controllerPassword =
        useTextEditingController();
    return ViewModelBuilder<LoginViewModel>.reactive(
        viewModelBuilder: () => LoginViewModel(),
        builder: (context, model, childWidget) {
          return Container(
            constraints: const BoxConstraints(
              minHeight: 50,
              minWidth: 150,
              maxWidth: 600,
              maxHeight: 600,
            ),
            padding: const EdgeInsets.all(20),
            child: Form(
              key: _fromKey,
              child: Column(
                children: [
                  /// Login
                  Container(
                    margin: const EdgeInsets.all(marginWidget),
                    child: _textField(
                      textEditingController: _controllerLogin,
                      name: WordsApp.email,
                      validator: emailValid,
                      noValideMessage: WordsApp.noLogin,
                    ),
                  ),

                  /// Password
                  Container(
                    margin: const EdgeInsets.all(marginWidget),
                    child: _textField(
                      textEditingController: _controllerPassword,
                      name: WordsApp.password,
                      validator: passwordValid,
                      noValideMessage: WordsApp.noPassword,
                      visibleContentField: false,
                    ),
                  ),

                  Container(
                    margin: const EdgeInsets.all(marginWidget),
                    child: _buttonConfirm(
                      onTap: () async {
                        if (_fromKey.currentState !=
                            null) if (!_fromKey.currentState!.validate()) {
                          return;
                        }
                        await model.loginConfirm(
                          password: _controllerPassword.text,
                          login: _controllerLogin.text,
                        );
                      },
                    ),
                  ),

                  _registration(model),
                ],
              ),
            ),
          );
        });
  }

  Widget _registration(LoginViewModel model) {
    return InkWell(
      onTap: () {
        model.navigateRegistration();
      },
      child: Container(
        margin: const EdgeInsets.all(15),
        child: Text(WordsApp.registration),
      ),
    );
  }

  Widget _textField({
    required TextEditingController textEditingController,
    required String name,
    required RegExp validator,
    required String noValideMessage,
    bool visibleContentField = true,
  }) {
    return Column(
      children: [
        Text(
          name,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
        ),
        TextFormField(
          controller: textEditingController,
          obscureText: !visibleContentField,
          validator: (value) {
            if (value == null) {
              return noValideMessage;
            }
            final bool vaild = validator.hasMatch(value);
            if (vaild) {
              if (value.length < minimuLenghtSimbvol) {
                return noValideMessage;
              }
              return null;
            }
            return null;
          },
          decoration: const InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(circularBorder)),
              borderSide: BorderSide(color: AppColors.surfaceColor),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buttonConfirm({required Function() onTap}) {
    return Container(
      constraints: const BoxConstraints(
        minHeight: 40,
        minWidth: 150,
        maxWidth: 200,
        maxHeight: 70,
      ),
      child: InkWell(
        onTap: () => onTap(),
        child: Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(circularBorder)),
            color: AppColors.secondaryColor,
          ),
          child: const Center(
              child: Text(WordsApp.authorization,
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18))),
        ),
      ),
    );
  }
}
