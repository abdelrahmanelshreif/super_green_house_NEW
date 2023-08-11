import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart' as Get;
import 'package:flutter/material.dart';
import 'package:green_house/homepage/homescreen.dart';
import 'package:meta/meta.dart';

import 'package:green_house/View/SignUp.dart';

import '../network/dio_helper.dart';
import '../network/model/LoginModel.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());
  final form = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _key = GlobalKey();

  Future<void> changeLogin(
      {required String email, required String password}) async {
    {
      emit(LoginLoadingState());
      //
      // try {
      //   final Response response = await _dioHelper.postData(
      //     url: "login",
      //     body: {
      //       "email": email,
      //       "password": password,
      //     },
      //   );
      //
      //   // if (response.data["data"]==true) {
      //   //   Get.Get.offAll(MainScreen());
      //   // }else{
      //   //   Get.Get.snackbar(response.data["message"], " Error",
      //   //       backgroundColor: Colors.red);
      //   // }
      //
      //   final loginModel = LoginModel.fromJson(response.data);
      //
      //   if (loginModel.status == true) {
      //     Get.Get.offAll(MainScreen());
      //   } else {
      //     Get.Get.snackbar(response.data["message"], " Error",
      //         backgroundColor: Colors.red);
      //   }
      //
      //   emit(LoginSuccessState());
      // } catch (e) {
      //   Get.Get.snackbar("Check your internet", " Error",
      //       backgroundColor: Colors.red);
      //   emit(LoginErrorState());
      // }
    }

    // form.currentState?.validate();
    // emit(LoginChangeButton());
  }

  void SignUpChange(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => Sign_UP()),
    );
    emit(SignUpChangeButton());
  }
}
