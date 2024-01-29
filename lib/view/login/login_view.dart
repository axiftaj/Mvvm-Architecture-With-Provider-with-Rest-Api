import 'package:flutter/material.dart';
import 'package:mvvm/utils/routes/routes_name.dart';
import 'package:mvvm/view/login/widgets/input_email_widget.dart';
import 'package:mvvm/view/login/widgets/input_password_widget.dart';
import 'package:mvvm/view/login/widgets/login_button_widget.dart';


class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {

  final emailFocusNode = FocusNode();
  final passwordFocusNode = FocusNode();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailFocusNode.dispose();
    passwordFocusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {

    final height  = MediaQuery.of(context).size.height * 1 ;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            InputEmailWidget(focusNode: emailFocusNode, passwordFocusNode: passwordFocusNode),
            InputPasswordWidget(focusNode: passwordFocusNode),
            SizedBox(height: height * .085,),
            const LoginButtonWidget(),
            SizedBox(height: height * .02,),
            InkWell(
                onTap: (){
                  Navigator.pushNamed(context, RoutesName.signUp);
                },
                child: const Text("Don't have an accont? Sign Up"))

          ],
        ),
      ),
    );
  }
}

