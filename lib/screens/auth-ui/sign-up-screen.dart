import 'package:ecommerce_store/controllers/sign-up-controller.dart';
import 'package:ecommerce_store/screens/auth-ui/sign-in-screen.dart';
import 'package:ecommerce_store/utils/app-constant.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:get/get.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final SignUpController signUpController = Get.put(SignUpController());
  TextEditingController username = TextEditingController();
  TextEditingController userEmail = TextEditingController();
  TextEditingController userPhone = TextEditingController();
  TextEditingController userCity = TextEditingController();
  TextEditingController userPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return KeyboardVisibilityBuilder(
      builder: (context, isKeyboardVisible) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              "Sign Up",
              style: TextStyle(color: AppConstant.appTextColor),
            ),
            centerTitle: true,
            backgroundColor: AppConstant.appSecondaryColor,
          ),

          body: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Container(
              child: Column(
                children: [
                  SizedBox(height: 15),

                  Container(
                    alignment: Alignment.center,
                    child: Text(
                      "Welcome to my app",
                      style: TextStyle(
                        color: AppConstant.appSecondaryColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                      ),
                    ),
                  ),

                  SizedBox(height: 20),

                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 5),
                    width: Get.width,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: TextFormField(
                        controller: userEmail,
                        cursorColor: AppConstant.appSecondaryColor,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          hintText: "Email",
                          prefixIcon: Icon(Icons.email),
                          contentPadding: EdgeInsets.only(left: 8, top: 2),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: 20),

                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 5),
                    width: Get.width,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: TextFormField(
                        controller: username,
                        cursorColor: AppConstant.appSecondaryColor,
                        keyboardType: TextInputType.name,
                        decoration: InputDecoration(
                          hintText: "UserName",
                          prefixIcon: Icon(Icons.person),
                          contentPadding: EdgeInsets.only(left: 8, top: 2),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: 20),

                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 5),
                    width: Get.width,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: TextFormField(
                        controller: userPhone,
                        cursorColor: AppConstant.appSecondaryColor,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          hintText: "Phone",
                          prefixIcon: Icon(Icons.phone),
                          contentPadding: EdgeInsets.only(left: 8, top: 2),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: 20),

                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 5),
                    width: Get.width,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: TextFormField(
                        controller: userCity,
                        cursorColor: AppConstant.appSecondaryColor,
                        keyboardType: TextInputType.streetAddress,
                        decoration: InputDecoration(
                          hintText: "City",
                          prefixIcon: Icon(Icons.location_city),
                          contentPadding: EdgeInsets.only(left: 8, top: 2),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: 20),

                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 5),
                    width: Get.width,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Obx(
                        () => TextFormField(
                          controller: userPassword,
                          obscureText: signUpController.isPasswordVisible.value,
                          cursorColor: AppConstant.appSecondaryColor,
                          keyboardType: TextInputType.visiblePassword,
                          decoration: InputDecoration(
                            hintText: "Password",
                            prefixIcon: Icon(Icons.password),
                            suffixIcon: GestureDetector(
                              onTap: () {
                                signUpController.isPasswordVisible.toggle();
                              },
                              child: signUpController.isPasswordVisible.value
                                  ? Icon(Icons.visibility_off)
                                  : Icon(Icons.visibility),
                            ),
                            contentPadding: EdgeInsets.only(left: 8, top: 2),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: 15),

                  Material(
                    child: Container(
                      width: Get.width / 2,
                      height: Get.height / 18,
                      decoration: BoxDecoration(
                        color: AppConstant.appSecondaryColor,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: TextButton.icon(
                        onPressed: () async {
                          String name = username.text.trim();
                          String email = userEmail.text.trim();
                          String phone = userPhone.text.trim();
                          String city = userCity.text.trim();
                          String password = userPassword.text.trim();
                          String userDeviceToken = '';

                          if (name.isEmpty ||
                              email.isEmpty ||
                              phone.isEmpty ||
                              city.isEmpty ||
                              password.isEmpty) {
                            Get.snackbar(
                              "Error",
                              "Please enter all details",
                              snackPosition: SnackPosition.BOTTOM,
                              backgroundColor: AppConstant.appSecondaryColor,
                              colorText: AppConstant.appTextColor,
                            );
                          } else {
                            UserCredential? userCredential =
                                await signUpController.signUpMethod(
                                  name,
                                  email,
                                  phone,
                                  city,
                                  password,
                                  userDeviceToken,
                                );

                            if (userCredential != null) {
                              Get.snackbar(
                                "Verification email sent",
                                "Please check your email.",
                                snackPosition: SnackPosition.BOTTOM,
                                backgroundColor: AppConstant.appSecondaryColor,
                                colorText: AppConstant.appTextColor,
                              );

                              FirebaseAuth.instance.signOut();
                              Get.offAll(()=> SignInScreen());
                            }
                          }
                        },
                        label: Text(
                          "SIGN UP",
                          style: TextStyle(
                            color: AppConstant.appTextColor,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: 15),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Already have an account? ",
                        style: TextStyle(
                          fontSize: 15,
                          color: AppConstant.appSecondaryColor,
                        ),
                      ),

                      GestureDetector(
                        onTap: () => Get.offAll(() => SignInScreen()),
                        child: Text(
                          "Sign In",
                          style: TextStyle(
                            fontSize: 16,
                            color: AppConstant.appSecondaryColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
