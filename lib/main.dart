import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:mvvm/respository/auth_api/auth_api_repository.dart';
import 'package:mvvm/respository/auth_api/auth_repository.dart';
import 'package:mvvm/utils/routes/routes.dart';
import 'package:mvvm/utils/routes/routes_name.dart';
import 'package:mvvm/view_model/login/login_view_model.dart';
import 'package:provider/provider.dart';

GetIt getIt = GetIt.instance;

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  getIt.registerLazySingleton<AuthRepository>(() => AuthApiRepository());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => LoginViewModel(authRepository: getIt())),
        ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: RoutesName.splash,
        onGenerateRoute: Routes.generateRoute,
      ),
    );
  }
}

