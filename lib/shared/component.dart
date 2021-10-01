import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

Widget defaultButton({
  double width = double.infinity,
  Color background = Colors.blue,
  bool isUpperCase = true,
  double radius = 3.0,
  required Function function,
  required String text,
}) =>
    Container(
      width: width,
      height: 50.0,
      child: MaterialButton(
        onPressed: () => function(),
        child: Text(
          isUpperCase ? text.toUpperCase() : text,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          radius,
        ),
        color: background,
      ),
    );

Widget defaultFormField({
  required TextEditingController controller,
   TextInputType? type,
  Function? onSubmit,
  Function? onChange,
  required Function onTap,
  bool isPassword = false,
   Function? validate,
  required String label,
   IconData? prefix,
  IconData? suffix,
}) =>
    TextFormField(
      controller: controller,
      keyboardType: type,
      obscureText: isPassword,
      onFieldSubmitted: (val) => onSubmit!(val),
      onChanged: (val) => onChange!(val),
      validator: (val) => validate!(val),
      onTap:()=>onTap(),
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(
          prefix,
        ),
        suffixIcon: suffix != null
            ? Icon(
          suffix,
        )
            : null,
        border: OutlineInputBorder(),
      ),
    );

void buildShowToast({String? msg, Color? color}) {
  Fluttertoast.showToast(
      msg: msg!,
      backgroundColor: color,
      gravity: ToastGravity.BOTTOM,
      fontSize: 16,
      textColor: Colors.white,
      toastLength: Toast.LENGTH_SHORT);
}