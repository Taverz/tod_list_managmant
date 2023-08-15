// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../common/appconstant.dart';
import '../../widget/bug_many_tap.dart';
import 'registration_viewmodel.dart';

class RegistrationPageView extends StackedView<RegistrationViewModel> {
  // extends HookWidget {
  RegistrationPageView({Key? key}) : super(key: key);

  final _fromKey = GlobalKey<FormState>();
  final RegExp emailValid =
      RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
  final RegExp passwordValid = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9]");
  static const int minimuLenghtSimbvol = 5;
  static const double sizeIcon = 80;
  static const double circularBorder = 8;
  static const double marginWidget = 10;

  /// State this page
  /// 1 Login view
  /// - 2 Loading
  /// 3 Code write
  /// 4 Registration fields

  @override
  RegistrationViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      RegistrationViewModel();

  @override
  Widget builder(
    BuildContext context,
    RegistrationViewModel viewModel,
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
        Text(appwordsLogin,
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 28)),
      ],
    );
  }

  Widget _content(RegistrationViewModel viewModel) {
    return ViewModelBuilder<RegistrationViewModel>.reactive(
        viewModelBuilder: () => viewModel,
        builder: (context, RegistrationViewModel model, childWidget) {
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
                  !(model.statePage == StateRegistration.LoginWriteFromCodeReq)
                      ? SizedBox()
                      : _loginFromReqCode(model),
                  !(model.statePage == StateRegistration.CodeWriteConfirm)
                      ? SizedBox()
                      : _codeWirteConfirm(model),
                  !(model.statePage == StateRegistration.RegistrationField)
                      ? SizedBox()
                      : _registrationField(model),
                  _loginPage(model),
                ],
              ),
            ),
          );
        });
  }

  final TextEditingController _controllerName = TextEditingController();
  final TextEditingController _controllerLogin = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();
  final TextEditingController _controllerCode = TextEditingController();
  Widget _loginFromReqCode(RegistrationViewModel model) {
    return Column(
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

        Container(
          margin: const EdgeInsets.all(marginWidget),
          child: _buttonConfirm(
            titleButton: appwordsRequestCode,
            onTap: () async {
               // TapEventNOMany().taoEvent(tapAccess: (){ 
              if (_fromKey.currentState != null) if (!_fromKey.currentState!
                  .validate()) {
                return;
              }
              await model.registrationRequestCode(
                email: _controllerLogin.text,
              );
              // });
            },
          ),
        ),
      ],
    );
  }

  Widget _loginPage(RegistrationViewModel model) {
    return InkWell(
      onTap: () {
        // TapEventNOMany().taoEvent(tapAccess: (){ 
          model.navigateLogin();
        // });
      },
      child: Container(
        margin: const EdgeInsets.all(15),
        child:const Text(appwordsLogin),
      ),
    );
  }

  Widget _codeWirteConfirm(RegistrationViewModel model) {
    return Column(
      children: [
        /// Code
        Container(
          margin: const EdgeInsets.all(marginWidget),
          child: _textField(
            textEditingController: _controllerCode,
            name: appwordsCode,
            validator: passwordValid,
            noValideMessage: appwordsNoPassword,
          ),
        ),
        Container(
          margin: const EdgeInsets.all(marginWidget),
          child: _buttonConfirm(
            titleButton: appwordsConfirm,
            onTap: () async {
              if (_fromKey.currentState != null) if (!_fromKey.currentState!
                  .validate()) {
                return;
              }
              model.writeCode(
                _controllerCode.text,
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _registrationField(RegistrationViewModel model) {
    return Column(
      children: [
        /// Login
        Container(
          margin: const EdgeInsets.all(marginWidget),
          child: _textField(
            textEditingController: _controllerLogin,
            name:appwordsEmail,
            validator: emailValid,
            noValideMessage: appwordsNoLogin,
          ),
        ),

        /// Name
        Container(
          margin: const EdgeInsets.all(marginWidget),
          child: _textField(
            textEditingController: _controllerName,
            name: appwordsNaemField,
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
            titleButton: appwordsAuthorization,
            onTap: () async {
              if (_fromKey.currentState != null) if (!_fromKey.currentState!
                  .validate()) {
                return;
              }
              await model.registration(
                email: _controllerLogin.text,
                name: _controllerName.text,
                password: _controllerPassword.text,
              );
            },
          ),
        ),
      ],
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
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
        ),
        TextFormField(
          controller: textEditingController,
          obscureText: visibleContentField,
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

  Widget _buttonConfirm(
      {required Function() onTap, required String titleButton}) {
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
          child: Center(
              child: Text(titleButton,
                  style: const TextStyle(
                      fontWeight: FontWeight.w500, fontSize: 18))),
        ),
      ),
    );
  }
}
