import 'package:flutter/material.dart';
import 'package:green_house/View/planet_widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:green_house/controller/bottom_nav_bar_controller.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter_svg/svg.dart';

class PlantData {
  final String planetImgSrc;
  final String planetKingdom;
  final String planetFamily;

  PlantData({
    required this.planetImgSrc,
    required this.planetKingdom,
    required this.planetFamily,
  });
}
void newPlantAdd(String planetImgSrc,String planetKingdom,String planetFamily)
{
  plantDataList.add(PlantData(planetImgSrc: planetImgSrc, planetKingdom: planetKingdom, planetFamily: planetFamily));
}
final List<PlantData> plantDataList = [
  PlantData(
    planetImgSrc: 'images/png/cactus.png',
    planetKingdom: 'Plantae',
    planetFamily: 'Cactacecae',
  ),
  PlantData(
    planetImgSrc: 'images/png/spinach.png',
    planetKingdom: 'Plantae',
    planetFamily: 'Rosaceae',
  ),
];

class PlanetDetailsScreen extends StatefulWidget {
  const PlanetDetailsScreen({super.key});

  @override
  State<PlanetDetailsScreen> createState() => _PlanetDetailsScreenState();
}

class _PlanetDetailsScreenState extends State<PlanetDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          final boxConstraints = constraints;
          final double topPosition = constraints.maxHeight * 0.066;
          final double leftPosition = constraints.maxWidth * 0.05;
          final double deviceWidth = constraints.maxWidth;
          final double deviceHeight = constraints.maxHeight;

          return _buildPlants(
            constraints,
            topPosition,
            leftPosition,
            deviceHeight,
            deviceWidth,
            plantDataList: plantDataList,
          );
        },
      ),
      // bottomNavigationBar: buildBottomNavBar(),
    );
  }
}

Widget _buildPlants(
  BoxConstraints constraints,
  double topPosition,
  double leftPosition,
  double deviceHeight,
  double deviceWidth, {
  required List<PlantData> plantDataList,
}) {
  return PageView.builder(
      itemCount: plantDataList.length,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) => _buildPlantPage(
          context,
          plantDataList[index].planetImgSrc,
          constraints,
          topPosition,
          leftPosition,
          deviceHeight,
          plantDataList[index].planetKingdom,
          plantDataList[index].planetFamily,
          deviceWidth));
}

Column _buildPlantPage(
    BuildContext context,
    String planetImgSrc,
    BoxConstraints constraints,
    double topPosition,
    double leftPosition,
    double deviceHeight,
    String planetKingdom,
    String planetFamily,
    double deviceWidth) {
  return Column(
    children: [
      Stack(
        children: [
          buildPlanetImageDetailsScreen(
              planetImg: planetImgSrc, constraints: constraints),
          buildBackBtn(context,topPosition, leftPosition),
          buildmoreSettingBtn(topPosition, leftPosition),
          buildHeartOnPlanetLogo(topPosition, leftPosition),
        ],
      ),
      Container(
        padding: EdgeInsets.only(left: 23),
        child: Column(
          children: [
            buildUsageTypesOfPlanet(),
            buildSpaceVertically(deviceHeight),
            buildPlanetTitleName(),
            buildSpaceVertically(deviceHeight),
            buildStarsAndRate(),
            buildSpaceVertically(deviceHeight),
            buildTextbeforeDescritionOfPlanet(
                kingdom: "KINGODOM", family: "FAMILY"),
            buildTextbeforeDescritionOfPlanet(
                kingdom: planetKingdom, family: planetFamily),
            buildSpaceVertically(deviceHeight),
            buildDescHeader(),
            buildSpaceVertically(deviceHeight),
            buildDescription(deviceWidth),
          ],
        ),
      )
    ],
  );
}
