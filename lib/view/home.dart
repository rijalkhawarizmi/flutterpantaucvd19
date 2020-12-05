import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:pantaucvd19/view/detailpage.dart';
import 'package:pantaucvd19/view/provinsipage.dart';
import 'package:pantaucvd19/viewmodel/viewmodel.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/services.dart';

import 'package:pantaucvd19/animations/fadeanimations.dart';



class Home extends StatefulWidget {

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  void dat(){
    initializeDateFormatting("id", null);
  }

  String username;
  sha()async{
    SharedPreferences sharedPreferences= await SharedPreferences.getInstance();
    setState(() {
      username=sharedPreferences.getString('name');
    });
  }

  String day;
  String datetime;
  alldate(){
    day=DateFormat('EEEE','id').format(DateTime.now());
    datetime=DateFormat('dd-MM-yyyy','id').format(DateTime.now());
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initializeDateFormatting('id');
    sha();
    alldate();
  }


  Widget padding({String desc,String total,Color color}){
    return  Padding(
      padding: const EdgeInsets.symmetric(horizontal: 17.0),
      child: FadeAnimations(0.1,  Container(
          child: Column(
            children: <Widget>[
              Text('$total',style: GoogleFonts.poppins(color: color,fontSize: ScreenUtil().setSp(43),fontWeight:FontWeight.bold,shadows:[
                Shadow(
                  color: Colors.white,
                  offset: Offset(0,1)
                )
              ]),),
              SizedBox(
                height: 20.0,
              ),
              Text('$desc',style: GoogleFonts.poppins(color: color,fontWeight: FontWeight.w700,fontSize: ScreenUtil().setSp(38)),),
            ],
          )
      ),
      ),
    );
  }


  @override
  Widget build(BuildContext context) {

    Provider.of<ProviderServices>(context,listen: false).fetchAllDataIndonesia();

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
                MyHeader(namalengkap: username,image: 'assets/icons/Drcorona.svg',texttop: 'Di Rumah',textmiddle: 'Aja yaa',),
                Container(
                    margin: EdgeInsets.only(left: 16.0,right: 20.0),
                    height: 70.0,
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                      Text('Kasus Update',style: GoogleFonts.poppins(fontSize: ScreenUtil().setSp(35),fontWeight: FontWeight.bold,letterSpacing: 1),),
                        SizedBox(
                          width: 10.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Text('$day',style: GoogleFonts.poppins(fontSize: ScreenUtil().setSp(30),fontWeight: FontWeight.w500),),
                                SizedBox(
                                  width: 10.0,
                                ),
                                Text('$datetime',style: GoogleFonts.poppins(fontSize: ScreenUtil().setSp(30),fontWeight: FontWeight.w500),),
                              ],
                            ),
                            GestureDetector(
                                onTap: (){
                                  Get.to(Detail(username: username,));
                                },
                                child:Text('Lihat Detail',style: GoogleFonts.poppins(fontSize: ScreenUtil().setSp(35),fontWeight: FontWeight.w500,color: Colors.blue,letterSpacing: 1),)),
                          ],
                        )
                      ],

                    )
                ),
                SizedBox(
                  height: 30.0,
                ),
                Container(
                  height: ScreenUtil().setHeight(170),
                  child: Expanded(
                    child: Consumer<ProviderServices>(
                      builder: (context,prov,_)
                      =>prov.alldata.isEmpty ? SpinKitPouringHourglass(
                        color: Colors.blueAccent,
                        size: 70.0,
                      ): Container(
                        child: ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          itemCount: prov.alldata.length,
                          itemBuilder: (context,i){
                            final list=prov.alldata[i];
                            return Container(
                              child: Row(
                                children: [
                                  padding(desc: 'Sembuh',total: '${list.sembuh}',color: Colors.greenAccent),
                                  padding(desc: 'Positif',total: '${list.positif}',color: Colors.yellow),
                                  padding(desc: 'Meninggal',total: '${list.meninggal}',color: Colors.red),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    )
                  ),
                ),
                SizedBox(
                  height: 25.0,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 12.0,right: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                    Text('Penyebaran Virus',style: GoogleFonts.poppins(fontSize: ScreenUtil().setSp(33),fontWeight: FontWeight.w700,letterSpacing: 1),),
                      GestureDetector(
                        onTap: (){
                          Get.to(ProvinsiPage());
                        },
                        child: Text('Lihat Detail',style: GoogleFonts.poppins(fontSize: ScreenUtil().setSp(35),fontWeight: FontWeight.w500,color: Colors.blue,letterSpacing: 1),)
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 30.0,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 10.0),
                  child: Image(
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: ScreenUtil().setHeight(230),
                    image: AssetImage('assets/images/map.png'),
                  ),
                ),
              ],
            ),
          )
      ),
    );
  }
}

class MyHeader extends StatelessWidget {
  const MyHeader({
    Key key,
    @required this.namalengkap,
    @required this.image,
    @required this.texttop,
    @required this.textmiddle,
    @required this.textbottom,
  }) : super(key: key);

  final String namalengkap;
  final String image;
  final String texttop;
  final String textmiddle;
  final String textbottom;

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: MyClipper(),
      child: Container(
        height: ScreenUtil().setHeight(525),
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
                    margin:EdgeInsets.only(top: 30.0,right: 110.0,left: 30.0),
                    child: SvgPicture.asset(image,width:200,fit: BoxFit.fitWidth,
                      alignment: Alignment.topCenter,
                    ),
                  ),
                  Positioned(
                    left: 180.0,
                    top: 77.0,
                    child:Text('$texttop  \n $textmiddle \n $namalengkap',
                      textAlign: TextAlign.center,style:
                      GoogleFonts.poppins(color: Colors.white,fontWeight: FontWeight.bold,fontSize: ScreenUtil().setSp(35),letterSpacing: 1),)
                  ),
                  Container()
                ],
              ),
            )
          ],
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
