import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter/cupertino.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:green_house/controller/bottom_nav_bar_controller.dart';
import 'package:green_house/homepage/homescreen.dart';

Widget buildTextbeforeDescritionOfPlanet(
    {required String? kingdom, required String? family}) {
  return Row(
    children: [
      Flexible(
        flex: 1,
        child: Container(
          margin: EdgeInsets.only(bottom: 10),
          width: 110,
          child: Text(
            kingdom!,
            overflow: TextOverflow.ellipsis, // Set overflow property
            style: const TextStyle(
              color: Color(0xFF495566),
            ),
          ),
        ),
      ),
      Flexible(
        flex: 2,
        child: Container(
          margin: EdgeInsets.only(bottom: 10),
          width: 110,
          child: Text(
            family!,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              color: Color(0xFF495566),
            ),
          ),
        ),
      ),
    ],
  );
}

Widget buildHeartOnPlanetLogo(double topPosition, double leftPosition) {
  return Positioned(
      top: topPosition * 6.2,
      right: leftPosition * 1,
      child: CircleAvatar(
        backgroundColor: const Color(0xffff6262),
        radius: 30,
        child: SvgPicture.asset(
          "images/svg/valentines-heart.svg",
        ),
      ));
}

Widget buildmoreSettingBtn(double topPosition, double leftPosition) {
  return Positioned(
    top: topPosition,
    right: leftPosition,
    // Use the same value for left and right for centering
    child: const Icon(
      Icons.more_vert_rounded,
      size: 30,
      color: Colors.white,
    ),
  );
}

Widget buildBackBtn(
    BuildContext context, double topPosition, double leftPosition) {
  return Positioned(
    top: topPosition,
    left: leftPosition,
    child: InkWell(
      onTap: () {
        if (Navigator.of(context).canPop()) {
          Navigator.pop(context); // Navigate back
        } else {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => MyPlanetApp()), // Navigate to home screen
          );
        }
      },
      child: const Icon(
        Icons.arrow_back_ios_new,
        color: Colors.white,
      ),
    ),
  );
}

Widget buildSpaceVertically(double deviceHeight) =>
    SizedBox(height: deviceHeight * 0.02307);

Widget buildPlanetImageDetailsScreen(
    {required String? planetImg, required BoxConstraints constraints}) {
  return Positioned(
    child: Container(
      child: Image.asset(
        planetImg!,
        fit: BoxFit.cover,
      ),
      margin: EdgeInsets.only(bottom: 35),
      width: double.infinity,
      height: constraints.maxHeight * 0.45,
      color: const Color(0xFFE0DFDA),
    ),
  );
}

Widget buildDescription(double deviceWidth,
    {String descText =
        """The word "cactus" derives, through Latin, from the Ancient Greek κάκτος, kaktos, a name originally used by Theophrastus for a spiny plant whose identity is not certain. Cacti occur in a wide range of shapes and sizes. Most cacti live in habitats subject to at least some drought."""}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      Container(
        width: deviceWidth * 0.7,
        child: SingleChildScrollView(
          child: Text(
            descText,
            overflow: TextOverflow.ellipsis,
            maxLines: 8,
            style: TextStyle(
              color: Color(0xff858995),
              fontSize: 15,
            ),
          ),
        ),
      ),
    ],
  );
}

Widget buildDescHeader() {
  return Row(
    children: [
      Text(
        "DESCRIPTION",
        style: TextStyle(
          color: Color(0xFF495566),
          fontSize: 14,
          fontWeight: FontWeight.w600,
        ),
      ),
    ],
  );
}

Widget buildStarsAndRate() {
  return Row(
    children: [
      Icon(
        Icons.star_outlined,
        size: 20,
        color: Color(0xffffcd00),
      ),
      Icon(
        Icons.star_outlined,
        size: 20,
        color: Color(0xffffcd00),
      ),
      Icon(
        Icons.star_outlined,
        size: 20,
        color: Color(0xffffcd00),
      ),
      Icon(
        Icons.star_outlined,
        size: 20,
        color: Color(0xffffcd00),
      ),
      Icon(
        Icons.star_border_outlined,
        size: 20,
      ),
      SizedBox(width: 5),
      Text(
        "4.1",
        style: TextStyle(fontWeight: FontWeight.w700, fontSize: 14),
      ),
    ],
  );
}

Widget buildUsageTypesOfPlanet(
    {String text1 = 'DANGER', String text2 = 'DECORATION'}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      Container(
        child: Text(text1,
            style: TextStyle(
              backgroundColor: Color(0xffe7f2fd),
              color: Color(0xff2f91eb),
            )),
      ),
      SizedBox(width: 20),
      Container(
        child: Text(text2,
            style: TextStyle(
              backgroundColor: Color(0xffe7f2fd),
              color: Color(0xff2f91eb),
            )),
      ),
    ],
  );
}

Widget buildPlanetTitleName({String titleName = "Circle Cactus"}) {
  return Row(
    children: [
      Expanded(
          child: Container(
        child: Text(
          titleName,
          style: TextStyle(
            color: Color(0xff36455a),
            fontSize: 27,
            fontWeight: FontWeight.w700,
          ),
        ),
      )),
    ],
  );
}

// Widget buildBottomNavBar() {
//   return CurvedNavigationBar(
//     backgroundColor: Colors.white,
//     color: Colors.white70,
//     items: <Widget>[
//       Column(
//         children: [
//           CircleAvatar(
//             child: SvgPicture.asset("images/svg/home.svg"),
//             backgroundColor: Colors.white,
//             radius: 30,
//           ),
//           const Text(
//             "Home",
//             style: TextStyle(
//               color: Color(0xFF2CD992),
//               fontSize: 13,
//               fontWeight: FontWeight.w500,
//             ),
//           )
//         ],
//       ),
//       Column(
//         children: [
//           CircleAvatar(
//             child: SvgPicture.asset("images/svg/add.svg"),
//             backgroundColor: Colors.blue,
//             // backgroundImage: AssetImage("images/png/add_background.png"),
//           ),
//         ],
//       ),
//       Column(
//         children: [
//           CircleAvatar(
//             child: SvgPicture.asset("images/svg/profile.svg"),
//             backgroundColor: Colors.white,
//           ),
//           const Text(
//             "PROFILE",
//             style: TextStyle(
//               color: Color(0xFFD2D2D2),
//               fontSize: 13,
//               fontWeight: FontWeight.w500,
//             ),
//           ),
//         ],
//       ),
//     ],
//     onTap: (index) {
//       _mainController.selectedIdx = index;
//       setState(() {});
//     },
//   );
// }
