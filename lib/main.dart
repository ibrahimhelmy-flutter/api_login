import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/blocs/login_cubit.dart';
import 'package:shop_app/data/remote/dio_helper.dart';
import 'package:shop_app/presentation/screens/login_screen.dart';
import 'package:shop_app/shared/app_route.dart';
import 'package:shop_app/shared/cashe_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();

  DioHelper.init();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return BlocProvider<LoginCubit>(
      create: (context) => LoginCubit(),
      child: MaterialApp(
          debugShowCheckedModeBanner: false,

          home: LoginScreen(),
          onGenerateRoute: AppRouter.onGenerateRouting,
          initialRoute: LoginScreen.id
      ),
    );
  }
}
