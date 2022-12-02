import 'dart:ui';

import 'package:car_rent/Common/color.dart';
import 'package:car_rent/Common/common_text.dart';
import 'package:car_rent/Common/common_textfield.dart';
import 'package:car_rent/Controller/email_controller.dart';
import 'package:car_rent/View/car_add_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController search = TextEditingController();
  String email = '';

  @override
  Widget build(BuildContext context) {
    // setStatusBarColor(App)

    print('EMAIL $email');
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
            margin: EdgeInsets.only(bottom: 5, right: 5, left: 5),
            width: Get.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
              color: Colors.white12,
            ),
            child: SafeArea(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SafeArea(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 25),
                        child: Row(
                          children: [
                            CommonText(
                              text: 'Welcome',
                              size: 16,
                              color: AppColors.white,
                              weight: FontWeight.w700,
                            ),
                            Spacer(),
                            GestureDetector(
                              onTap: () {
                                Get.to(() => CarAddScreen());
                              },
                              child: Icon(
                                Icons.add,
                                color: Colors.white54,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 25),
                      child: CommonTextField(
                        prefixIcon: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              'assets/images/Search.svg',
                              height: 20,
                              width: 20,
                              color: Colors.white,
                            ),
                          ],
                        ),
                        controller: search,
                        fillColor: AppColors.white,
                        validator: (val) {},
                        obScureText: false,
                        textInputAction: TextInputAction.search,
                        hintText: 'Search Cars',
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                  ],
                ),
              ),
            ),
          ),
          preferredSize: Size(width, 120),
        ),
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection('cars')
                    .where('CarSellerId',
                        isEqualTo: firebaseAuth.currentUser!.uid)
                    .snapshots(),
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: snapshot.data!.docs.length,
                      itemBuilder: (BuildContext context, int index) {
                        var carData = snapshot.data!.docs[index];
                        List x = carData['CarImage'];
                        return Container(
                          height: 224,
                          width: width,
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          margin: EdgeInsets.only(
                              left: 5, right: 5, bottom: 10, top: 10),
                          decoration: BoxDecoration(
                            color: Colors.white12,
                            borderRadius: BorderRadius.circular(12),
                            boxShadow: [
                              BoxShadow(
                                offset: Offset(0, 0),
                                blurRadius: 5,
                                color: AppColors.grey.withAlpha(50),
                              ),
                            ],
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                height: 160,
                                width: width,
                                child: PageView.builder(
                                  physics: BouncingScrollPhysics(),
                                  itemCount: x.length,
                                  itemBuilder: (context, index) {
                                    return Padding(
                                      padding: EdgeInsets.only(
                                          left: 10, right: 10, top: 10),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(12),
                                        child: ImageLoading(
                                          url: '${carData['CarImage'][index]}',
                                          height: 160,
                                          width: width,
                                          // width: 110,
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    left: 10, right: 10, bottom: 10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        CommonText(
                                          text: "${carData['CarName']}",
                                          size: 16,
                                          weight: FontWeight.w600,
                                          color: Colors.white70,
                                        ),
                                        Spacer(),
                                        CommonText(
                                          text: '\$${carData['CarPrice']}',
                                          size: 16,
                                          weight: FontWeight.w700,
                                          color: Colors.white70,
                                        ),
                                        CommonText(
                                          text: '/Per Day',
                                          size: 14,
                                          color: Colors.white70,
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 2),
                                    Row(
                                      children: [
                                        CommonText(
                                          text: 'Type :',
                                          size: 12,
                                          weight: FontWeight.w500,
                                          color: Colors.white70,
                                        ),
                                        SizedBox(width: 5),
                                        CommonText(
                                          text: "${carData['CarType']}",
                                          size: 12,
                                          weight: FontWeight.w500,
                                          color: Colors.white70,
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        );
                      },
                    );
                  } else {
                    return loading();
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
