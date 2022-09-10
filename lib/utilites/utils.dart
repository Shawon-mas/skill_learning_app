import 'package:flutter/material.dart';

class Utils{

static void fieldFocusedChage(BuildContext context,FocusNode current,FocusNode next){
  current.unfocus();
  FocusScope.of(context).requestFocus(next);
}

  static snackBar(String message,BuildContext context){
    return ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.redAccent,
            content: Text(message))
    );
  }
}
