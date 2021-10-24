import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import 'package:lettutor/utils/routes/routes.dart';

import '../components/background.dart';
import 'comp/or_divider.dart';
import 'comp/social_network.dart';
import '../components/custom_text_form_field.dart';

class SignUpUI extends StatelessWidget {
  final TextEditingController _pwdController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  //final snackBar = SnackBar(content: Text('email ou mot de passe incorrect'));
  final _formKey = GlobalKey<FormState>();

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
                  "SIGN UP",
                  style: Theme.of(context).textTheme.headline2,
                ),
                SizedBox(height: size.height * 0.03),
                SvgPicture.asset(
                  "assets/icons/signup.svg",
                  height: size.height * 0.35,
                ),
                SizedBox(height: size.height * 0.03),
                _buildSignUpForm(context),
                SizedBox(height: size.height * 0.03),
                OrDivider(),
                SocialNetWork()
              ],
            ),
          ),
        ),
      ),
    );
  }

  Form _buildSignUpForm(BuildContext context) {
    return Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              CustomTextFormField(
                  controller: _emailController,
                  labelText: "Email address",
                  icon: Icons.email,
                  obscureText: false,
                  keyboardType: TextInputType.emailAddress),
              SizedBox(
                height: 12.0,
              ),
              CustomTextFormField(
                  controller: _pwdController,
                  labelText: "Password",
                  icon: Icons.lock,
                  obscureText: true,
                  keyboardType: TextInputType.text),
              Padding(
                padding: const EdgeInsets.only(right: 25.0, top: 10.0),
                child: Align(
                    alignment: Alignment.topRight,
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        onTap: () {
                          print("For got PW");
                          Navigator.pushNamed(context, Routes.sign_in);
                        },
                        child: Text(
                          "Already have an Account ? ",
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
                    print("Sign Up is not validated");
                  }
                  //Get.to(ChoiceScreen());
                },
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                  child: Text(
                    "Sign Up",
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