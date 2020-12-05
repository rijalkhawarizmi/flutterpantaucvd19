import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pantaucvd19/services/firestore.dart';
import 'package:get/get.dart';
import 'package:pantaucvd19/view/home.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Register extends StatefulWidget {


  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  TextEditingController nameusercontoller=TextEditingController();

  sha()async{
    SharedPreferences sharedPreferences= await SharedPreferences.getInstance();
    sharedPreferences.setString('name', nameusercontoller.text);
  }


  final formkey=GlobalKey<FormState>();

  String validations(String text){
    if(text.isEmpty){
      return 'Nama Tidak Boleh Kosong';
    }else if(text.length >= 16){
       return 'Nama Terlalu Panjang';
    }
    return null;
  }
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: Size(750, 1334), allowFontScaling: true);
    return Scaffold(
      backgroundColor: Colors.indigoAccent,
      body: Form(
        key: formkey,
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                validator: validations,
                controller: nameusercontoller,
                decoration: InputDecoration(
                  hintText: 'Masukkan Nama Panggilan Anda',
                  hintStyle: TextStyle(fontSize: ScreenUtil().setSp(26)),
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding: EdgeInsets.all(17),
                  border:  OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(color: Colors.white)
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(color: Colors.white)
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(color: Colors.white)
                  ),
                  errorBorder:  OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(color: Colors.red)
                  ),
                ),
              ),
              SizedBox(
                 height: ScreenUtil().setHeight(35),
               ),
              Container(
                height: ScreenUtil().setHeight(80),
                width: double.infinity,
                 child: FlatButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)
                  ),
                  color: Colors.white,
                  onPressed: (){
                    if(formkey.currentState.validate()){
                      formkey.currentState.save();
                      FirestoreServices().addData(nameusercontoller.text);
                      sha();
                      Get.to(Home());
                    }
                  },
                    child: Text('Masuk',style: GoogleFonts.poppins(fontSize: ScreenUtil().setHeight(30)),)
              ),
               )
            ],
          ),
        ),
      ),
    );
  }
}
