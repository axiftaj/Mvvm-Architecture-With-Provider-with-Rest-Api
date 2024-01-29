import 'package:flutter/material.dart';
import 'package:mvvm/view_model/auth_view_model.dart';
import 'package:provider/provider.dart';
import '../../../utils/utils.dart';


class InputEmailWidget extends StatelessWidget {
  final FocusNode focusNode , passwordFocusNode;
  const InputEmailWidget({Key? key ,required this.focusNode , required this.passwordFocusNode}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthViewModel>(
        builder: (context, provider, child){
          return TextFormField(
            keyboardType: TextInputType.emailAddress,
            focusNode: focusNode,
            decoration: const InputDecoration(
                hintText: 'Email',
                labelText: 'Email',
                prefixIcon: Icon(Icons.alternate_email)
            ),
            onFieldSubmitted: (value){
              Utils.fieldFocusChange(context, focusNode, passwordFocusNode);
            },
            onChanged: (value){
              provider.setEmail(value);
            },
          );
        }
    );
  }
}

