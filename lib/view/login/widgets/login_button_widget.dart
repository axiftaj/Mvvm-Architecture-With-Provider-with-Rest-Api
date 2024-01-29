import 'package:flutter/material.dart';
import 'package:mvvm/data/response/status.dart';
import 'package:mvvm/utils/routes/routes_name.dart';
import 'package:mvvm/view/login/login_view.dart';
import 'package:mvvm/view_model/login/auth_view_model.dart';
import 'package:mvvm/view_model/services/session_manager/session_controller.dart';
import 'package:provider/provider.dart';
import '../../../res/components/round_button.dart';
import '../../../utils/app_validator.dart';
import '../../../utils/utils.dart';
import '../../../view_model/services/storage/local_storage.dart';

class LoginButtonWidget extends StatelessWidget {
  const LoginButtonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthViewModel>(
        builder: (context, provider, child){
          return RoundButton(
            title: 'Login',
            loading: provider.loginLoading ? true : false,
            onPress: (){

              if(provider.email.isEmpty){
                Utils.flushBarErrorMessage('Please enter email', context);
              }else if(!AppValidator.emailValidator(provider.email.toString())){
                Utils.flushBarErrorMessage('Please enter valid email', context);
              }else if(provider.password.isEmpty){
                Utils.flushBarErrorMessage('Please enter password', context);
              }else if(provider.password.length < 6){
                Utils.flushBarErrorMessage('Please enter 6 digit password', context);
              }else {


                Map data = {
                  'email' : provider.email.toString(),
                  'password' : provider.password.toString(),
                };

                // Map data = {
                //   'email' : 'eve.holt@reqres.in',
                //   'password' : 'cityslicka',
                // };


              // Map data = {
              //   'email' : 'eve.holt@reqres.in',
              //   'password' : 'cityslicka',
              // };

              provider.loginApi(data).then((value)async{
                Navigator.pushNamed(context, RoutesName.home);
              }).onError((error, stackTrace){
                Utils.flushBarErrorMessage(error.toString(), context);
              });


              }
            },
          );
        }
    );
  }
}
