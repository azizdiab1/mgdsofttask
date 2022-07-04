import 'package:flutter/material.dart';

Widget DefaultButton({
  double width = double.infinity,
  double height = 62,
  Color background = Colors.blue,
  Color color = Colors.white,
  double size=20,
  required Function onpressed,
  required String text,
  bool isUpperCase=false,
}) =>
    Container(
      width: width,
      height: height,

      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(15)),
          color: background
      ),
      child: MaterialButton(
        onPressed: (){onpressed();},
        child: Center(
            child: Text(
              isUpperCase? text.toUpperCase():text,
              style: TextStyle(
                color: color,
                fontSize: size,
              ),
            )),
      ),
    );