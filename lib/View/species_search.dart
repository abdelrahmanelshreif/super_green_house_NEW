
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:green_house/View/planet_details_screen.dart';
import 'package:green_house/constants/constimage.dart';
import 'package:green_house/model/species_search_model.dart';

class species_search extends StatefulWidget {
  const species_search({Key? key}) : super(key: key);

  @override
  State<species_search> createState() => _species_searchState();
}

class _species_searchState extends State<species_search> {
  @override
  final String text="Cactus";
  final String searchhinttext="Search For Cactus";
  var index=0;
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff9fafa),
      body: Column(
        children: [
          // build appbar
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
                  height:204,
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
                  height:124,
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
                    child: Icon(Icons.arrow_back_ios,color: Colors.white)),
              ),
              Positioned(
                top: 79,
                right: 20,
                child: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(Icons.more_vert,color: Colors.white,size: 30,)),
              ),
              Positioned(
                  top: 110,
                  right: -20,
                  child: Text(text,style: TextStyle(fontSize: 85,fontWeight: FontWeight.bold,color: Colors.white.withOpacity(.2)),)),
              Positioned(
                top: 120,
                left: 22,
                child: Text(
                  text,
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
                      prefixIcon: Icon(Icons.search,color: Color(0xffD2D2D2),),
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,

                        borderRadius: BorderRadius.circular(30),
                      ),
                      hintText:searchhinttext,hintStyle: TextStyle(color: Color(0xffD2D2D2),),
                    ),
                  ),
                ),
                ),
            ],
          ),
// build body

        Padding(
          padding: const EdgeInsets.only(top: 40),

          child: Container(
            width: double.infinity,
            height: 600,
            child: ListView.builder(itemBuilder: (context, index) =>  _buildlistitem(plantname: "Fat Cactus",plantimage:imageslist[index].image,plantdescription:"Cactus spines are produced from specialized structures ..." ,index: index),
                itemCount: imageslist.length,physics: BouncingScrollPhysics(),),
          )
        ),

        ],
      ),
    );
  }

  Widget _buildlistitem({
    required String plantimage,required String plantname,required String plantdescription,required int index
}) {

    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) =>  PlanetDetailsScreen()),
        );
      },
      child: Container(
            width: double.infinity,
            height: 210,

           decoration: BoxDecoration(
             color:index%2==0?Color(0x35c4c4c4):Color(0xfff9fafa),
           ),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                children: [
                  Container(
                    width: 150,
                    height: 150,
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.white,width: 5),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Image.asset(plantimage,fit: BoxFit.cover,),
                  ),
                  SizedBox(width: 20,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(plantname,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Color(0xff36455A)),),
                      SizedBox(height: 12,),
                      Row(
                        children: [
                          _listplanttext(text: "KINGDOM",mycolor:Colors.grey),
                          SizedBox(width: 20,),
                          _listplanttext(text: "FAMILY",mycolor:Colors.grey),
                        ],
                      ),
                      SizedBox(height: 7,),
                      Row(children: [
                          _listplanttext(text: "Plantae",mycolor:Colors.black87),
                          SizedBox(width: 30,),
                          _listplanttext(text: "Cactaceae",mycolor:Colors.black87),
                      ],),
                      SizedBox(height: 9,),
                      _listplanttext(text: "DESCRIPTION", mycolor: Colors.grey),
                      SizedBox(height: 9,),
                      Container(
                        width: 200,
                        height: 40,
                        child:_listplanttext(text: plantdescription, mycolor: Colors.black87)
                        ,
                      )



                    ],
                  ),
                ],
              ),
            ),
          ),
    );
  }

  Widget _listplanttext({required String text,required Color mycolor}){
    return Text(text,
    style: TextStyle(fontWeight: FontWeight.w500,fontSize: 15,color:mycolor ),overflow: TextOverflow.ellipsis,maxLines: 2,);
}}
List<speciesmodel> imageslist=[
  speciesmodel(image: plant6),
  speciesmodel(image: plant8),
  speciesmodel(image: plant10),
  speciesmodel(image: plant9),
  speciesmodel(image: plant11),
];
