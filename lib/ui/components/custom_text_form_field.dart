import 'package:flutter/material.dart';
import 'package:lettutor/utils/ex.dart';

class CustomTextFormField extends StatelessWidget {
  final String labelText;
  final IconData icon;
  final bool obscureText;
  final keyboardType;
  final controller;

  const CustomTextFormField(
      {required this.labelText,
        required this.icon,
        required this.obscureText,
        required this.keyboardType,
        this.controller})
      : super();

  @override
  Widget build(BuildContext context) {
    Color priColor = Theme.of(context).primaryColor;
    return TextFormField(
        controller: controller,
        obscureText: obscureText,
        autofocus: false,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          hoverColor: Theme.of(context).accentColor,
          prefixIcon: Icon(
            icon,
            color: priColor,
            size: 32.0, /*Color(0xff224597)*/
          ),
          prefixIconConstraints: BoxConstraints(minWidth: 50),
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