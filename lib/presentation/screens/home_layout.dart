import 'package:flutter/material.dart';
import 'package:shop_app/blocs/login_cubit.dart';
import 'package:shop_app/data/models/login_model.dart';

class HomeLayout extends StatelessWidget {
  static const String id = "/home";

  const HomeLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var model=LoginCubit.get(context).loginModel!;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("message: ${model.message!}"),
            Text("status: ${model.status!}"),
            Text("full_name: ${model.data!.full_name!}"),
            Text("lang: ${model.data!.lang!}"),
            Text("username : ${model.data!.username!}"),
            Text("user_id: ${model.data!.user_id!}"),
            Text("storecode: ${model.data!.storecode!}"),
            Text("access_token: ${model.data!.access_token!}"),

          ],
        ),
      ),
    );
  }
}
