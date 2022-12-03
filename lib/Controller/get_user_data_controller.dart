import 'dart:collection';

import 'package:car_rent/Controller/email_controller.dart';
import 'package:car_rent/Notofication/notification.dart';
import 'package:car_rent/PrefrenceManager/prefrence_manager.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class UserdataController extends GetxController {
  String name = '';
  String image = '';
  String email = '';
  List allIds = [];

  getUserData() async {
    var data = await FirebaseFirestore.instance
        .collection('seller')
        .doc(firebaseAuth.currentUser!.uid)
        .get();
    Map<String, dynamic>? userData = data.data();

    image = userData!['image'];
    name = userData['name'];
    email = userData['email'];
    SellerPrefrenceManager.setName(name);
    SellerPrefrenceManager.setLogIn(email);
    update();
  }

  getListOfAllUser() async {
    CollectionReference _collectionRef =
        FirebaseFirestore.instance.collection('seller');

    QuerySnapshot querySnapshot = await _collectionRef.get();

    final allData = querySnapshot.docs.map((doc) => doc.id).toList();
    if (allData.contains(firebaseAuth.currentUser!.uid)) {
      getUserData();
    }

    print('ALL DOCS IDS :- ${allData}');
    update();
  }

  sendButton() async {}

  sendMessage({message}) async {
    CollectionReference _collectionRef =
        FirebaseFirestore.instance.collection('buyer');

    QuerySnapshot querySnapshot = await _collectionRef.get();

    final allData = querySnapshot.docs.map((doc) => doc.data()).toList();
    print('ALL DOCS IDS :- ${allData}');
    allData.forEach((element) {
      final data = Map<String, dynamic>.from(element as LinkedHashMap);
      print('--element--${data['fcm']}');
      AppNotificationHandler.sendMessage(
          msg: message, receiverFcmToken: '${data['fcm']}');
    });
  }
}
