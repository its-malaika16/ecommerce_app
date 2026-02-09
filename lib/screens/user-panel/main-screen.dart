import 'package:ecommerce_store/screens/auth-ui/welcome-screen.dart';
import 'package:ecommerce_store/utils/app-constant.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: AppConstant.appSecondaryColor,
          statusBarIconBrightness: Brightness.light),
        backgroundColor: AppConstant.appMainColor,
        title: Text(AppConstant.appMainName),
        centerTitle: true,
        actions: [
          GestureDetector(
            onTap: () async{
              FirebaseAuth _auth = FirebaseAuth.instance;
              await _auth.signOut();
              Get.offAll(() => WelcomeScreen());
            },
          )
        ],
        ),



    );
  }
}
