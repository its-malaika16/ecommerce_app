import 'dart:async';

import 'package:ecommerce_store/controllers/get-user-data-controller.dart';
import 'package:ecommerce_store/screens/admin-panel/admin-main-screen.dart';
import 'package:ecommerce_store/screens/auth-ui/welcome-screen.dart';
import 'package:ecommerce_store/screens/user-panel/main-screen.dart';
import 'package:ecommerce_store/utils/app-constant.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  User? user = FirebaseAuth.instance.currentUser;

  @override
  void initState(){
    super.initState();
    Timer(Duration(seconds: 3), (){
      loggedin(context);
    });
  }

  Future<void> loggedin(BuildContext context) async{
    if(user != null){
      final GetUserDataController getUserDataController = Get.put(GetUserDataController());
      var userData = await getUserDataController.getUserData(user!.uid);

      if(userData[0]['isAdmin'] == true){
        Get.offAll(() => AdminMainScreen());
      }else{
        Get.offAll(() => MainScreen());
      }
    }
    else{
      Get.to(() => WelcomeScreen());
    }
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: AppConstant.appSecondaryColor,
      appBar: AppBar(
        backgroundColor: AppConstant.appSecondaryColor,
        elevation: 0,
      ),
      body: Container(
        child: Column(
          children: [
            Expanded(
              child: Container(
                width: Get.width,
                alignment: Alignment.center,
                child: Lottie.asset('assets/images/splash-icon.json'),
              ),
            ),

            Container(
              margin: EdgeInsets.only(bottom: 20),
              width: Get.width,
              alignment: Alignment.center,
              child: Text(
                AppConstant.appPoweredBy,
                style: TextStyle(
                  color: AppConstant.appTextColor,
                  fontSize: 12,
                ),
              ),

            )
          ],
        ),
      ),
    );
  }
}
