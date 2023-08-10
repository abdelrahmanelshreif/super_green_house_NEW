import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:green_house/View/planet_widgets.dart';
import 'package:green_house/View/planet_details_screen.dart';
import 'package:green_house/View/profile_screen.dart';

class DetailArticleScreen extends StatelessWidget {
  const DetailArticleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          final double topPosition = constraints.maxHeight * 0.066;
          final double leftPosition = constraints.maxWidth * 0.05;
          final double deviceWidth = constraints.maxWidth;
          final double deviceHeight = constraints.maxHeight;

          return Column(
            children: [
              Stack(
                children: [
                  buildPlanetImageDetailsScreen(
                    planetImg: 'images/png/articlepage.png',
                    constraints: constraints,
                  ),
                  buildBackBtn(context, topPosition, leftPosition),
                  buildmoreSettingBtn(topPosition, leftPosition),
                  buildHeartOnPlanetLogo(topPosition, leftPosition),
                ],
              ),
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: 23),
                  child: Column(
                    children: [
                      buildUsageTypesOfPlanet(
                          text1: 'VEGATABLES', text2: 'GARDEN'),
                      buildSpaceVertically(deviceHeight),
                      buildPlanetTitleName(
                          titleName:
                              "Even on Urban Excursions,Finding Mother Nature's Charms"),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          writeCollectedPlanetName(
                              avatar: "images/svg/rejon_Rejon_s_Head.svg",
                              text: "Andre Hamet"),
                          _buildFollowWidget()
                        ],
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 30),
                            child: buildDateOfPlanetCollected(),
                          ),
                        ],
                      ),
                      buildSpaceVertically(deviceHeight),
                      buildDescHeader(),
                      buildSpaceVertically(deviceHeight),
                      _buildArticle(deviceWidth)
                    ],
                  ))
            ],
          );
        },
      ),
    );
  }
}

Widget _buildArticle(double deviceWidth) {
  return Container(
    width: 300,
    height: 50,
    child: buildDescription(deviceWidth,
        descText:
            """Public parks aside, getting a dose of nature can be a tricky task during an urban escape. But nat ure should and can fit into that city getaway, acc ording to Kally Ellis, the founder of the London fl orist company McQueens and the in-house florist for the Maybourne Hotel Group. “Connecting with the natural world wherever you are is a great antid ote to jet lag and travel tiredness,” she said. “Plan ts and flowers can refresh us, boost our energy and help us recalibrate."""),
  );
}

Widget _buildFollowWidget() {
  return Container(
    width: 90,
    height: 35,
    clipBehavior: Clip.antiAlias,
    child: Center(
        child: Row(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 5),
          child: SvgPicture.asset(
            "images/svg/plus.svg",
            width: 10,
            height: 10,
          ),
        ),
        Text("Follow",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.w700,
            )),
      ],
    )),
    decoration: ShapeDecoration(
      color: Color(0xFF2CD992),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(90),
      ),
    ),
  );
}
