import 'package:flutter/material.dart';
import 'package:lettutor/utils/ex.dart';

class CustomInputFormField extends StatelessWidget {
  final String? labelText;
  final bool obscureText;
  final TextInputType keyboardType;
  final TextEditingController controller;
  final int maxLines;

  const CustomInputFormField(
      {this.labelText,
        required this.obscureText,
        required this.keyboardType,
        required this.maxLines,
        required this.controller})
      : super();

  @override
  Widget build(BuildContext context) {
    Color priColor = Theme.of(context).primaryColor;
    return TextFormField(
        controller: controller,
        obscureText: obscureText,
        autofocus: false,
        keyboardType: keyboardType,
        maxLines: maxLines,
        decoration: InputDecoration(
          hoverColor: Theme.of(context).accentColor,
          labelText: labelText,
          labelStyle: Theme.of(context).textTheme.caption,
          hintText: '',
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(15)),
              borderSide: BorderSide(width: 2, color: priColor)),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(15)),
              borderSide: BorderSide(width: 1, color: priColor.darker())),
        ),
        validator: (val) {
          if (val!.isEmpty) {
            return 'This field is not empty';
          }
        });
  }
}