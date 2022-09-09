import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Utils {
  static void filedFocusChange(
      BuildContext context, FocusNode current, FocusNode nextFocus) {
    current.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }

  static void filedChange(BuildContext context, FocusNode current,
      FocusNode nextFocus, FocusNode nextFocus2) {
    current.unfocus();
    FocusScope.of(context).nextFocus();
  }

  static toastMessage(String message) {
    Fluttertoast.showToast(
      msg: message,
      backgroundColor: Colors.black,
      textColor: Colors.white,

      // toastLength: Toast.LENGTH_LONG
    );
  }

  static snackBar(String message, BuildContext context, Color color) {
    return ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(backgroundColor:color, content: Text(message)));
  }
}






// extension EmailValidator on String {
//   bool isValidEmail() {
//     return RegExp(
//             r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
//         .hasMatch(this);
//   }
// }



            // VxAnimatedBox()
            //     .size(context.screenWidth, context.screenHeight)
            //     .withGradient(const LinearGradient(
            //         colors: [Colors.deepOrange, Colors.deepPurple],
            //         begin: Alignment.topLeft,
            //         end: Alignment.bottomRight))
            //     .make(),