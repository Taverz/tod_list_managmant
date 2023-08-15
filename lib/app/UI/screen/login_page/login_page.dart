import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:tod_list_managmant/app/UI/common/appconstant.dart';

import 'login_viewnodel.dart';

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
              _content(viewModel),
            ],
          ),
        ),
      ),
    );
  }

  Widget _title() {
    return const Column(
      children: [
        ImageIcon(
          appIconLogoBig,
          size: sizeIcon,
        ),
        Text(
          appwordsLogin,
          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 28),
        ),
      ],
    );
  }

  Widget _content(LoginViewModel viewModel) {
    final TextEditingController _controllerLogin = TextEditingController();
    final TextEditingController _controllerPassword = TextEditingController();
    return ViewModelBuilder<LoginViewModel>.reactive(
        viewModelBuilder: () => viewModel,
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
                      name: appwordsEmail,
                      validator: emailValid,
                      noValideMessage: appwordsNoLogin,
                    ),
                  ),

                  /// Password
                  Container(
                    margin: const EdgeInsets.all(marginWidget),
                    child: _textField(
                      textEditingController: _controllerPassword,
                      name: appwordsPassword,
                      validator: passwordValid,
                      noValideMessage: appwordsNoPassword,
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
        // TapEventNOMany().taoEvent(tapAccess: (){
        model.navigateRegistration();
        //  });
      },
      child: Container(
        margin: const EdgeInsets.all(15),
        child: const Text(appwordsRegistration),
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
              borderSide: BorderSide(color: appcolorSurfaceColor),
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
            color: appcolorSecondaryColor,
          ),
          child: const Center(
              child: Text(
            appwordsAuthorization,
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
          )),
        ),
      ),
    );
  }
}
