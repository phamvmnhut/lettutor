import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';

import 'package:lettutor/controller/auth.dart';

import '../components/background.dart';
import 'comp/or_divider.dart';
import 'comp/social_network.dart';
import '../components/custom_text_form_field.dart';

class SignInUI extends StatefulWidget {
  @override
  _SignInUIState createState() => _SignInUIState();
}

class _SignInUIState extends State<SignInUI> {
  final TextEditingController _pwdCtrl = TextEditingController();
  final TextEditingController _emailCtrl = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  final _viewCtrl = AuthCtrl.to;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Material(
      child: SafeArea(
        child: KeyboardDismisser(
          child: Background(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "SIGN IN",
                    style: Theme.of(context).textTheme.headline2,
                  ),
                  SizedBox(height: size.height * 0.03),
                  SvgPicture.asset(
                    "assets/icons/signup.svg",
                    height: size.height * 0.35,
                  ),
                  SizedBox(height: size.height * 0.03),
                  _buildSignInForm(context),
                  OrDivider(),
                  SocialNetWork()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Form _buildSignInForm(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 10.0, top: 5.0),
              child: Align(
                alignment: Alignment.topRight,
                child: Material(
                  color: Colors.transparent,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      InkWell(
                        onTap: () {
                          _viewCtrl.navigateConfirmEmail();
                        },
                        child: Text(
                          "Confirm email now",
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              fontStyle: FontStyle.italic,
                              color: Colors.grey[700]),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 5.0),
            CustomTextFormField(
                controller: _emailCtrl,
                labelText: "Email address",
                icon: Icons.email,
                obscureText: false,
                keyboardType: TextInputType.emailAddress),
            SizedBox(height: 12.0),
            CustomTextFormField(
                controller: _pwdCtrl,
                labelText: "Password",
                icon: Icons.lock,
                obscureText: true,
                keyboardType: TextInputType.text),
            Padding(
              padding: const EdgeInsets.only(right: 10.0, top: 10.0),
              child: Align(
                  alignment: Alignment.topRight,
                  child: Material(
                    color: Colors.transparent,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        InkWell(
                          onTap: () {
                            _viewCtrl.navigateForgotPassword();
                          },
                          child: Text(
                            "Forgot password ?",
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey[700]),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            _viewCtrl.navigateSignUp();
                          },
                          child: Text(
                            "Create new account",
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey[700]),
                          ),
                        ),
                      ],
                    ),
                  )),
            ),
            SizedBox(height: 15.0),
            ElevatedButton(
              onPressed: () async {
                if (_formKey.currentState!.validate()) {
                  await _viewCtrl.loginUser(_emailCtrl.text, _pwdCtrl.text);
                }
              },
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                child: Text(
                  "Sign In",
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headline3,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
