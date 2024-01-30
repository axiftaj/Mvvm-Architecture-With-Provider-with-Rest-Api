import 'package:mvvm/model/user_model.dart';

import 'auth_repository.dart';


class AuthMockApiRepository implements AuthRepository  {

  @override
  Future<UserModel> loginApi(dynamic data )async{
    await Future.delayed(const Duration(seconds: 2));
    var data = {
      'token' : 'a23z345xert'
    };
    return UserModel.fromJson(data) ;
  }

}