import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:green_house/controller/bottom_nav_bar_controller.dart';
import 'package:green_house/homepage/homescreen.dart';
import 'package:green_house/view/SignUp.dart';

import '../Cubit/login_cubit.dart';
import 'OnboardingScreen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _phoneControler = TextEditingController();
  bool isCorrect = true;
  final form = GlobalKey<FormState>();

  //final GlobalKey<ScaffoldState> _key = GlobalKey();*/
  final _passwordControler = TextEditingController();

  bool obsecureText = true;

  @override
  void initState() {
    //_passwordControler.text
    super.initState();
  }

  void toggelpasswordText() {
    obsecureText = !obsecureText;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: FocusScope.of(context).unfocus,
        child: Padding(
          padding: const EdgeInsets.only(top: 61, left: 20),
          child: SingleChildScrollView(
            child: Form(
              key: form,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(Icons.arrow_back_ios, color: Colors.grey),
                  SizedBox(
                    height: 19,
                  ),
                  Text(
                    "Hello",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Let’s Learn More About Plants",
                    style: TextStyle(fontSize: 20, color: Colors.grey),
                  ),
                  SizedBox(
                    height: 28,
                  ),
                  TextFieldTitel("Username"),
                  SizedBox(
                    height: 10,
                  ),
                  //text field user name
                  _TextFeildUserName(),
                  SizedBox(
                    height: 28,
                  ),
                  TextFieldTitel("Password"),
                  SizedBox(
                    height: 10,
                  ),
                  //text field password
                  _TextFieldPassword(),
                  const SizedBox(
                    height: 20,
                  ),
                  // forget password and remmber me
                  _forgetPasswordandRemmberMe(),
                  const SizedBox(
                    height: 30,
                  ),
                  _LoginButton(),
                  SizedBox(
                    height: 20,
                  ),
                  //signUP
                  _SignUp(context)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  BlocBuilder<LoginCubit, LoginState> _SignUp(BuildContext context) {
    final cubit = context.read<LoginCubit>();
    return BlocBuilder<LoginCubit, LoginState>(
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Donot have account?",
              style: TextStyle(fontSize: 15, color: Colors.grey),
            ),
            InkWell(
              onTap: () {
                cubit.SignUpChange(context);
                /* Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => Sign_UP()),
            );*/
              },
              child: Text(
                "Sign Up",
                style: TextStyle(
                  color: Colors.green,
                  fontSize: 15,
                ),
              ),
            )
          ],
        );
      },
    );
  }

  Padding _forgetPasswordandRemmberMe() {
    return const Padding(
      padding: EdgeInsets.only(right: 30),
      child: Row(
        children: [
          Icon(Icons.check_box_outline_blank, color: Colors.grey),
          SizedBox(
            width: 5,
          ),
          Text(
            "Remember me",
            style: TextStyle(
              color: Colors.grey,
            ),
          ),
          Spacer(),
          Text(
            "Forget Password?",
            style: TextStyle(
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }

  Padding _TextFieldPassword() {
    return Padding(
      padding: const EdgeInsets.only(right: 30),
      child: TextFormField(
        controller: _passwordControler,
        obscureText: obsecureText,
        validator: (value) {
          isCorrect = false;

          if (_passwordControler.text.length < 6) {
            return "Password should be more than 6 characters";
          } else {
            return null;
          }
        },
        decoration: InputDecoration(
          suffixIcon: InkWell(
              onTap: toggelpasswordText,
              child: Icon(
                  obsecureText ? CupertinoIcons.eye : CupertinoIcons.eye_slash,
                  color: Colors.black)),
          filled: true,
          fillColor: Color(0xFBFDFF),
          //   hintText: "Password",
          /* focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                            errorBorder: InputBorder.none,*/
        ),
      ),
    );
  }

  Padding _TextFeildUserName() {
    return Padding(
      padding: const EdgeInsets.only(right: 30),
      child: Column(
        children: [
          TextFormField(
              controller: _phoneControler,
              // obscureText: obsecureText,
              validator: (value) {
                if (_phoneControler.text.length != 11) {
                  isCorrect = false;
                  return "Your name should be 11 letter";
                }
                /*  if (_phoneControler.text[0] != "0") {
                                    isCorrect = false;
                                    return "Your number should be start with 0";
                                  }*/

                return null;
              },
              decoration: InputDecoration(
                filled: true,
                fillColor: Color(0xFBFDFF),
                suffixIcon: isCorrect
                    ? Icon(
                        Icons.check,
                        color: Colors.green,
                      )
                    : Icon(
                        Icons.check, color: Colors.red,
                        //   color: Colors.green,
                      ),
              ))
        ],
      ),
    );
  }

  BlocBuilder<LoginCubit, LoginState> _LoginButton() {
    final cubit = context.read<LoginCubit>();
    return BlocBuilder<LoginCubit, LoginState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.only(right: 20),
          child: Center(
            child: InkWell(
              onTap: () {
                cubit.ChangeLogin;
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => MyPlanetApp()),
                  (route) => false,
                );
              },
              child: Container(
                width: 340,
                height: 50,
                decoration: BoxDecoration(color: Colors.green),
                child: Center(
                  child: Text("LOGIN",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      )),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget TextFieldTitel(String text) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          text,
          style: TextStyle(
            color: Colors.grey,
            fontSize: 15,
          ),
        )
      ],
    );
  }
}
