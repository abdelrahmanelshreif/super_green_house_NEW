part of 'login_cubit.dart';

@immutable
abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginChangeButton extends LoginState {}

class SignUpChangeButton extends LoginState {}

class LoginLoadingState extends LoginState {}

class LoginErrorState  extends LoginState{}

class LoginSuccessState extends LoginState{}
