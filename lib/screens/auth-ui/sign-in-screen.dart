import 'package:ecommerce_store/screens/auth-ui/sign-up-screen.dart';
import 'package:ecommerce_store/utils/app-constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  @override
  Widget build(BuildContext context) {
    return KeyboardVisibilityBuilder(builder: (context, isKeyboardVisible){
      return Scaffold(
        appBar: AppBar(
          title: Text("Sign In", style: TextStyle(color: AppConstant.appTextColor),),
          centerTitle: true,
          backgroundColor: AppConstant.appSecondaryColor,
        ),

        body: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                isKeyboardVisible
                    ? Text("Welcome to my app")
                    : Column(
                  children: [
                    Lottie.asset("assets/images/splash-icon.json"),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                    margin: EdgeInsets.symmetric(horizontal: 5),
                    width: Get.width,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: TextFormField(
                        cursorColor: AppConstant.appSecondaryColor,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          hintText: "Email",
                          prefixIcon: Icon(Icons.email),
                          contentPadding: EdgeInsets.only(left: 8, top: 2),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          )
                        ),
                      ),
                    )),

                SizedBox(
                  height: 20,
                ),
                Container(
                    margin: EdgeInsets.symmetric(horizontal: 5),
                    width: Get.width,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: TextFormField(
                        cursorColor: AppConstant.appSecondaryColor,
                        keyboardType: TextInputType.visiblePassword,
                        decoration: InputDecoration(
                            hintText: "Password",
                            prefixIcon: Icon(Icons.password),
                            suffixIcon: Icon(Icons.visibility_off),
                            contentPadding: EdgeInsets.only(left: 8, top: 2),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            )
                        ),
                      ),
                    )
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  alignment: Alignment.centerRight,
                  child: Text("Forget Password",
                  style: TextStyle(
                    color: AppConstant.appSecondaryColor,
                    fontWeight: FontWeight.bold,
                  ),
                  ),
                ),

                SizedBox(height: 15,),

                Material(
                  child: Container(
                    width: Get.width/2,
                    height: Get.height/18,
                    decoration: BoxDecoration(
                      color: AppConstant.appSecondaryColor,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: TextButton.icon(
                      onPressed: (){},
                      label: Text("SIGN IN",
                        style: TextStyle(color: AppConstant.appTextColor, fontSize: 18),),
                    ),
                  ),
                ),

                SizedBox(height: 15,),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Don't have an account? ",
                    style: TextStyle(
                      fontSize: 15,
                      color: AppConstant.appSecondaryColor
                    ),
                    ),
                    
                    GestureDetector(
                      onTap: () => Get.offAll(()=> SignUpScreen()),
                      child: Text("Sign Up",
                      style: TextStyle(
                        fontSize: 16,
                      color: AppConstant.appSecondaryColor,
                      fontWeight: FontWeight.bold,
                      ),
                      ),
                    )

                  ],
                )
              ],
            ),
          ),
        ),
      );
    },



    );
  }
}
