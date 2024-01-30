import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:mvvm/repository/auth_api/auth_http_api_repository.dart';
import 'package:mvvm/repository/auth_api/auth_repository.dart';
import 'package:mvvm/repository/home_api/home_http_api_repository.dart';
import 'package:mvvm/repository/home_api/home_repository.dart';
import 'package:mvvm/view_model/home/home_view_model.dart';
import 'package:mvvm/view_model/login/login_view_model.dart';
import 'package:provider/provider.dart';

import 'configs/routes/routes.dart';
import 'configs/routes/routes_name.dart';

GetIt getIt = GetIt.instance;

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  getIt.registerLazySingleton<AuthRepository>(() => AuthHttpApiRepository());
  getIt.registerLazySingleton<HomeRepository>(() => HomeHttpApiRepository());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => LoginViewModel(authRepository: getIt())),
          ChangeNotifierProvider(create: (_) => HomeViewViewModel(homeRepository: getIt())),

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

