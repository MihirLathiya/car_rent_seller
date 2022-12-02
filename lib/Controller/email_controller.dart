import 'dart:io';

import 'package:car_rent/Controller/add_image_controller.dart';
import 'package:car_rent/Controller/get_user_data_controller.dart';
import 'package:car_rent/PrefrenceManager/prefrence_manager.dart';
import 'package:car_rent/View/bottombar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

FirebaseAuth firebaseAuth = FirebaseAuth.instance;

class EmailController extends GetxController {
  ImageAddController imageAddController = Get.put(ImageAddController());
  UserdataController userdataController = Get.put(UserdataController());
  void signUp(
      {String? email,
      String? password,
      String? name,
      RoundedLoadingButtonController? buttonController}) async {
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email!, password: password!);

      String? image = await imageAddController.uploadFile(
          file: imageAddController.userImage,
          filename: firebaseAuth.currentUser!.uid);
      await FirebaseFirestore.instance
          .collection('seller')
          .doc(firebaseAuth.currentUser!.uid)
          .set({
        'email': email,
        'password': password,
        'name': name,
        'status': 'Online',
        'image': image
      });
      Get.offAll(() => SellerBottomBar());
      showAlert('SignUp Successful');

      buttonController!.reset();
      SellerPrefrenceManager.setName(name!);
      SellerPrefrenceManager.setLogIn(email);
    } on FirebaseAuthException catch (e) {
      buttonController!.reset();

      if (e.code == 'weak-password') {
        showAlert('The password provided is too weak');
      } else if (e.code == 'email-already-in-use') {
        showAlert('The account already exists for that email');
      } else if (e.code == 'network-request-failed') {
        showAlert('No Network');
      } else if (e.code == 'user-disabled') {
        showAlert('user Disable');
      } else if (e.code == 'invalid-email') {
        showAlert('Invalid Email');
      }
    }
  }

  void logIn(
      {String? email,
      String? password,
      RoundedLoadingButtonController? buttonController}) async {
    update();
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email!, password: password!);
      showAlert('LogIn Successful');
      Get.offAll(() => SellerBottomBar());
      if (firebaseAuth.currentUser!.uid.isNotEmpty) {
        userdataController.getListOfAllUser();
      }
      buttonController!.reset();
    } on FirebaseAuthException catch (e) {
      buttonController!.reset();
      if (e.code == 'user-not-found') {
        showAlert('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        showAlert('Wrong password provided for that user.');
      } else if (e.code == "invalid-email") {
        showAlert('Invalid Email');
      }
    }
  }

  void logOut() async {
    try {
      FirebaseAuth.instance.signOut();
    } catch (e) {
      print(e);
    }
  }

  File? userImage;
  final picker = ImagePicker();
  pickImage() async {
    var pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      userImage = File(pickedFile.path);
      update();
    }
  }
}

void showAlert(String? msg) {
  Fluttertoast.showToast(
    msg: msg!,
  );
}
