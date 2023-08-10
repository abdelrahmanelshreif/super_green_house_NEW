import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:green_house/View/planet_widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:green_house/View/species_search.dart';
import 'package:green_house/controller/bottom_nav_bar_controller.dart';

import 'articles.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    double deviceHeight = MediaQuery.of(context).size.height;
    double leftPosition = deviceWidth * 0.0245;
    double topPosition = deviceWidth * 0.126;

    return Scaffold(
      backgroundColor: Color(0xfffafcfe),
      body: Container(
        width: deviceWidth,
        height: deviceHeight,
        child: Column(
          children: [
            _buildProfileCardAndControls(
                context, deviceWidth, deviceHeight, topPosition, leftPosition),

            _buildThreeChoices(context),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
              child: Column(
                children: [
                  _buildTextAfterOftheThreeChoices(),
                  writeCollectedPlanetName(),
                  buildDateOfPlanetCollected(),
                  Container(
                    clipBehavior: Clip.none,
                    height: deviceHeight * 0.35,
                    child: ListView.builder(
                        itemCount: 5,
                        scrollDirection: Axis.vertical,
                        itemBuilder: (context, index) =>
                            _buildImagesContainer(deviceWidth, deviceHeight)),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

Widget _buildImagesContainer(double deviceWidth, double deviceHeight) {
  return Container(
    margin: EdgeInsets.all(10),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15), color: Colors.white),
    height: deviceHeight * 0.35,
    child: Row(
      children: [
        Flexible(
          flex: 1,
          fit: FlexFit.tight,
          child: Container(
            // height: 250,
            margin: EdgeInsets.all(10),
            child: Image.asset("images/png/Rectangle1.png"),
          ),
        ),
        Flexible(
          flex: 1,
          fit: FlexFit.tight,
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                child: Image.asset("images/png/Rectangle2.png"),
                width: deviceWidth * 0.3,
                height: deviceHeight * 0.125,
              ),
              Flexible(
                flex: 1,
                fit: FlexFit.tight,
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                  width: deviceWidth * 0.3,
                  height: deviceHeight * 0.125,
                  child: Image.asset("images/png/Rectangle3.png"),
                ),
              ),
            ],
          ),
        )
      ],
    ),
  );
}

Widget _buildProfileCardAndControls(BuildContext context, double deviceWidth,
    double deviceHeight, double topPosition, double leftPosition) {
  return Container(
    width: deviceWidth,
    height: deviceHeight * 0.3,
    color: Color(0xff4dd4b1),
    child: _buildHeader_Info_Controls(
        context, deviceHeight, deviceWidth, topPosition, leftPosition),
  );
}

Widget _buildThreeChoices(context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      _buildProfileChoicesWhite(context, "ARTICLES"),
      _buildProfileChoices(context, "SPECIES"),
      _buildProfileChoicesWhite(context, "LIKES"),
    ],
  );
}

Widget _buildTextAfterOftheThreeChoices() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      Text(
        'Your Collected Plants',
        style: TextStyle(
          color: Color(0xFF364459),
          fontSize: 17,
          fontWeight: FontWeight.w700,
        ),
      ),
    ],
  );
}

Widget writeCollectedPlanetName(
    {String avatar = 'images/svg/Subtract.svg',
    String text = 'Alagare Plant'}) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 0),
    child: Row(
      children: [
        CircleAvatar(
          child: SvgPicture.asset(avatar),
          radius: 20,
          backgroundColor: Colors.white,
        ),
        SizedBox(width: 5),
        Column(
          children: [
            Text(text,
                style: TextStyle(
                  color: Color(0xFF364459),
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                )),
          ],
        )
      ],
    ),
  );
}

Widget buildDateOfPlanetCollected() {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 0),
    child: Row(
      children: [
        Text(
          '02 . 01 . 2019',
          style: TextStyle(
            color: Color(0xFFA1A8B9),
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
        )
      ],
    ),
  );
}

Widget _buildHeader_Info_Controls(BuildContext context, double deviceHeight,
    double deviceWidth, double topPosition, double leftPosition) {
  return Stack(
    children: [
      Positioned(
        top: deviceHeight * -0.1,
        left: deviceWidth * 0.5,
        child: Container(
          width: deviceWidth * 0.7,
          height: deviceHeight * 0.4,
          decoration: ShapeDecoration(
            color: Colors.white.withOpacity(0.15),
            shape: OvalBorder(),
          ),
        ),
      ),
      Positioned(
          top: deviceHeight * 0.27,
          left: deviceWidth * 0.75,
          child: Container(
            width: deviceWidth * 0.45,
            height: deviceHeight * 0.2,
            decoration: ShapeDecoration(
              color: Colors.white.withOpacity(0.15),
              shape: OvalBorder(),
            ),
          )),
      _buildPersonAvatar(),
      buildmoreSettingBtn(topPosition, leftPosition),
      buildBackBtn(context, topPosition, leftPosition),
    ],
  );
}

Widget _buildPersonAvatar() {
  return Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(
          radius: 55,
          backgroundImage: AssetImage("images/png/personal.png"),
        ),
        Container(
          padding: EdgeInsets.all(10),
          child: Text(
            "Taylor Swift",
            style: TextStyle(
              color: Colors.white,
              fontSize: 23,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset("images/svg/location-sign.svg"),
            Text(
              'Los Angeles, California',
              style: TextStyle(
                color: Colors.white.withOpacity(0.8999999761581421),
                fontSize: 14,
                fontFamily: 'SF Pro Text',
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        )
      ],
    ),
  );
}

Widget _buildProfileChoices(BuildContext context, String text) {
  return InkWell(
    onTap: () {
      if (text == "SPECIES") {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => species_search(),
            ));
      } else if (text == "ARTICLES") {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => articles(),
            ));
      }
    },
    child: Container(
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.all(10),
        child: Text(text,
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w700,
                fontSize: 16)),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(23.50),
          color: Color(0xFF48A2F4),
        )
        // decoration: BorderRadius,
        ),
  );
}

Widget _buildProfileChoicesWhite(context, String text) {
  return InkWell(
      onTap: () {
        if (text == "SPECIES") {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => species_search(),
              ));
        } else if (text == "ARTICLES") {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => articles(),
              ));
        }
      },
    child: Container(
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.all(10),
        child: Text(text,
            style: TextStyle(
                color: Color(0xFFC5C5C5),
                fontWeight: FontWeight.w700,
                fontSize: 16)),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(23.50),
          color: Color(0xfffbfdff),
        )
        // decoration: BorderRadius,
        ),
  );
}
