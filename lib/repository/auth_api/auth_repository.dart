import '../../model/user_model.dart';

abstract class AuthRepository {

  Future<UserModel> loginApi(dynamic data);

}