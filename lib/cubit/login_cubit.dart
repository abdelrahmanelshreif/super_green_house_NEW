import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:green_house/homepage/homescreen.dart';
import 'package:meta/meta.dart';
import 'package:get/get.dart' as Get;
import 'package:green_house/View/SignUp.dart';

import 'package:green_house/network/dio_helper.dart';
import 'package:green_house/network/model/LoginModel.dart';
import '../controller/bottom_nav_bar_controller.dart';
import '../network/model/LoginModel.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());
  final DioHelper _dioHelper = DioHelper();

  Future login({
    required String email,
    required String password,
  }) async {
    emit(LoginLoadingState());

    try {
      final Response response = await _dioHelper.postData(
        url: "login",
        body: {
          "email": email,
          "password": password,
        },
      );

      final loginModel = LoginModel.fromJson(response.data);
      if (loginModel.status == true) {
        Get.Get.offAll(MyPlanetApp());
        Get.Get.snackbar(response.data["message"], "Congrats",
            backgroundColor: Colors.green);
      } else {
        Get.Get.snackbar(response.data["message"], " Error",
            backgroundColor: Colors.red);
      }
      emit(LoginSuccessState());
    } catch (e) {
      Get.Get.snackbar("Check your internet", " Error",
          backgroundColor: Colors.red);
      emit(LoginErrorState());
    }
  }

/*
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
  }*/
}
