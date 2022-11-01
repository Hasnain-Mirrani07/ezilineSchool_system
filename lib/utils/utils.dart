import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class utlis {
  static toastmessage(String message) {
    Fluttertoast.showToast(msg: message);
  }
}

void show_Icon_Flushbar(BuildContext context) {
  Flushbar(
    icon: Icon(
      Icons.email_outlined,
      color: Colors.white,
      size: 30,
    ),
    backgroundColor: Color(0xFF0277BD),
    duration: Duration(seconds: 4),
    message: "This email is already registered.",
    messageSize: 18,
    titleText: Text("Flushbar with Icon.",
        style: TextStyle(
            fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white)),
  )..show(context);
}

final snackBar = SnackBar(
  content: Text(' Hey! I am a SnackBar message.'),
  action: SnackBarAction(
    label: 'Undo',
    onPressed: () {
      // Write your code to undo the change.
    },
  ),
);
//than show where we want to show write
//Scaffold.of(context).showSnackBar(snackBar);    or  2nd method

//static snakBar(String message, BuildContext context) {
//   return ScaffoldMessenger.of(context)
//       .showSnackBar(SnackBar(content: Text(message)));
// }

//  final snackBar = SnackBar(
//                   content: Text(
//                     state.reviewAddResponse.message,
//                     textScaleFactor: 1.0,
//                   ),
//                   duration: Duration(seconds: 4),
//                   action: SnackBarAction(
//                     label: localizations!.getLocalization("ok_dialog_button"),
//                     onPressed: () {
//                       Navigator.of(context).pop();
//                     },
//                   ),
//                 );
//                 ScaffoldMessenger.of(context).showSnackBar(snackBar);
