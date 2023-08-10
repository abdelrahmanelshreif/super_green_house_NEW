import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:green_house/View/Login.dart';
import 'package:green_house/controller/bottom_nav_bar_controller.dart';

class Sign_UP extends StatefulWidget {
  const Sign_UP({super.key});

  @override
  State<Sign_UP> createState() => _Sign_UPState();
}

class _Sign_UPState extends State<Sign_UP> {
  final _phoneControler = TextEditingController();
  bool isCorrect = true;
  final _form = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _key = GlobalKey();
  final _passwordControler = TextEditingController();
  final _nameConteroler = TextEditingController();
  final _emailControler = TextEditingController();
  final _confirmControler = TextEditingController();
  bool obsecureText = true;

  void toggelpasswordText() {
    obsecureText = !obsecureText;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: FocusScope.of(context).unfocus,
        child: Form(
          key: _form,
          child: Padding(
            padding: const EdgeInsets.only(top: 50),
            child: Container(
              child: Padding(
                padding: const EdgeInsets.only(left: 20),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Text(
                        "Sign Up",
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.green,
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      TextFieldTitel("Username"),
                      SizedBox(
                        height: 5,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 30),
                        child: Column(
                          children: [
                            TextFormField(
                                controller: _nameConteroler,
                                obscureText: obsecureText,
                                validator: (value) {
                                  if (_nameConteroler.text.length < 15) {
                                    isCorrect = false;
                                    return "Your character should be 15 letters";
                                  }

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
                                )),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      TextFieldTitel("Email"),
                      SizedBox(
                        height: 5,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 30),
                        child: Column(
                          children: [
                            TextFormField(
                                controller: _emailControler,
                                obscureText: obsecureText,
                                validator: (value) {
                                  if (_emailControler.text.length < 15) {
                                    isCorrect = false;
                                    return "Your email should be 15 letters";
                                  }

                                  return null;
                                },
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Color(0xFBFDFF),
                                  label: Text("n@****",
                                      style: TextStyle(color: Colors.grey)),
                                  suffixIcon: isCorrect
                                      ? Icon(
                                          Icons.dangerous,
                                          color: Colors.grey,
                                        )
                                      : Icon(
                                          Icons.check, color: Colors.red,
                                          //   color: Colors.green,
                                        ),
                                )),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      TextFieldTitel("Phone Number"),
                      Padding(
                        padding: const EdgeInsets.only(right: 30),
                        child: Column(
                          children: [
                            TextFormField(
                                controller: _phoneControler,
                                obscureText: obsecureText,
                                validator: (value) {
                                  if (_phoneControler.text.length < 11) {
                                    isCorrect = false;
                                    return "Your number should be 11 digits";
                                  }
                                  if (_phoneControler.text[0] != "0") {
                                    isCorrect = false;
                                    return "Your number should be start with 0";
                                  }

                                  return null;
                                },
                                decoration: InputDecoration(
                                  label: Text("01****",
                                      style: TextStyle(color: Colors.grey)),
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
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFieldTitel("Password"),
                      SizedBox(
                        height: 5,
                      ),
                      Padding(
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
                                    obsecureText
                                        ? CupertinoIcons.eye
                                        : CupertinoIcons.eye_slash,
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
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFieldTitel("Confirm Password"),
                      SizedBox(
                        height: 5,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 30),
                        child: TextFormField(
                          controller: _confirmControler,
                          obscureText: obsecureText,
                          validator: (value) {
                            isCorrect = false;

                            if (_confirmControler.text.length < 6) {
                              return "Password should be more than 6 characters";
                            }
                            if (_confirmControler.text.length !=
                                _passwordControler.text.length) {
                              return "Please enter password is correct";
                            } else {
                              return null;
                            }
                          },
                          decoration: InputDecoration(
                            suffixIcon: InkWell(
                                onTap: toggelpasswordText,
                                child: Icon(
                                    obsecureText
                                        ? CupertinoIcons.eye
                                        : CupertinoIcons.eye_slash,
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
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      _LoginButton(),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget TextFieldTitel(String text) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          text,
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
        )
      ],
    );
  }

  Padding _LoginButton() {
    return Padding(
      padding: const EdgeInsets.only(right: 20),
      child: Center(
        child: InkWell(
          onTap: () {
            if (isCorrect == true) {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => MyPlanetApp()),(route) => false,
              );
              _form.currentState?.validate();
              setState(() {});
            }
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
  }
}
