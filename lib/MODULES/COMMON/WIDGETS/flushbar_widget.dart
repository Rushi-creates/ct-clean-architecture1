import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';

class MyFlushBar {
  static Future topFlushbar(context) async {
    await Flushbar(
      flushbarPosition: FlushbarPosition.TOP,
      backgroundColor: Colors.green,
      title: 'Post created',
      message: 'Post added to your profile',
      duration: const Duration(seconds: 3),
    ).show(context);
  }
}
