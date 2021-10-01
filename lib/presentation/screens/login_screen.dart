import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/blocs/login_cubit.dart';
import 'package:shop_app/shared/component.dart';

class LoginScreen extends StatelessWidget {
  static const String id = "/login";

  // const LoginScreen({Key? key}) : super(key: key);
  var emailController = TextEditingController();
  var passController = TextEditingController();
  var globalKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {},
      builder: (context, state) {
        var login = LoginCubit.get(context);
        return Scaffold(
          extendBodyBehindAppBar: true,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            systemOverlayStyle: const SystemUiOverlayStyle(
                statusBarColor: Colors.blue,
                statusBarIconBrightness: Brightness.light),
          ),
          body: SingleChildScrollView(
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Stack(
                children: [
                  Positioned(
                      right: 0,
                      top: 0,
                      left: 0,
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: 150,
                        decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(60))),
                        child: Center(
                            child: Text(
                          "Welcome To Dalilee Customer ApPlication",
                          style: TextStyle(color: Colors.white,fontSize: 18),
                        )),
                      )),
                  Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Form(
                      key: globalKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            "assets/images/dalilee logo.png",
                            width: 200,
                          ),

                          SizedBox(height: 40),
                          TextFormField(
                            controller: emailController,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Should Not Be Empty";
                              }
                            },
                            decoration: InputDecoration(
                              labelText: "User Name",
                              prefixIcon: Icon(Icons.phone_android),
                              border: OutlineInputBorder(),
                            ),
                          ),
                          SizedBox(height: 20),
                          TextFormField(
                              controller: passController,
                              obscureText: login.isPassword,
                              validator: (value) {
                                if (value!.length < 3) {
                                  return "Password Too Short";
                                }
                              },
                              decoration: InputDecoration(
                                  labelText: " password",
                                  prefixIcon: Icon(Icons.lock_outline),
                                  suffixIcon: IconButton(
                                      onPressed: () {
                                        login.changePasswordVisibilty();
                                      },
                                      icon: Icon(login.isPassword
                                          ? Icons.visibility_off_outlined
                                          : Icons.visibility_outlined)),
                                  border: OutlineInputBorder())),
                          SizedBox(height: 50),
                          state is! LoginLoadingState
                              ? defaultButton(
                                  function: () {
                                    if (globalKey.currentState!.validate()) {
                                      LoginCubit.get(context).userLogin(
                                          email: emailController.text,
                                          password: passController.text,
                                          context: context);
                                    }
                                  },
                                  text: "Sign In")
                              : Center(
                                  child: CircularProgressIndicator(),
                                ),
                          // Center(child: Text(login.errorMessage)),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    right: 0,
                    bottom: 20,
                    left: 0,
                    child: Column(
                      children: [
                        Text("device_name :  Redmi Note 6 Pro"),
                        Text("device_id :  17sl-rzvx-rqwe-3k7p"),

                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
