import 'package:flutter/material.dart';
import 'package:lettutor/ui/components/custom_input_form_field.dart';
import 'package:lettutor/ui/components/custom_text_form_field.dart';

class TutorRegCVForm extends StatefulWidget {
  const TutorRegCVForm({Key? key}) : super(key: key);

  @override
  _TutorRegCVFormState createState() => _TutorRegCVFormState();
}

class _TutorRegCVFormState extends State<TutorRegCVForm> {
  final TextEditingController _expController = TextEditingController();
  final TextEditingController _interController = TextEditingController();
  final TextEditingController _proController = TextEditingController();
  final TextEditingController _langController = TextEditingController();

  //final snackBar = SnackBar(content: Text('email ou mot de passe incorrect'));
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Color btnColor = Theme.of(context).buttonColor;
    Color priColor = Theme.of(context).primaryColor;
    TextTheme textTheme = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Students will view this information on your profile to decide if you're a good fit for them.",
                style: textTheme.caption,
              ),
              SizedBox(height: 12),
              Text("Interests", style: textTheme.headline4),
              CustomInputFormField(
                controller: _interController,
                obscureText: false,
                keyboardType: TextInputType.multiline,
                maxLines: 3,
              ),
              SizedBox(height: 12.0),
              Text("Experience", style: textTheme.headline4),
              SizedBox(height: 5),
              CustomInputFormField(
                controller: _expController,
                obscureText: false,
                keyboardType: TextInputType.text,
                maxLines: 5,
              ),
              SizedBox(height: 12.0),
              Text("Current or Previous Profession", style: textTheme.headline4),
              SizedBox(height: 5),
              CustomInputFormField(
                controller: _proController,
                obscureText: false,
                keyboardType: TextInputType.text,
                maxLines: 5,
              ),
              SizedBox(height: 12.0),
              Text("Languages I speak", style: textTheme.headline4),
              SizedBox(height: 5),
              CustomTextFormField(
                controller: _langController,
                labelText: "Languages",
                icon: Icons.language,
                obscureText: false,
                keyboardType: TextInputType.text,
              ),
              SizedBox(height: 15.0),
              Center(
                child: ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      print("Sign Up is not validated");
                    }
                    //Get.to(ChoiceScreen());
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                    child: Text(
                      "Save",
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.headline3,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
