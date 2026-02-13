import 'package:ecommerce_store/screens/auth-ui/welcome-screen.dart';
import 'package:ecommerce_store/utils/app-constant.dart';
import 'package:ecommerce_store/widgets/banner-widget.dart';
import 'package:ecommerce_store/widgets/category-widget.dart';
import 'package:ecommerce_store/widgets/custom-drawer-widget.dart';
import 'package:ecommerce_store/widgets/heading-widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: AppConstant.appTextColor),
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: AppConstant.appSecondaryColor,
          statusBarIconBrightness: Brightness.light,
        ),
        backgroundColor: AppConstant.appMainColor,
        title: Text(
          AppConstant.appMainName,
          style: TextStyle(color: AppConstant.appTextColor),
        ),
        centerTitle: true,
        actions: [],
      ),
      drawer: DrawerWidget(),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Container(
          child: Column(
            children: [
              SizedBox(height: Get.height / 90.0),

              BannerWidget(),

              HeadingWidget(
                headingTitle: 'Categories',
                headingSubTitle: 'According to your budget',
                onTap: () {},
                buttonText: 'See More >',
              ),

              CategoryWidget(),

              HeadingWidget(
                headingTitle: 'Flash Sale',
                headingSubTitle: 'Save upto 50%',
                onTap: () {},
                buttonText: 'See More >',
              ),


            ],
          ),
        ),
      ),
    );
  }
}
