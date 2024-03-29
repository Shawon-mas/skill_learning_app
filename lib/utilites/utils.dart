import 'package:another_flushbar/flushbar.dart';
import 'package:another_flushbar/flushbar_route.dart';
import 'package:flutter/material.dart';

class Utils{

static void fieldFocusedChage(BuildContext context,FocusNode current,FocusNode next){
  current.unfocus();
  FocusScope.of(context).requestFocus(next);
}
static void flushBarErrorMessage(String message, BuildContext context){

  showFlushbar(context: context,
    flushbar: Flushbar(
      forwardAnimationCurve:Curves.decelerate,
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      padding: EdgeInsets.all(15),
      message: message,
      duration: Duration(seconds: 3),
      borderRadius: BorderRadius.circular(8),
      flushbarPosition: FlushbarPosition.TOP,
      backgroundColor: Colors.red,
      reverseAnimationCurve: Curves.easeInOut,
      positionOffset: 20,
      icon: Icon(Icons.error , size: 28 , color: Colors.white,),
    )..show(context),

  );

}
  static snackBar(String message,BuildContext context){
    return ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.redAccent,
            content: Text(message))
    );
  }
}
