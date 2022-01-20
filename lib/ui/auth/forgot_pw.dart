import 'package:flutter/material.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';

import 'package:lettutor/controller/auth.dart';

import '../components/background.dart';
import '../components/custom_text_form_field.dart';

class ForgotPwUI extends StatelessWidget {

  final TextEditingController _emailCtrl = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  final AuthCtrl _authCtrl = AuthCtrl.to;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Material(
      child: KeyboardDismisser(
        child: Background(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "FORGOT PASSWORRD",
                  style: Theme.of(context).textTheme.headline2,
                ),
                SizedBox(height: size.height * 0.03),
                _buildForgotPwForm(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Form _buildForgotPwForm(BuildContext context) {
    return Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              CustomTextFormField(
                  controller: _emailCtrl,
                  labelText: "Email address",
                  icon: Icons.email,
                  obscureText: false,
                  keyboardType: TextInputType.emailAddress),
              Padding(
                padding: const EdgeInsets.only(right: 25.0, top: 10.0),
                child: Align(
                    alignment: Alignment.topRight,
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        onTap: () {
                          _authCtrl.navigateSignIn();
                        },
                        child: Text(
                          "You just remind ",
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey[700]),
                        ),
                      ),
                    )),
              ),
              SizedBox(
                height: 15.0,
              ),
              ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    _authCtrl.forgotPassword(_emailCtrl.text);
                  }
                },

                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                  child: Text(
                    "Send",
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headline3,
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
