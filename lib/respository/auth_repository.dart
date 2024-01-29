import 'package:mvvm/data/network/BaseApiServices.dart';
import 'package:mvvm/data/network/NetworkApiService.dart';
import 'package:mvvm/model/user_model.dart';
import 'package:mvvm/res/app_url.dart';

class AuthRepository  {

  final BaseApiServices _apiServices = NetworkApiService() ;


  Future<UserModel> loginApi(dynamic data )async{
    dynamic response = await _apiServices.getPostApiResponse(AppUrl.loginEndPint, data);
    return UserModel.fromJson(response) ;
  }

  Future<dynamic> signUpApi(dynamic data )async{
    dynamic response = await _apiServices.getPostApiResponse(AppUrl.registerApiEndPoint, data);
    return response ;
  }

}