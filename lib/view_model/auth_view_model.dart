

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:mvvm/model/user_model.dart';
import 'package:mvvm/respository/auth_repository.dart';
import 'package:mvvm/utils/routes/routes_name.dart';
import 'package:mvvm/utils/utils.dart';
import 'package:mvvm/view_model/services/session_manager/session_controller.dart';
import 'package:mvvm/view_model/user_view_model.dart';
import 'package:provider/provider.dart';

import '../data/response/api_response.dart';

class AuthViewModel with ChangeNotifier {

  // importing auth repository to access the auth APIs
  final _myRepo = AuthRepository();

  bool _signUpLoading = false ;
  bool get signUpLoading => _signUpLoading ;

  bool _loginLoading = false ;
  bool get loginLoading => _loginLoading ;

  setLoginLoading(bool value){
    _loginLoading = value;
    notifyListeners();
  }

  //creating getter method to store value of input email
  String _email = '' ;
  String get email => _email ;

  setEmail(String email){
    _email = email ;
  }

  //creating getter method to store value of input password
  String _password = '' ;
  String get password => _password ;

  setPassword(String password){
    _password = password ;
  }



  setSignUpLoading(bool value){
    _signUpLoading = value;
    notifyListeners();
  }

  Future<UserModel> loginApi(dynamic data) async {

    try {
      setLoginLoading(true);
      final response = await _myRepo.loginApi(data);
      await SessionController().saveUserInPreference(response);
      await SessionController().getUserFromPreference();
      setLoginLoading(false);
      return response ;
    }catch(e){
      setLoginLoading(false);
      throw Exception(e);
    }

  }


  Future<void> signUpApi(dynamic data , BuildContext context) async {

    setSignUpLoading(true);

    _myRepo.signUpApi(data).then((value){
      setSignUpLoading(false);
      Utils.flushBarErrorMessage('SignUp Successfully', context);
      Navigator.pushNamed(context, RoutesName.home);
      if(kDebugMode){
        print(value.toString());

      }
    }).onError((error, stackTrace){
      setSignUpLoading(false);
      Utils.flushBarErrorMessage(error.toString(), context);
      if(kDebugMode){
        print(error.toString());
      }

    });
  }

}