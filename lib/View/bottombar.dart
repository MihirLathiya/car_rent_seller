import 'package:car_rent/Controller/email_controller.dart';
import 'package:car_rent/View/chat_screen.dart';
import 'package:car_rent/View/home_screen.dart';
import 'package:car_rent/View/profile_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:floating_bottom_navigation_bar/floating_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Controller/bottom_controller.dart';

class SellerBottomBar extends StatefulWidget {
  SellerBottomBar({Key? key}) : super(key: key);

  @override
  State<SellerBottomBar> createState() => _SellerBottomBarState();
}

class _SellerBottomBarState extends State<SellerBottomBar>
    with WidgetsBindingObserver {
  BottomController bottomController = Get.put(BottomController());

  List pages = [
    HomeScreen(),
    ChatScreen(),
    ProfileScreen(),
  ];
  setStatus(String status) async {
    await FirebaseFirestore.instance
        .collection('seller')
        .doc(firebaseAuth.currentUser!.uid)
        .update(
      {"status": status},
    );
  }

  void initState() {
    setStatus('Online');
    WidgetsBinding.instance.addObserver(this);

    super.initState();
  }

  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      // online
      setStatus("Online");
    } else {
      setStatus("Offline");
      // offline
    }
    super.didChangeAppLifecycleState(state);
  }

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
            FloatingNavbarItem(icon: Icons.home_outlined, title: 'Home'),
            FloatingNavbarItem(
                icon: Icons.chat_bubble_outlined, title: 'Chats'),
            FloatingNavbarItem(
                icon: Icons.settings_outlined, title: 'Settings'),
          ],
        ),
        body: pages[bottomController.selectedPage.value],
      ),
    );
  }
}
