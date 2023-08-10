import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:green_house/model/articles_model.dart';
import '../constants/constimage.dart';
import 'article_detail_screen.dart';

class articles extends StatefulWidget {
  const articles({Key? key}) : super(key: key);

  @override
  State<articles> createState() => _articlesState();
}

class _articlesState extends State<articles> {
  @override
  Widget build(BuildContext context) {
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
                top: 79,
                left: 20,
                child: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(Icons.arrow_back_ios, color: Colors.white)),
              ),
              Positioned(
                top: 79,
                right: 20,
                child: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.more_vert,
                      color: Colors.white,
                      size: 30,
                    )),
              ),
              Positioned(
                  top: 120,
                  right: -20,
                  child: Text(
                    "Articles",
                    style: TextStyle(
                        fontSize: 85,
                        fontWeight: FontWeight.bold,
                        color: Colors.white.withOpacity(.2)),
                  )),
              Positioned(
                top: 120,
                left: 22,
                child: Text(
                  "Articles",
                  style: TextStyle(
                      fontSize: 33,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
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
                      hintText: 'Search For Articles',
                      hintStyle: TextStyle(
                        color: Color(0xffD2D2D2),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding:
                const EdgeInsets.only(top: 40, left: 15, right: 15, bottom: 10),
            child: Container(
              height: 615,
              width: 360,
              child: ListView.builder(
                itemBuilder: (context, index) => _buildlistveiwitem(
                    image: imageslist[index].image,
                    text:
                        "Even on Urban Excursions, Finding Mother Nature's Charms",
                    date: "2019 . 01 . 01",
                    name: "Shivani Vora",
                    profileimage: "assets/images/profile.png"),
                itemCount: imageslist.length,
                physics: BouncingScrollPhysics(),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildlistveiwitem(
      {required String image,
      required String text,
      required String profileimage,
      required String name,
      required String date}) {
    return InkWell(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => DetailArticleScreen()));
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 20),
        width: 360,
        height: 280,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: Colors.white,
        ),
        child: Column(
          children: [
            Image.asset(
              image,
              width: 360,
              height: 145,
              fit: BoxFit.fill,
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Text(
                text,
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff36455A)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    clipBehavior: Clip.antiAlias,
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(20)),
                    child: Image.asset(
                      profileimage,
                      width: 40,
                      height: 40,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Column(
                    children: [
                      Text(
                        name,
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Color(0xff36455A),
                            fontSize: 14),
                      ),
                      Text(
                        date,
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: Color(0xffA1A8B9)),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 130,
                  ),
                  Icon(
                    Icons.bookmark_border,
                    color: Colors.grey,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Icon(
                    CupertinoIcons.heart,
                    color: Colors.grey,
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

List<articlesmodel> imageslist = [
  articlesmodel(image: plant13),
  articlesmodel(image: plant7),
  articlesmodel(image: plant1),
  articlesmodel(image: plant3),
  articlesmodel(image: plant2),
  articlesmodel(image: plant5),
  articlesmodel(image: plant4),
];
