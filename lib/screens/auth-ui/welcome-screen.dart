import 'package:ecommerce_store/screens/auth-ui/sign-in-screen.dart';
import 'package:ecommerce_store/utils/app-constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppConstant.appSecondaryColor,
        title: Text("Welcome to Ecommerce Store",
        style: TextStyle(color: AppConstant.appTextColor),),
        elevation: 0,
        centerTitle: true,
      ),
      
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              child: Lottie.asset("assets/images/splash-icon.json"),
            ),

            Container(
              margin: EdgeInsets.only(top: 20),
              child: Text("Happy Shopping",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            SizedBox(height: Get.height/12,),

            Material(
              child: Container(
                  width: Get.width/1.2,
                  height: Get.height/12,
                decoration: BoxDecoration(
                  color: AppConstant.appSecondaryColor,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: TextButton.icon(
                    onPressed: (){},
                    label: Text("Sign in with google",style: TextStyle(color: AppConstant.appTextColor),),
                    icon: Image.asset("assets/images/final-google-logo.png",
                    width: Get.width/12,
                    height: Get.height/12,
                    ),

                ),
              ),
            ),

            SizedBox(height: 20),

            Material(
              child: Container(
                width: Get.width/1.2,
                height: Get.height/12,
                decoration: BoxDecoration(
                  color: AppConstant.appSecondaryColor,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: TextButton.icon(
                  onPressed: (){
                    Get.to(()=> SignInScreen());
                  },
                  label: Text("Sign in with email",style: TextStyle(color: AppConstant.appTextColor),),
                  icon: Icon(Icons.email,
                    color: AppConstant.appTextColor,
                    ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
