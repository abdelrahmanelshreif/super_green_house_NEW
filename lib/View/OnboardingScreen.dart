import 'package:jumping_dot/jumping_dot.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:green_house/View/Login.dart';

class OnboardingScreen extends StatefulWidget {
  int num;

  OnboardingScreen({
    super.key,
    required this.num,
  });

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  List<String> names = [
    "Identify Plants",
    "Learn Many Plants Species",
    "Read Many Articles About Plant"
  ];

  List<String> titel = [
    "You can identify the plants you don't know",
    "Let's learn about the many plant species that",
    "Let's learn more about beautiful plants and read"
  ];

  List<String> Subtitel = [
    "through your camera",
    "exist in this world",
    " many articles about plants and gardening"
  ];

  List<String> image = [
    "assets/images/N1.png",
    "assets/images/N2.png",
    "assets/images/N3.png"
  ];

  //points

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 50),
            child: Center(
              child: Column(
                children: [
                  Image.asset("assets/images/G${widget.num}.png"),
                  SizedBox(
                    height: 60,
                  ),
                  Text(
                    names[widget.num - 1],
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      // color: Colors.black.withOpacity(2.0),
                    ),
                  ),
                  SizedBox(
                    height: 21,
                  ),
                  Text(
                    titel[widget.num - 1],
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black54,
                    ),
                  ),
                  SizedBox(
                    height: 3,
                  ),
                  Text(
                    Subtitel[widget.num - 1],
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black54,
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        JumpingDots(
                          color: Colors.green,
                          radius: 7,
                        ),

/*
                          Image.asset("assets/images/N1.png"),
                          SizedBox(width: 2,),
                          Image.asset("assets/images/N2.png",width: 50,height: 70,),
                          SizedBox(width: 2,),
                          Image.asset("assets/images/N3.png"),
                          SizedBox(width: 2,),*/
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  InkWell(
                    onTap: () {
                      if (widget.num < 3) {
                        widget.num = widget.num + 1;
                        setState(() {});
                      } else {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LoginScreen()),
                        );
                      }
                    },
                    child: Container(
                      width: 329,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.green,
                      ),
                      child: Center(
                          child: Text(
                        "NEXT",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      )),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    ));
  }

  void Next() {
    for (int i = 0; i < 3; i++) {
      if (widget.num == 1) {
        Image.asset("assets/images/N1.png");
        SizedBox(
          width: 2,
        );
      } else if (widget.num == 2) {
        Image.asset(
          "assets/images/N2.png",
          width: 50,
          height: 50,
        );
        SizedBox(
          width: 2,
        );
      } else {
        Image.asset("assets/images/N3.png");
        SizedBox(
          width: 2,
        );
      }
    }
  }
}
