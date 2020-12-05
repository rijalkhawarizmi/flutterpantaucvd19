import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pantaucvd19/animations/fadeanimations.dart';
import 'package:pantaucvd19/models/modeldataprovinsi.dart';
import 'package:pantaucvd19/viewmodel/viewmodel.dart';
import 'package:provider/provider.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';


class ProvinsiPage extends StatefulWidget {
  @override
  _ProvinsiPageState createState() => _ProvinsiPageState();
}

class _ProvinsiPageState extends State<ProvinsiPage> {




  List<ModelDataProvinsi> listsearch=[];

   Widget buildColumn({String desc1,String desc2,String desc3}){
     return  Column(
       crossAxisAlignment: CrossAxisAlignment.start,
       children: [
         Text(desc1,style: GoogleFonts.poppins(color: Colors.greenAccent,fontSize: ScreenUtil().setSp(40),fontWeight: FontWeight.bold)),
         Text(desc2,style: GoogleFonts.poppins(color: Colors.yellow,fontSize: ScreenUtil().setSp(40),fontWeight: FontWeight.bold)),
         Text(desc3,style: GoogleFonts.poppins(color: Colors.red[400],fontSize: ScreenUtil().setSp(40),fontWeight: FontWeight.bold)),
       ],
     );
   }

   TextEditingController controllersearch=TextEditingController();

  onSearch(String text)async{
    if(text.isEmpty){
      listsearch.clear();
      setState(() {});
      return;
    }
    setState(() {
          listsearch=Provider.of<ProviderServices>(context,listen: false).getlistprovinsi.where((e) =>
          (e.attributes.Provinsi.toLowerCase().contains(text.toLowerCase()))
          ).toList();
      });
  }


  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: Size(750, 1334), allowFontScaling: true);
    Provider.of<ProviderServices>(context,listen: false).fetchDataProvinsi();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent[400],
        title: Text('Daftar Provinsi'),
      ),
      body: Container(
        margin: EdgeInsets.only(top: 15,left: 15,right: 15),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 10),
              child: TextField(
                controller: controllersearch,
                onChanged: onSearch,
                decoration: InputDecoration(
                  hintText: 'Cari Provinsi',
                  hintStyle: GoogleFonts.poppins(),
                  contentPadding: EdgeInsets.all(16),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(color: Colors.blue)
                  ),
                  focusedBorder:  OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(color: Colors.blue)
                ),
                )
              ),
            ),
            Expanded(
              child: listsearch==null || listsearch.isEmpty ?
              Consumer<ProviderServices>(
                builder: (context,prov,_)=>
                    prov.getlistprovinsi == null || prov.getlistprovinsi.isEmpty ?
                    SpinKitPouringHourglass(
                      color: Colors.blueAccent,
                      size: 70,
                    ):
                    ListView.builder(
                  itemCount: prov.getlistprovinsi.length,
                  itemBuilder: (context,i){
                    final list=prov.getlistprovinsi[i];
                    return  FadeAnimations(0.1, Container(
                      margin: EdgeInsets.symmetric(vertical: 5),
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black26,
                              blurRadius: 6.0,
                              offset: Offset(0,6)
                          )
                        ],
                        color: Colors.blueAccent[400],
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('${list.attributes.Provinsi}',style: GoogleFonts.poppins(color: Colors.white,fontSize: ScreenUtil().setSp(40),fontWeight: FontWeight.bold),),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              buildColumn(desc1: 'Sembuh',desc2: 'Positif',desc3: 'Meninggal'),
                              buildColumn(desc1: '${list.attributes.Kasus_Semb}',desc2: '${list.attributes.Kasus_Posi}',desc3: '${list.attributes.Kasus_Meni}'),
                              buildColumn(desc1: '😊',desc2: '☹',desc3: '😭'),
                            ],
                          ),
                        ],
                      ),
                     )
                    );
                  },
                ),
              ):ListView.builder(
              itemCount:listsearch.length,
              itemBuilder: (context,i){
                final lists=listsearch[i];
                return FadeAnimations(
                  0.1, Container(
                  margin: EdgeInsets.symmetric(vertical: 3),
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.blueAccent[400],
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('${lists.attributes.Provinsi}',style: GoogleFonts.poppins(color: Colors.white,fontSize: ScreenUtil().setSp(40),fontWeight: FontWeight.bold),),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          buildColumn(desc1: 'Sembuh',desc2: 'Positif',desc3: 'Meninggal'),
                          buildColumn(desc1: '${lists.attributes.Kasus_Semb}',desc2: '${lists.attributes.Kasus_Posi}',desc3: '${lists.attributes.Kasus_Meni}'),
                          buildColumn(desc1: '😊',desc2: '☹',desc3: '😭'),
                        ],
                      ),
                    ],
                  ),
                )
                );
              },
            )
            )
          ],
        ),
      ),
    );
  }
}
