import 'dart:async';
import 'package:flutter/material.dart';
import 'package:mvvm/view_model/services/session_manager/session_controller.dart';
import '../../../configs/routes/routes_name.dart';


class SplashServices {

  void checkAuthentication(BuildContext context)async{

    SessionController().getUserFromPreference().then((value)async{

      if(SessionController().isLogin.toString() == 'true'){
        Timer(const Duration(seconds: 2),
              () =>
          Navigator.pushNamedAndRemoveUntil(context, RoutesName.home, (route) => false),
        );
      }else {
        Timer(const Duration(seconds: 2),
              () =>
          Navigator.pushNamedAndRemoveUntil(context, RoutesName.login, (route) => false),
        );

      }

    }).onError((error, stackTrace){

      Timer(const Duration(seconds: 2),
            () =>
        Navigator.pushNamedAndRemoveUntil(context, RoutesName.login, (route) => false),
      );

    });

  }



}