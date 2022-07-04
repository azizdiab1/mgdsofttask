import 'package:flutter/material.dart';

Widget DefaultEmailField({
  required TextEditingController controller,
  TextInputType? tybe,
  required  Function validate,
  String? hintText,
  String? labelText,


}) =>
    TextFormField(
      controller: controller,
      keyboardType: tybe,
      decoration: InputDecoration(
        labelText: labelText ,
        hintText: hintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),


      ),
      validator: (s) {
        validate(s);
      },
    );