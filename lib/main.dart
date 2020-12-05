import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:pantaucvd19/view/onboarding.dart';
import 'package:get/get.dart';
import 'package:pantaucvd19/viewmodel/viewmodel.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:provider/provider.dart';
import 'view/home.dart';


void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  String name;
    SharedPreferences sharedPreferences= await SharedPreferences.getInstance();
      name=sharedPreferences.getString('name');

  runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_)=>ProviderServices())
        ],
        child: GetMaterialApp(
          debugShowCheckedModeBanner: false,
          home: name!=null ? Home():OnboardingScreen(),
        ),
      )
  );
}
