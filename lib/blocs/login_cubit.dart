import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/presentation/screens/home_layout.dart';
import 'package:shop_app/shared/component.dart';
import 'package:shop_app/shared/endPoints.dart';
import 'package:shop_app/data/models/login_model.dart';
import 'package:shop_app/data/remote/dio_helper.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  static LoginCubit get(context) => BlocProvider.of(context);
  String errorMessage = "";
  LoginModel? loginModel;

  void userLogin(
      {required String email,
      required String password,
      BuildContext? context}) {
    print("start in cubit");
    emit(LoginLoadingState());
    DioHelper.postData(
      url: LOGIN,
      data: {
        "username": email,
        "password": password,
        "device_name":"Redmi Note 6 Pro",
        "device_id":"17sl-rzvx-rqwe-3k7p"
      }
    ).then((value) {
      print("here");
      print(value.data["status"]);
      print(value.data["message"]);
      loginModel = LoginModel.fromjson(value.data);
      if (value.data["status"]=="success") {
        buildShowToast(
          msg: "تم تسجيل الدخول بنجاح", color: Colors.green);

        Navigator.pushReplacementNamed(context!, HomeLayout.id);
      }


      emit(LoginSuccessState(loginModel!));
    }).catchError((error) {
      print("here${error??error.message}\n");
      buildShowToast(
          msg: " أسم المستخدم/كلمة المرور خطأ", color: Colors.red);
      emit(LoginErrorState(error.toString()));
    });
  }

  bool isPassword = true;

  void changePasswordVisibilty() {
    isPassword = !isPassword;
    emit(LoginChangePassVisibiltyState());
  }
}
