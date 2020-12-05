import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pantaucvd19/view/explainpage.dart';
import 'package:pantaucvd19/view/home.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pantaucvd19/animations/fadeanimations.dart';


class Detail extends StatefulWidget {

  String username;
  Detail({this.username});
  @override
  _DetailState createState() => _DetailState();
}



class _DetailState extends State<Detail> {



  Widget buildSymptoms({String image,String desc,double duration}){
    return FadeAnimations(duration,
      Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                  offset: Offset(0, 10),
                  blurRadius: 20.0,
                  color: Colors.black38
              )
            ]
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              Image.asset(image),
              Text(desc,style: TextStyle(fontFamily: 'poppins',fontSize: 10.0),)
            ],
          ),
        ),
      ),
    );
  }

  Widget buildPrevention({String image,String title,String desc}){
    return FadeAnimations(2.8, Container(
      height: 156,
      child: Stack(
        children: <Widget>[
          Container(
            height:136,
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                      offset: Offset(0, 10),
                      blurRadius: 10.0,
                      color: Colors.black38
                  )
                ]
            ),
          ),
          Image.asset(image),
          Positioned(
            left: 130.0,
            child: Container(
                margin: EdgeInsets.only(left: 9),
                width: MediaQuery.of(context).size.width-10,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      height: 20.0,
                    ),
                    Text(title,style: GoogleFonts.poppins(fontWeight: FontWeight.bold)),
                    Text(desc,style: TextStyle(fontSize: 12.0),),
                  ],
                )
            ),
          ),
          Positioned(
            bottom: 40,
            right: 20,
            child: GestureDetector(
              onTap: (){
                Get.to(Explain2());
              },
              child: Text('Detail',style: TextStyle(color: Colors.blue,fontSize: 13.0,fontFamily: 'poppins'),),
            ),
          )
        ],
      ),
     ),
    );
  }
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown
    ]);
    ScreenUtil.init(context, designSize: Size(750, 1334), allowFontScaling: true);
    SystemChrome.setEnabledSystemUIOverlays ([SystemUiOverlay.top]);
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
          statusBarColor: Colors.transparent
      ),
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              ClipPath(
                clipper: MyClipper(),
                child: Container(
                  height: 304.0,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        colors: [
                          Colors.indigoAccent[400],
                          Colors.indigoAccent[700]
                        ],
                      ),
                      image: DecorationImage(
                          image:AssetImage('assets/images/virus.png'))
                  ),
                  child: Column(
                    children: <Widget>[
                      Expanded(
                        child: Stack(
                          children: <Widget>[
                            Container(
                              margin:EdgeInsets.only(top: 30.0,right: 110.0),
                              child: SvgPicture.asset('assets/icons/coronadr.svg',width:230,fit: BoxFit.fitWidth,
                                alignment: Alignment.topCenter,
                              ),
                            ),
                            Positioned(
                              right: 35.0,
                              top: 80.0,
                              child:Text('Hai ${widget.username} \n Ketahui Apa Saja \n Gejala Covid-19',
                                textAlign: TextAlign.center,style: GoogleFonts.poppins(letterSpacing:1.0,color: Colors.white,fontSize: ScreenUtil().setSp(30),fontWeight: FontWeight.w700),),
                            ),
                            Container()
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(20.0),
                child: Column(
                  children: <Widget>[
                    Text('Gejala',style: TextStyle(fontFamily: 'Spartan',fontSize: 20.0),),
                    SizedBox(
                      height: 10.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                       buildSymptoms(image: 'assets/images/caugh.png',desc: 'Batuk',duration: 1.0),
                       buildSymptoms(image: 'assets/images/headache.png',desc: 'Sakit Kepala',duration: 1.3),
                       buildSymptoms(image: 'assets/images/fever.png',desc: 'Demam',duration: 1.6),
                      ],
                    ),
                    SizedBox(
                      height: 50.0,
                    ),
                    Text('Pencegahan',style: TextStyle(fontFamily: 'Spartan',fontSize: 20.0),),
                    SizedBox(
                      height: 10.0,
                    ),

                    buildPrevention(image: 'assets/images/wash_hands.png',title: 'Mencuci Tangan',desc: 'Salah satu cara pencegahan\n virus corona adalah dengan \n sering mencuci tangan'),
                   buildPrevention(image: 'assets/images/wear_mask.png',title: 'Gunakan Masker',desc: 'Gunakan masker dalam\nsituasi dan kondisi \nsebagai berikut:'),

                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}


class MyClipper extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {
    var path=Path();
    path.lineTo(0,size.height-80);
    path.quadraticBezierTo(size.width/2, size.height, size.width, size.height-80);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {

    return false;
  }
}

