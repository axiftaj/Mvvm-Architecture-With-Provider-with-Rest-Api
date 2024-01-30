import 'package:flutter/material.dart';
import '../../../configs/routes/routes_name.dart';
import '../../../view_model/services/storage/local_storage.dart';

class LogoutButtonWidget extends StatelessWidget {
  const LogoutButtonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return   InkWell(
        onTap: (){
          LocalStorage localStorage =  LocalStorage();
          localStorage.clearValue('token').then((value){
            Navigator.pushNamed(context, RoutesName.login);
          });
        },
        child: const Center(child: Text('Logout')));

  }
}
