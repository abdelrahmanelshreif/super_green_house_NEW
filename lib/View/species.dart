import 'package:azlistview/azlistview.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


import 'AlphabetList_ScrollView.dart';

class species extends StatefulWidget {
  const species({Key? key}) : super(key: key);

  @override
  State<species> createState() => _speciesState();
}

class _speciesState extends State<species> {
  @override
   List<String> alphabets = [  "A",  "B",  "C",  "D",  "E",  "F",  "G",  "H",  "I",  "J",  "K",  "L",  "M",  "N",  "O",  "P",  "Q",  "R",  "S",  "T",  "U",  "V",  "W",  "X",  "Y",  "Z"  ];

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
                    child: Icon(Icons.arrow_back_ios,color: Colors.white)
                ),
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
                  child: Text("Species",style: TextStyle(fontSize: 85,fontWeight: FontWeight.bold,color: Colors.white.withOpacity(.2)),)),
              Positioned(
                top: 120,
                left: 22,
                child: Text(
                  "Species",
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
                      hintText:"Search For Species",hintStyle: TextStyle(color: Color(0xffD2D2D2),),
                    ),
                  ),
                ),
                ),
            ],
          ),
          Container(
            height: 650,
            width: 400,
            
            child:ListView.builder(itemBuilder: (context, index) => const AlphabetListScrollView(
                items:[
                  'CIRSIUM',
                  'CACTUS',
                  'CISSUS',
                  'DIGITALIS',
                  'DIERAMA',
                  'ECHINACEA',
                  'ECHINOPS',
                  'ffff',
                  'fassdi',
                  'kcsuhc',
                  'rtyuityu',
                  'ryyyyy',
                  'mddjie',
                  'mdcy',
                  'zdfgjk',
                  'ECHINACEA',
                  'ECHINOPS',
                  'ffff',
                  'fassdi',
                  'kcsuhc',
                  'rtyuityu',
                  'ryyyyy',
                  'mddjie',
                  'mdcy', 'ECHINACEA',
                  'ECHINOPS',
                  'ffff',
                  'fassdi',
                  'kcsuhc',
                  'rtyuityu',
                  'ryyyyy',
                  'mddjie',
                  'mdcy',
                ]
            ),itemCount: 1,)
          ),
        ],
      ),
    );
  }
}
