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
          suffixIcon: IconButton(onPressed: (){suffiexPressed!();}, icon: Icon(sufix))),
      validator: (s) {
        validate(s);
      },
    );