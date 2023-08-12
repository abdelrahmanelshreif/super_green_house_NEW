import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' as Get;
import 'package:meta/meta.dart';

import '../controller/bottom_nav_bar_controller.dart';
import '../model/SignupModel.dart';
import '../network/dio_helper.dart';
part 'createaccount_state.dart';

class CreateaccountCubit extends Cubit<CreateaccountState> {
  CreateaccountCubit() : super(CreateaccountInitial());


  final DioHelper _dioHelper = DioHelper();

  Future createAccount({
    required String name,
    required String email,
    required String phone,
    required String password,
    required BuildContext context,
  }) async {
    emit(CreateAccountLoading());
    try {
      final Response response = await _dioHelper.postData(
        url: "register",
        body: {
          "name": name,
          "phone": phone,
          "email": email,
          "password": password,
        },
      );
      final signupModel = SignUp.fromJson(response.data);

      if (signupModel.status == true) {
        Get.Get.offAll(MyPlanetApp());
        emit(CreateAccountSuccess());
        Get.Get.snackbar(response.data["message"], " Successfull",
            backgroundColor: Colors.blue);
      } else {
        Get.Get.snackbar(
          response.data["message"]," Error",
          backgroundColor: Colors.red,
        );
        emit(CreateAccountError());
      }
    } catch (e) {
      Get.Get.snackbar("Check your internet", " Error",
          backgroundColor: Colors.red);
      emit(CreateAccountError());
    }
  }
}