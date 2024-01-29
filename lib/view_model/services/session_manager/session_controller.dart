import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:mvvm/model/user_model.dart';
import '../../user_view_model.dart';

//singleton class
class SessionController {

  SharedPreferenceClass sharedPreferenceClass = SharedPreferenceClass();
  static final SessionController _session = SessionController._internel();

  bool? isLogin;
  UserModel user = UserModel();

  factory SessionController() {
    return _session;
  }

  SessionController._internel() {
    // here we can initialize the values
    isLogin = false;
  }

  // saving data into shared prefrences
  Future<void> saveUserInPreference(dynamic user) async {
    sharedPreferenceClass.setValue('token', jsonEncode(user));
    sharedPreferenceClass.setValue('isLogin', 'true');
  }



  //getting User Data from shared Preference
   Future<void> getUserFromPreference() async {

    try {
      var userData = await sharedPreferenceClass.readValue('token')!;
      var isLogin = await sharedPreferenceClass.readValue('isLogin')!;


      if (userData.isNotEmpty) {
        SessionController().user = UserModel.fromJson(jsonDecode(userData));
        // print(SessionController().user.data!.userDetails!.maxPosition.toString());
      }
      SessionController().isLogin = isLogin == 'true'  ? true : false;
    } catch (e) {
      debugPrint(e.toString());
    }
  }


}
