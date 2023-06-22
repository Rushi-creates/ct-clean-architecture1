import 'package:flutter/material.dart';

class CreateProfileSingleton {
/* -------------------------------------------------------------------------- */
/*                           //! making it singleton                          */
/* -------------------------------------------------------------------------- */
  CreateProfileSingleton._();
  static final instance = CreateProfileSingleton._();

  // static final CreateProfileSingleton _instance =
  //     CreateProfileSingleton._internal();

  // CreateProfileSingleton._internal();

  // factory CreateProfileSingleton.instance {
  //   return _instance;
  // }

/* -------------------------------------------------------------------------- */
/*                //! State variable, that dont need ui rebuild               */
/* -------------------------------------------------------------------------- */
// dont use it for screens, that has only one screen
// there you can pass states as class arguments
// use when you have alot of separate stateless widget of same screen,
// remember , this will only rebuild ui based on initial state of screen
// if you want to rebuild ui, while the screen lifecycle is running, then use bloc
// other advantages of bloc,is that it is testable, unlike this
// just use this class for storing static varaibles

  bool isFromProfileScreen = false;

  void setIsFromProfileScreen(bool value) => isFromProfileScreen = value;
/* -------------------------------------------------------------------------- */
/*                            //! Static variables                            */
/* -------------------------------------------------------------------------- */
//which will never change, just written here for separation

  final createFormKey = GlobalKey<FormState>();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController bioController = TextEditingController();

  usernameValidator(value) {
    if (value == null || value.isEmpty) {
      return 'Username connot be empty';
    }
    return null;
  }

  bioValidator(value) {
    if (value == null || value.isEmpty) {
      return 'Bio cannot be empty';
    }
    return null;
  }
}
