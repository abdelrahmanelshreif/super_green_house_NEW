import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' as Get;
import 'package:meta/meta.dart';
import 'package:untitled1/Network/dio_helper.dart';
import 'package:untitled1/controller/bottom_nav_bar_controller.dart';
import 'package:untitled1/features/Sign_up/model/Sign_up.dart';

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
    emit(Createaccountloading());
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
        Get.Get.offAll( MyPlanetApp());
        emit(Createaccountsuccess());
      } else {
        Get.Get.snackbar(
          response.data["message"]," Error",
          backgroundColor: Colors.red,
        );
        emit(Createaccounterror());
      }
    } catch (e) {
      Get.Get.snackbar("Check your internet", " Error",
          backgroundColor: Colors.red);
      emit(Createaccounterror());
    }
  }
}
