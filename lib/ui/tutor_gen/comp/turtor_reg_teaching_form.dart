import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lettutor/ui/components/custom_input_form_field.dart';
import 'package:lettutor/ui/components/custom_text_form_field.dart';
import 'package:lettutor/ui/tutor_gen/comp/specialities_list.dart';
import 'package:lettutor/utils/routes/routes.dart';

class TutorRegTeachingForm extends StatefulWidget {
  const TutorRegTeachingForm({Key? key}) : super(key: key);

  @override
  _TutorRegTeachingFormState createState() => _TutorRegTeachingFormState();
}

class _TutorRegTeachingFormState extends State<TutorRegTeachingForm> {
  final TextEditingController _introController = TextEditingController();

  //final snackBar = SnackBar(content: Text('email ou mot de passe incorrect'));
  final _formKey = GlobalKey<FormState>();

  var _currencies = [
    "Beginner",
    "Intermediate",
    "Advanced",
  ];
  var _currentSelectedValue = "Beginner";

  List<String> specList = [
    "English for kids",
    'English for Business',
    'Conversational',
    'STARTERS',
    'MOVERS',
    'FLYERS',
    'KET',
    'PET',
    'IELTS',
    'TOEFL',
    "TOEIC"
  ];

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
              SizedBox(height: 12),
              Text("Introduction", style: textTheme.headline4),
              SizedBox(height: 5),
              CustomInputFormField(
                controller: _introController,
                obscureText: false,
                keyboardType: TextInputType.text,
                maxLines: 5,
              ),
              SizedBox(height: 12.0),
              Text("I am best at teaching students who are", style: textTheme.headline4),
              SizedBox(height: 5),
              FormField<String>(
                builder: (FormFieldState<String> state) {
                  return InputDecorator(
                    decoration: InputDecoration(
                        errorStyle:
                            TextStyle(color: Colors.redAccent, fontSize: 16.0),
                        hintText: 'Please select expense',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15))),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        value: _currentSelectedValue,
                        isDense: true,
                        onChanged: (String? newValue) {
                          setState(() {
                            _currentSelectedValue = newValue!;
                            state.didChange(newValue);
                          });
                        },
                        items: _currencies.map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ),
                  );
                },
              ),
              SizedBox(height: 12.0),
              Text("My specialties are", style: textTheme.headline4),
              SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Flexible(child: SpecicalitiesList()..listSpec = specList),
                ],
              ),
              SizedBox(height: 10),
              Center(
                child: ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      print("Teaching form");
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
