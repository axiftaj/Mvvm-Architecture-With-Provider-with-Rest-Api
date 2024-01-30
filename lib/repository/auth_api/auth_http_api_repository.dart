import 'package:mvvm/data/network/base_api_services.dart';
import 'package:mvvm/data/network/network_api_services.dart';
import 'package:mvvm/model/user_model.dart';
import 'package:mvvm/configs/app_url.dart';
import 'auth_repository.dart';

class AuthHttpApiRepository implements AuthRepository {

  final BaseApiServices _apiServices = NetworkApiService() ;

  @override
  Future<UserModel> loginApi(dynamic data )async{
    dynamic response = await _apiServices.getPostApiResponse(AppUrl.loginEndPint, data);
    return UserModel.fromJson(response) ;
  }


}