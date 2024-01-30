import 'package:mvvm/data/network/BaseApiServices.dart';
import 'package:mvvm/data/network/NetworkApiService.dart';
import 'package:mvvm/model/user_model.dart';
import 'package:mvvm/res/app_url.dart';
import 'package:mvvm/respository/auth_api/auth_repository.dart';

class AuthApiRepository implements AuthRepository {

  final BaseApiServices _apiServices = NetworkApiService() ;

  @override
  Future<UserModel> loginApi(dynamic data )async{
    dynamic response = await _apiServices.getPostApiResponse(AppUrl.loginEndPint, data);
    return UserModel.fromJson(response) ;
  }


}