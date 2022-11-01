import 'package:eziline_school_management/Class%20data/menuScreen.dart';
import 'package:eziline_school_management/utils/utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../../../ForgetPassword.dart';
import '../../../components/already_have_an_account_acheck.dart';
import '../../../constants.dart';
import '../../Signup/signup_screen.dart';
//import 'ForgetPassword.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({
    Key? key,
  }) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var spinner = false;

  ValueNotifier<bool> _obsecurePass = ValueNotifier<bool>(true);

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailController.dispose();
    _obsecurePass.dispose();
    passwordController.dispose();
  }

  // final double height = MediaQuery.of(context).size.height * 1;
  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: spinner,
      child: Container(
        height: MediaQuery.of(context).size.height * .5,
        child: Column(
          children: [
            TextFormField(
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
              cursorColor: kPrimaryColor,
              onSaved: (email) {},
              decoration: InputDecoration(
                fillColor: Colors.grey,
                filled: true,
                hintText: "Your email",
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(defaultPadding),
                  child: Icon(Icons.email_outlined),
                ),
              ),
            ),
            ValueListenableBuilder(
                valueListenable: _obsecurePass,
                builder: (context, value, child) {
                  return Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: defaultPadding),
                    child: TextFormField(
                      controller: passwordController,
                      textInputAction: TextInputAction.done,
                      obscureText: _obsecurePass.value,
                      cursorColor: kPrimaryColor,
                      decoration: InputDecoration(
                        suffixIcon: InkWell(
                            onTap: () {
                              _obsecurePass.value = !_obsecurePass.value;
                            },
                            child: _obsecurePass.value
                                ? Icon(Icons.visibility_off_rounded)
                                : Icon(Icons.visibility)),
                        hintText: "Your password",
                        prefixIcon: Padding(
                          padding: const EdgeInsets.all(defaultPadding),
                          child: Icon(Icons.lock),
                        ),
                      ),
                    ),
                  );
                }),

            const SizedBox(height: defaultPadding),
            Hero(
              tag: "login_btn",
              child: ElevatedButton(
                onPressed: () async {
                  setState(() {
                    // spinner = true;
                  });

                  await FirebaseAuth.instance
                      .signInWithEmailAndPassword(
                          email: emailController.text,
                          password: passwordController.text)
                      .then((value) {
                    setState(() {
                      Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (context) => menu()));
                      spinner = false;
                    });
                    //beautiful UI snackbar
                    show_Icon_Flushbar(context);
                  }).onError((error, stackTrace) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text("Invalid Email or Password"),
                    ));
                  });
                },
                child: Text(
                  "Login".toUpperCase(),
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            //
            const SizedBox(height: defaultPadding),
            AlreadyHaveAnAccountCheck(
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return SignUpScreen();
                    },
                  ),
                );
              },
            ),
            MaterialButton(
                child: Text("Forgot Password"),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ForgetPassword()));
                }),
          ],
        ),
      ),
    );
  }
}
