import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:green_house/View/profile_screen.dart';
import 'package:green_house/View/species_search.dart';

// import 'package:green_house/homepage/cubit/home_cubit.dart';
import 'package:green_house/model/home_basicitem_model.dart';
import 'package:green_house/View/articles.dart';

import '../constants/constimage.dart';
import '../controller/bottom_nav_bar_controller.dart';

class homescreen extends StatefulWidget {
  const homescreen({Key? key}) : super(key: key);

  @override
  State<homescreen> createState() => _homescreenState();
}

class _homescreenState extends State<homescreen> {
  @override
  Widget build(BuildContext context) {
    // final cubit = context.read<HomeCubit>();
    return Scaffold(
      backgroundColor: Color(0xfff9fafa),
      body: Column(
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                width: double.infinity,
                height: 200,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    end: Alignment.topRight,
                    begin: Alignment.bottomLeft,
                    colors: [
                      Color(0xFF61D2C4),
                      Color(0xff29D890),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: -60,
                right: -50,
                // bottom: deviceHeight*-0.5,
                child: Container(
                  width: 204,
                  height: 204,
                  decoration: ShapeDecoration(
                    color: Colors.white.withOpacity(0.15000000596046448),
                    shape: OvalBorder(),
                  ),
                ),
              ),
              Positioned(
                top: 100,
                right: -50,
                // bottom: deviceHeight*-0.5,
                child: Container(
                  width: 124,
                  height: 124,
                  decoration: ShapeDecoration(
                    color: Colors.white.withOpacity(0.15000000596046448),
                    shape: OvalBorder(),
                  ),
                ),
              ),
              Positioned(
                  top: 125,
                  right: -15,
                  child: Text(
                    "Home",
                    style: TextStyle(
                        fontSize: 90,
                        fontWeight: FontWeight.bold,
                        color: Colors.white.withOpacity(.2)),
                  )),
              Positioned(
                top: 100,
                left: 25,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Hello Taylor",
                      style: TextStyle(
                          fontSize: 21,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Let’s Learn More About Plants",
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Color(0xffFFFFFF)),
                    )
                  ],
                ),
              ),
              Positioned(
                top: 100,
                right: 25,
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProfileScreen(),
                        ));
                  },
                  child: Container(
                    height: 47,
                    width: 47,
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(20)),
                    clipBehavior: Clip.antiAlias,
                    child: Image.asset(
                      "assets/images/profile.png",
                      width: 47,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 172,
                left: 40,
                child: Container(
                  width: 330,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: TextFormField(
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.search,
                        color: Color(0xffD2D2D2),
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      hintText: 'Search For Plantes',
                      hintStyle: TextStyle(
                        color: Color(0xffD2D2D2),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(left: 17, right: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 37, left: 10, right: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _buildsmallitem(text: "SPECIES", image: treelogo),
                        _buildsmallitem(text: "ARTICLES", image: booklogo),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  _buildTitle(text: "Plant Types"),
                  SizedBox(
                    height: 11,
                  ),
                  Container(
                      height: 215,
                      child: ListView.builder(
                        itemBuilder: (context, index) => _buildbasicitem(
                            image: basicList[index].image,
                            plantname: "Home Plants"),
                        itemCount: basicList.length,
                        scrollDirection: Axis.horizontal,
                      )),
                  _buildTitle(text: "Photography"),
                  SizedBox(
                    height: 12,
                  ),
                  Container(
                    height: 155,
                    child: ListView.builder(
                      itemBuilder: (context, index) => _buildphotograpyitem(
                          image: photographyList[index].image),
                      itemCount: photographyList.length,
                      scrollDirection: Axis.horizontal,
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Container _buildphotograpyitem({required String image}) {
    return Container(
        height: 150,
        width: 130,
        margin: EdgeInsets.only(left: 15),
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(13)),
        child: Stack(
          children: [
            Image.asset(
              image,
              width: 130,
              height: 150,
              fit: BoxFit.cover,
            ),
            Positioned(
              top: 110,
              child: Container(
                width: 58,
                height: 25,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(10),
                      bottomRight: Radius.circular(10)),
                  color: Colors.white.withOpacity(.3),
                ),
                child: Center(
                  child: Text(
                    "# Mini",
                    style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff2E382F)),
                  ),
                ),
              ),
            ),
          ],
        ));
  }

  Widget _buildTitle({required String text}) {
    return Text(
      text,
      style: TextStyle(
          fontSize: 23, fontWeight: FontWeight.bold, color: Color(0xff36455A)),
    );
  }

  Widget _buildbasicitem({required String image, required String plantname}) {
    return Container(
        height: 200,
        width: 330,
        margin: EdgeInsets.only(left: 15),
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(13)),
        child: Stack(
          children: [
            Image.asset(
              image,
              width: 330,
              height: 200,
              fit: BoxFit.cover,
            ),
            Positioned(
              top: 120,
              left: 20,
              child: Column(
                children: [
                  Text(
                    plantname,
                    style: TextStyle(
                        fontSize: 19,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  SizedBox(
                    height: 3,
                  ),
                  Text(
                    "68 Types of Plants",
                    style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        color: Colors.white),
                  ),
                ],
              ),
            ),
          ],
        ));
  }

  Widget _buildsmallitem({required String text, required String image}) {
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
        width: 105,
        height: 90,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(10)),
        child: Column(
          children: [
            Image.asset(
              image,
              width: 39,
              height: 39,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              text,
              style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff6A6F7D)),
            ),
          ],
        ),
      ),
    );
  }
}

List<basicitemmodel> basicList = [
  basicitemmodel(
    image: plant1,
  ),
  basicitemmodel(
    image: plant2,
  ),
  basicitemmodel(
    image: plant3,
  ),
  basicitemmodel(
    image: plant4,
  ),
  basicitemmodel(
    image: plant5,
  ),
];
List<basicitemmodel> photographyList = [
  basicitemmodel(
    image: plant6,
  ),
  basicitemmodel(
    image: plant8,
  ),
  basicitemmodel(
    image: plant9,
  ),
  basicitemmodel(
    image: plant10,
  ),
  basicitemmodel(
    image: plant11,
  ),
];
