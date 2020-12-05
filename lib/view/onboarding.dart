import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'register.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';
import 'package:flutter_svg/flutter_svg.dart';

class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final int _numPages=3;
  final PageController _pageController= PageController(initialPage: 0);
  int _currentPages=0;

  List<Widget> _buildPageIndicator(){
    List<Widget> list=[];
    for(int i=0; i<_numPages; i++){
      list.add(i== _currentPages ? _indicator(true):_indicator(false));
    }
    return list;
  }
  Widget _indicator(bool isActive){
    return AnimatedContainer(
      duration: Duration(milliseconds: 150),
      margin: EdgeInsets.symmetric(horizontal: 8.0),
      height: 8.0,
      width: isActive ? 24.0:16.0,
      decoration: BoxDecoration(
          color: isActive==true ? Colors.white:Color(0xff7b51d3),
          borderRadius: BorderRadius.all(Radius.circular(12.0))
      ),
    );
  }

  Widget buildColumn({String images,String description}){
    return Column(
      mainAxisAlignment:MainAxisAlignment.center,
      children: <Widget>[
        Column(
          children: <Widget>[
            Center(
              child: Image(
                height:300.0,
                image: AssetImage(images),
              ),
            ),
            SizedBox(
              height: 40.0,
            ),
            Column(
              children: <Widget>[
                Text('$description',textAlign: TextAlign.center,style: GoogleFonts.poppins(color: Colors.white,fontSize: 19,fontWeight: FontWeight.w500,)),
              ],
            )
          ],
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays ([SystemUiOverlay.top]);
    return AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle(
            statusBarColor: Colors.transparent
        ),
      child: Scaffold(
          body: Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.indigoAccent[200],
                        Colors.indigoAccent[400],
                        Colors.indigoAccent[700],
                      ]
                  )),
              child:Padding(
                padding: EdgeInsets.symmetric(vertical: 40.0),
                child:
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Container(
                        alignment: Alignment.centerLeft,
                        child: FlatButton(
                          onPressed: (){
                           Get.off(Register());
                          },
                          child: Text('Lewati',style: TextStyle(fontSize: 15.0,color: Colors.white),),
                        )
                    ),
                    Container(
                      height: 500.0,
                      child: PageView(
                        physics: ClampingScrollPhysics(),
                        controller: _pageController,
                        onPageChanged: (int page){
                          setState(() {
                            _currentPages=page;
                          });
                        },
                        children: <Widget>[
                          buildColumn(images: 'assets/images/masker.png',description: 'Gunakan Masker Ketika Berpergian'),
                          buildColumn(images: 'assets/images/distancing.png',description: 'Jaga Jarak \nKetika Berada di Luar Rumah'),
                          buildColumn(images: 'assets/images/washhands.png',description: 'Selalu Menjaga Kebersihan Tangan'),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: _buildPageIndicator(),
                    ),
                    _currentPages != _numPages -1 ?
                    Expanded(
                      child: Align(
                        alignment: FractionalOffset.bottomRight,
                        child: FlatButton(
                          onPressed: (){
                            _pageController.nextPage(duration: Duration(milliseconds: 500),curve: Curves.ease);
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Text('Selanjutnya',style: TextStyle(fontWeight:FontWeight.bold,color: Colors.white,fontSize: 23.0,fontFamily: 'poppins'),),
                              Icon(Icons.arrow_forward_ios,size: 33.0,color: Colors.white,),
                              Icon(Icons.arrow_forward_ios,size: 25.0,color: Colors.white,)
                            ],
                          ),
                        ),
                      ),
                    )
                        : Text('')
                  ],
                ),
              )
          ),
          bottomSheet: _currentPages == _numPages  -1 ? Container(
            color: Colors.white,
            height: 100.0,
            width: double.infinity,
            child: Center(child: GestureDetector(
                onTap: ()async {
                  Get.off(Register());
                },
                child: Text('Mulai',style: TextStyle(color: Colors.indigoAccent,fontSize: 25.0,fontFamily: 'Spartan',letterSpacing: 1.5),))),
          ):Text('')
      ),
    );
  }
}
