part of 'login_cubit.dart';


abstract class LoginState {}

class LoginInitial extends LoginState {}
class LoginLoadingState extends LoginState {}
class LoginSuccessState extends LoginState {
 final LoginModel loginModel;

  LoginSuccessState(this.loginModel);
}
class LoginErrorState extends LoginState {
  final String messsage;

  LoginErrorState(this.messsage);
}
class LoginChangePassVisibiltyState extends LoginState {}