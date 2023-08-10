import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import 'package:green_house/View/SignUp.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());
  final form = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _key = GlobalKey();

  void ChangeLogin() {
    form.currentState?.validate();
    emit(LoginChangeButton());
  }

  void SignUpChange(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => Sign_UP()),
    );
    emit(SignUpChangeButton());
  }
}
