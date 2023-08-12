import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled1/features/Sign_up/cubit/createaccount_cubit.dart';


class Sign_UP extends StatefulWidget {
  const Sign_UP({super.key});

  @override
  State<Sign_UP> createState() => _Sign_UPState();
}

class _Sign_UPState extends State<Sign_UP> {
  final _phoneController = TextEditingController();

  final _form = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _key = GlobalKey();
  final _passwordController = TextEditingController();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _confirmController = TextEditingController();
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
            padding: const EdgeInsets.only(top: 100),
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
                                controller: _nameController,
                                validator: (value) {

                                  if (_nameController.text.isEmpty) {

                                    return "you should enter your name";
                                  }


                                  return null;
                                },
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Color(0xFBFDFF),



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
                                controller: _emailController,
                                validator: (value) {

                                  if (_emailController.text.length < 15) {

                                    return "Your email should be 15 letters";
                                  }

                                  return null;
                                },
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Color(0xFBFDFF),
                                  label: Text("n@****",
                                      style: TextStyle(color: Colors.grey)),

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
                                controller: _phoneController,
                                keyboardType: TextInputType.phone,
                                validator: (value) {

                                  if (_phoneController.text.length !=11) {

                                    return "Your number should be 11 digits";
                                  }
                                  if (_phoneController.text[0] != "0") {
                                    return "Your number should be start with 0";
                                  }

                                  return null;
                                },
                                decoration: InputDecoration(
                                  label: Text("01****",
                                      style: TextStyle(color: Colors.grey)),
                                  filled: true,
                                  fillColor: Color(0xFBFDFF),
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
                          controller: _passwordController,
                          obscureText: obsecureText,
                          validator: (value) {
                            if (_passwordController.text.length < 6) {
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
                          controller: _confirmController,
                          obscureText: obsecureText,
                          validator: (value) {
                            if (_confirmController.text != _passwordController.text) {
                              return "Password not the same";
                            }
                            else {
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
                      BlocBuilder<CreateaccountCubit, CreateaccountState>(
                      builder: (context, state) {
                        if (state is Createaccountloading) {
                          return Center(child: CircularProgressIndicator());
                        }
                        return Padding(
                          padding: const EdgeInsets.only(right: 20),
                          child: Center(
                            child: InkWell(
                              onTap: () async{
                                if (_form.currentState!.validate()) {
                                  await context.read<CreateaccountCubit>()
                                      .createAccount(
                                      name: _nameController.text,
                                      phone: _phoneController.text,
                                      email: _emailController.text,
                                      password: _passwordController.text, context: context);
                                }
                              },
                              child: Container(
                                width: 340,
                                height: 50,
                                decoration: BoxDecoration(color: Colors.green),
                                child: Center(
                                  child: Text("Sign Up",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold
                                      )),
                                ),
                              ),
                            ),
                          ),
                        );
  },
),
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
            fontSize: 18,
          ),
        )
      ],
    );
  }




}
