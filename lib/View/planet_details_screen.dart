import 'package:flutter/material.dart';
import 'package:green_house/View/planet_widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:green_house/model/planet_data_model.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:green_house/controller/bottom_nav_bar_controller.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter_svg/svg.dart';

Future getPlanetDataList() async {
  Hive.registerAdapter(PlanetDataModelAdapter());
  var myDataBox = await Hive.openBox<PlanetDataModel>('plants');
  final dataList = myDataBox.values.toList();
  return dataList;
}
Future<T> hIVE
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
        builder: (context, constraints)
        {
          final boxConstraints = constraints;
          final double topPosition = constraints.maxHeight * 0.066;
          final double leftPosition = constraints.maxWidth * 0.05;
          final double deviceWidth = constraints.maxWidth;
          final double deviceHeight = constraints.maxHeight;


          // return _buildPlants(
          //   boxConstraints,
          //   topPosition,
          //   leftPosition,
          //   deviceHeight,
          //   deviceWidth,
          //   plantDataList: getPlanetDataList(),
          // );
          return FutureBuilder<List<PlanetDataModel>>(
            future: _planetDataList,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return CircularProgressIndicator(); // Show a loading indicator
              } else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else {
                return _buildPlants(
                  constraints,
                  topPosition,
                  leftPosition,
                  deviceHeight,
                  deviceWidth,
                  plantDataList: snapshot.data!,
                );
              }
            },
          );
        },
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
  dynamic plantDataList,
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
          buildBackBtn(context, topPosition, leftPosition),
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
