import 'dart:async';
import 'dart:ui';

import 'package:car_rent/PrefrenceManager/prefrence_manager.dart';
import 'package:car_rent/View/Auth/authentication.dart';
import 'package:car_rent/View/bottombar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(Duration(seconds: 3), () {
      Get.offAll(() => SellerPrefrenceManager.getLogIn() != null
          ? SellerBottomBar()
          : AuthScreen());
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.black,
        image: DecorationImage(
          image: AssetImage('assets/images/splash.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: 4,
            sigmaY: 4,
          ),
          child: Center(
            child: Text(
              'Gas \'N\' Go',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w900,
                fontSize: 50,
                fontFamily: 'Mali',
              ),
            ),
          ),
        ),
      ),
    );
  }
}
