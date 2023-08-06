

class FirebaseGoogleAuth {

  Future<void> _anonymousAuth() async {
    // setIsLoading();

    try {
      // await auth.signInAnonymously();
    } on FirebaseAuthException catch (e) {

    } catch (e) {

    } finally {
      // setIsLoading();
    }
  }

  Future _resetPassword() async {
    String? email;
    await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Send'),
            ),
          ],
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text('Enter your email'),
              const SizedBox(height: 20),
              TextFormField(
                onChanged: (value) {
                  email = value;
                },
              ),
            ],
          ),
        );
      },
    );

    if (email != null) {
      try {
        await auth.sendPasswordResetEmail(email: email!);
        ScaffoldSnackbar.of(context).show('Password reset email is sent');
      } catch (e) {
        ScaffoldSnackbar.of(context).show('Error resetting');
      }
    }
  }

   Future<void> _emailAndPassword() async {
    if (formKey.currentState?.validate() ?? false) {
      if (mode == AuthMode.login) {
        await auth.signInWithEmailAndPassword(
          email: emailController.text,
          password: passwordController.text,
        );
      } else if (mode == AuthMode.register) {
        await auth.createUserWithEmailAndPassword(
          email: emailController.text,
          password: passwordController.text,
        );
      } else {
        await _phoneAuth();
      }
    }
  }


  Future<void> _phoneAuth() async {
    if (mode != AuthMode.phone) {
      setState(() {
        mode = AuthMode.phone;
      });
    } else {
      if (kIsWeb) {
        final confirmationResult =
            await auth.signInWithPhoneNumber(phoneController.text);
        final smsCode = await getSmsCodeFromUser(context);

        if (smsCode != null) {
          await confirmationResult.confirm(smsCode);
        }
      } else {
        await auth.verifyPhoneNumber(
          phoneNumber: phoneController.text,
          verificationCompleted: (_) {},
          verificationFailed: (e) {
            setState(() {
              error = '${e.message}';
            });
          },
          codeSent: (String verificationId, int? resendToken) async {
            final smsCode = await getSmsCodeFromUser(context);

            if (smsCode != null) {
              // Create a PhoneAuthCredential with the code
              final credential = PhoneAuthProvider.credential(
                verificationId: verificationId,
                smsCode: smsCode,
              );

              try {
                // Sign the user in (or link) with the credential
                await auth.signInWithCredential(credential);
              } on FirebaseAuthException catch (e) {
                setState(() {
                  error = e.message ?? '';
                });
              }
            }
          },
          codeAutoRetrievalTimeout: (e) {
            setState(() {
              error = e;
            });
          },
        );
      }
    }
  }


   Future<void> _signInWithGoogle() async {
    // Trigger the authentication flow
    final googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final googleAuth = await googleUser?.authentication;

    if (googleAuth != null) {
      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      // Once signed in, return the UserCredential
      await auth.signInWithCredential(credential);
    }
  }

  Future<void> _signInWithTwitter() async {
    TwitterAuthProvider twitterProvider = TwitterAuthProvider();

    if (kIsWeb) {
      await auth.signInWithPopup(twitterProvider);
    } else {
      await auth.signInWithProvider(twitterProvider);
    }
  }



}