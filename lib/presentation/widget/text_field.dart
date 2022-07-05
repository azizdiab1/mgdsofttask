import 'package:flutter/material.dart';


Widget DefaultTextField({
  required TextEditingController controller,
  required String labeltext,
  TextInputType? tybe,
  required  Function validate,
  IconData? sufix ,
  Function? suffiexPressed,
}) =>
    TextFormField(
      controller: controller,
      keyboardType: tybe,
      decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: '$labeltext',
         ),
      validator: (s) {
        validate(s);
      },
    );