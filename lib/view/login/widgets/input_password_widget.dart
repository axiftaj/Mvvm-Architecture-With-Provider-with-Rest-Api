import 'package:flutter/material.dart';
import 'package:mvvm/view_model/login/login_view_model.dart';
import 'package:provider/provider.dart';

class InputPasswordWidget extends StatelessWidget {
   InputPasswordWidget({Key? key ,required this.focusNode}) : super(key: key);

  final FocusNode focusNode;
  final ValueNotifier<bool> _obSecurePassword = ValueNotifier<bool>(true);

  @override
  Widget build(BuildContext context) {
    return Consumer<LoginViewModel>(
        builder: (context, provider, child){
          return ValueListenableBuilder(
              valueListenable: _obSecurePassword,
              builder: (context , value, child){
                return TextFormField(
                  obscureText: _obSecurePassword.value,
                  focusNode: focusNode,
                  obscuringCharacter: "*",
                  decoration: InputDecoration(
                    hintText: 'Password',
                    labelText: 'Password',
                    prefixIcon: const Icon(Icons.lock_open_rounded),
                    suffixIcon: InkWell(
                        onTap: (){
                          _obSecurePassword.value = !_obSecurePassword.value ;
                        },
                        child: Icon(
                            _obSecurePassword.value ?  Icons.visibility_off_outlined :
                            Icons.visibility
                        )),
                  ),
                  onChanged: (value){
                    provider.setPassword(value);
                  },
                );

              }
          );
        }
    );
  }
}