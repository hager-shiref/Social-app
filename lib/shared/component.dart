import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

Widget defaultFormField({
  required TextEditingController controller,
  required TextInputType type,
  Function? onSubmit,
  Function? onTap,
  bool isPassword = false,
  required final validate,
  required String label,
  required IconData prefix,
  IconData? suffix,
  Function? suffixPressed,
  bool isClickable = true,
}) =>
    Padding(
      padding: const EdgeInsets.all(12.0),
      child: TextFormField(
        controller: controller,
        keyboardType: type,
        obscureText: isPassword,
        enabled: isClickable,
        onFieldSubmitted: onSubmit!(),
        onTap: onTap!(),
        validator: validate,
        decoration: InputDecoration(
          labelText: label,
          prefixIcon: Icon(
            prefix,
          ),
          suffixIcon: suffix != null
              ? IconButton(
                  onPressed: () {
                    suffixPressed!();
                  },
                  icon: Icon(
                    suffix,
                  ),
                )
              : null,
          border: const OutlineInputBorder(),
        ),
      ),
    );

//=======================================================================================================================================================

Widget defaultTextButton({
  required Function function,
  required String text,
}) =>
    Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: ElevatedButton(
          style: TextButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 15),
            primary: Colors.white,
            textStyle: const TextStyle(fontSize: 15),
          ),
          onPressed: () {
            function();
          },
          child: Text(text.toUpperCase())),
    );

//=======================================================================================================================================================

void navigateTo(context, widget) => Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => widget,
      ),
    );

//=======================================================================================================================================================

void navigateAndFinish(context, widget) => Navigator.pushAndRemoveUntil(
    context,
    MaterialPageRoute(
      builder: (context) => widget,
    ),
    (Route<dynamic> route) => false);

void showToast({required String txt}) {
  Fluttertoast.showToast(
      msg: txt,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 5,
      textColor: Colors.white,
      fontSize: 16.0);
}
