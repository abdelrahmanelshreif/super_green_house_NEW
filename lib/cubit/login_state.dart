part of 'login_cubit.dart';

@immutable
abstract class LoginState {}

class LoginInitial extends LoginState {}
class LoginChangeButton extends LoginState {}
class SignUpChangeButton extends LoginState{}

