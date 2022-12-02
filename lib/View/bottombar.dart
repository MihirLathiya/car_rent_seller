import 'package:car_rent/View/chat_screen.dart';
import 'package:car_rent/View/home_screen.dart';
import 'package:car_rent/View/profile_screen.dart';
import 'package:floating_bottom_navigation_bar/floating_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Controller/bottom_controller.dart';

class SellerBottomBar extends StatelessWidget {
  SellerBottomBar({Key? key}) : super(key: key);
  BottomController bottomController = Get.put(BottomController());

  List pages = [
    HomeScreen(),
    ChatScreen(),
    ProfileScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        backgroundColor: Colors.transparent,
        extendBody: true,
        bottomNavigationBar: FloatingNavbar(
          selectedBackgroundColor: Colors.white54,
          onTap: (int val) {
            bottomController.selectItem(val);
          },
          currentIndex: bottomController.selectedPage.value,
          items: [
            FloatingNavbarItem(icon: Icons.home, title: 'Home'),
            FloatingNavbarItem(icon: Icons.chat_bubble, title: 'Chats'),
            FloatingNavbarItem(icon: Icons.settings, title: 'Settings'),
          ],
        ),
        body: pages[bottomController.selectedPage.value],
      ),
    );
  }
}
