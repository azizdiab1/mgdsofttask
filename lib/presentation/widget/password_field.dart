import 'package:flutter/material.dart';

Widget DefaultPasswordField({
  required TextEditingController controller,
  required String labeltext,
  TextInputType? tybe,

  bool isPassword = true,
  required  Function validate,
  IconData? sufix ,
  Function? suffiexPressed,
}) =>
    TextFormField(
      controller: controller,
      obscureText: isPassword,
      keyboardType: TextInputType.visiblePassword,
      autocorrect: false,
      decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: '$labeltext',
          suffixIcon: IconButton(onPressed: (){suffiexPressed!();}, icon: Icon(sufix))),
      validator: (s) {
        validate(s);
      },
    );