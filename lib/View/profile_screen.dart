import 'package:car_rent/Common/color.dart';
import 'package:car_rent/Common/common_text.dart';
import 'package:car_rent/Controller/add_image_controller.dart';
import 'package:car_rent/Controller/email_controller.dart';
import 'package:car_rent/Controller/get_user_data_controller.dart';
import 'package:car_rent/PrefrenceManager/prefrence_manager.dart';
import 'package:car_rent/View/Auth/authentication.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  UserdataController userdataController = Get.put(UserdataController());
  ImageAddController imageAddController = Get.put(ImageAddController());

  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();

  var borderStyle = OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(color: Colors.black54));

  bool isLoading = false;
  @override
  void initState() {
    name.text = userdataController.name;
    email.text = userdataController.email;
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
          image: AssetImage('assets/images/background.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: PreferredSize(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            width: width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
              color: Colors.white12,
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SafeArea(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 25),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CommonText(
                            text: 'Profile',
                            size: 20,
                            color: AppColors.white,
                            weight: FontWeight.w700,
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                ],
              ),
            ),
          ),
          preferredSize: Size(width, 50),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: GetBuilder<UserdataController>(
                  builder: (controller) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GetBuilder<ImageAddController>(
                          builder: (controller2) {
                            return GestureDetector(
                              onTap: () {
                                controller2.pickImage();
                              },
                              child: Container(
                                height: 150,
                                width: 150,
                                clipBehavior: Clip.antiAliasWithSaveLayer,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.white24),
                                padding: EdgeInsets.all(7),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(1000),
                                  child: controller2.userImage != null
                                      ? Image.file(
                                          controller2.userImage!,
                                          fit: BoxFit.cover,
                                        )
                                      : controller.image != ''
                                          ? Image.network(
                                              controller.image,
                                              fit: BoxFit.cover,
                                            )
                                          : Image.asset(
                                              'assets/images/splash.jpg',
                                              fit: BoxFit.cover,
                                            ),
                                ),
                              ),
                            );
                          },
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        CommonContainer(
                          child: TextField(
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w500),
                            controller: name,
                            cursorColor: Colors.black54,
                            decoration: InputDecoration(
                              border: borderStyle,
                              enabledBorder: borderStyle,
                              focusedBorder: borderStyle,
                              fillColor: Colors.white38,
                              filled: true,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        CommonContainer(
                          child: TextField(
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w500),
                            controller: email,
                            cursorColor: Colors.black54,
                            decoration: InputDecoration(
                              border: borderStyle,
                              enabledBorder: borderStyle,
                              focusedBorder: borderStyle,
                              fillColor: Colors.white38,
                              filled: true,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                          width: Get.width - 200,
                          child: CommonContainer(
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  primary: Colors.black),
                              onPressed: () async {
                                String? imageUrl =
                                    imageAddController.userImage != null
                                        ? await imageAddController.uploadFile(
                                            file: imageAddController.userImage,
                                            filename:
                                                firebaseAuth.currentUser!.uid)
                                        : controller.image;
                                FirebaseFirestore.instance
                                    .collection('seller')
                                    .doc(firebaseAuth.currentUser!.uid)
                                    .update(
                                  {
                                    'image': imageUrl!.trim(),
                                    'name': name.text.trim(),
                                    'email': email.text.trim(),
                                  },
                                ).then((value) {
                                  controller.getUserData();
                                  showAlert('Update successfully');
                                });
                                SellerPrefrenceManager.setName(
                                    name.text.trim());
                              },
                              child: Text('Update'),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                          width: Get.width - 200,
                          child: CommonContainer(
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  primary: Colors.black),
                              onPressed: () {
                                SellerPrefrenceManager.remove();
                                Get.offAll(
                                  () => AuthScreen(),
                                );
                              },
                              child: Text('LogOut'),
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                )),
          ),
        ),
      ),
    );
    ;
  }
}

Widget CommonContainer({Widget? child}) {
  return Container(
    height: 70,
    clipBehavior: Clip.antiAliasWithSaveLayer,
    decoration: BoxDecoration(
      color: Colors.white24,
      borderRadius: BorderRadius.circular(12),
    ),
    padding: EdgeInsets.all(7),
    child: child,
  );
}
