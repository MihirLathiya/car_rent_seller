import 'dart:io';
import 'dart:math';
import 'dart:ui';

import 'package:car_rent/Common/color.dart';
import 'package:car_rent/Common/common_text.dart';
import 'package:car_rent/Common/common_textfield.dart';
import 'package:car_rent/Controller/bottom_controller.dart';
import 'package:car_rent/Controller/driver_controller.dart';
import 'package:car_rent/Controller/email_controller.dart';
import 'package:car_rent/Controller/get_user_data_controller.dart';
import 'package:car_rent/PrefrenceManager/prefrence_manager.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

class CarAddScreen extends StatefulWidget {
  const CarAddScreen({Key? key}) : super(key: key);

  @override
  State<CarAddScreen> createState() => _CarAddScreenState();
}

class _CarAddScreenState extends State<CarAddScreen> {
  TextEditingController carBrand = TextEditingController();
  TextEditingController carName = TextEditingController();
  TextEditingController carPrice = TextEditingController();
  TextEditingController carSeat = TextEditingController();
  TextEditingController carColor = TextEditingController();
  TextEditingController carDriver = TextEditingController();
  TextEditingController carDriverNumber = TextEditingController();
  DriverController driverController = Get.put(DriverController());
  DropController dropController = Get.put(DropController());
  UserdataController userdataController = Get.put(UserdataController());
  final RoundedLoadingButtonController _btnController =
      RoundedLoadingButtonController();
  double val = 0;
  firebase_storage.Reference? ref;
  List carImage = [];

  List carType = [
    'Sedan',
    'SUV',
    'Coupe',
    'Convertibles',
    'Hatchback',
    'MPV',
    'Luxury'
  ];
  List carFuel = ['CNG', 'Petrol', 'Diesel', 'Electric'];
  List type = ['with Driver', 'without Driver'];
  List transmission = ['Automatic', 'Manual'];
  IndicatorController indicatorController = Get.put(IndicatorController());
  TransmissionController transmissionController =
      Get.put(TransmissionController());
  FuelController fuelController = Get.put(FuelController());

  List<File> _image = [];
  final picker = ImagePicker();
  bool uploading = false;

  final _formKey = GlobalKey<FormState>();

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
              margin: EdgeInsets.all(5),
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
                  padding: EdgeInsets.symmetric(horizontal: 25),
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          Get.back();
                        },
                        icon: Icon(
                          Icons.arrow_back_ios,
                          color: AppColors.white,
                        ),
                      ),
                      CommonText(
                        text: 'Add Car Details',
                        size: 16,
                        color: AppColors.white,
                        weight: FontWeight.w700,
                      ),
                      Spacer(),
                      InkWell(
                        onTap: () {
                          chooseImage();
                        },
                        child: CommonText(
                          text: 'Add Image',
                          color: AppColors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            preferredSize: Size(width, 100)),
        body: BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: 2,
            sigmaY: 2,
          ),
          child: Container(
            margin: EdgeInsets.all(5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white12,
            ),
            child: Form(
              key: _formKey,
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  children: [
                    SizedBox(height: 20),
                    SingleChildScrollView(
                      physics: BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          SizedBox(
                            height: 200,
                            width: Get.width,
                            child: PageView.builder(
                              onPageChanged: (val) {
                                indicatorController.selectedIndicator(val);
                              },
                              itemCount: _image.length,
                              itemBuilder: (context, index) {
                                return Container(
                                  height: 200,
                                  width: Get.width - 60,
                                  margin: EdgeInsets.symmetric(horizontal: 10),
                                  decoration: BoxDecoration(
                                    color: AppColors.grey.withAlpha(100),
                                    borderRadius: BorderRadius.circular(12),
                                    image: DecorationImage(
                                      image: FileImage(_image[index]),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                );
                              },
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ...List.generate(
                          _image.length,
                          (index) => Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(right: 2),
                                child: Obx(
                                  () => CircleAvatar(
                                    backgroundColor: indicatorController
                                                .indicator.value ==
                                            index
                                        ? AppColors.mainColor
                                        : AppColors.mainColor.withAlpha(100),
                                    radius: 4,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 20),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 25),
                      child: Column(
                        children: [
                          CommonTextField(
                            controller: carBrand,
                            hintText: 'Car Brand',
                            textInputAction: TextInputAction.next,
                            obScureText: false,
                            validator: (val) {
                              if (val.isEmpty) {
                                return 'Enter Brand Name';
                              }
                            },
                          ),
                          SizedBox(height: 10),
                          CommonTextField(
                            controller: carName,
                            hintText: 'Car Name',
                            textInputAction: TextInputAction.next,
                            obScureText: false,
                            validator: (val) {
                              if (val.isEmpty) {
                                return 'Enter Car Name';
                              }
                            },
                          ),
                          SizedBox(height: 10),
                          CommonTextField(
                            controller: carColor,
                            hintText: 'Car Color',
                            keyboardType: TextInputType.emailAddress,
                            textInputAction: TextInputAction.next,
                            obScureText: false,
                            validator: (val) {
                              if (val.isEmpty) {
                                return 'Enter Color';
                              }
                            },
                          ),
                          SizedBox(height: 10),
                          CommonTextField(
                            controller: carSeat,
                            hintText: 'Car Seat',
                            keyboardType: TextInputType.number,
                            textInputAction: TextInputAction.next,
                            obScureText: false,
                            validator: (val) {
                              if (val.isEmpty) {
                                return 'Enter Seat count';
                              }
                            },
                          ),
                          SizedBox(height: 10),
                          CommonTextField(
                            controller: carPrice,
                            hintText: 'Car Price',
                            keyboardType: TextInputType.number,
                            textInputAction: TextInputAction.next,
                            obScureText: false,
                            validator: (val) {
                              if (val.isEmpty) {
                                return 'Enter Price';
                              }
                            },
                          ),
                          SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              ...List.generate(
                                2,
                                (index) => GestureDetector(
                                  onTap: () {
                                    driverController.withDriver(index);
                                  },
                                  child: Padding(
                                    padding: EdgeInsets.only(bottom: 11),
                                    child: Row(
                                      children: [
                                        Obx(
                                          () => Container(
                                            padding: EdgeInsets.all(3),
                                            height: 20,
                                            width: 20,
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              border: Border.all(
                                                color: Colors.white54,
                                              ),
                                            ),
                                            child: CircleAvatar(
                                              backgroundColor: driverController
                                                          .driver.value ==
                                                      index
                                                  ? Colors.white54
                                                  : AppColors.trans,
                                            ),
                                          ),
                                        ),
                                        SizedBox(width: 15),
                                        CommonText(
                                          text: type[index],
                                          size: 16,
                                          color: AppColors.white,
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 5),
                          Obx(
                            () => driverController.driver.value == 0
                                ? CommonTextField(
                                    controller: carDriver,
                                    hintText: 'Car Driver',
                                    keyboardType: TextInputType.emailAddress,
                                    textInputAction: TextInputAction.next,
                                    obScureText: false,
                                    validator: (val) {
                                      if (val.isEmpty) {
                                        return 'Enter Driver Name';
                                      }
                                    },
                                  )
                                : SizedBox(),
                          ),
                          SizedBox(height: 10),
                          Obx(
                            () => driverController.driver.value == 0
                                ? CommonTextField(
                                    controller: carDriverNumber,
                                    hintText: 'Car Driver',
                                    keyboardType: TextInputType.number,
                                    textInputAction: TextInputAction.next,
                                    obScureText: false,
                                    validator: (val) {
                                      if (val.isEmpty) {
                                        return 'Enter Driver Number';
                                      }
                                    },
                                  )
                                : SizedBox(),
                          ),
                          SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              ...List.generate(
                                2,
                                (index) => GestureDetector(
                                  onTap: () {
                                    transmissionController.withWhat(index);
                                  },
                                  child: Padding(
                                    padding: EdgeInsets.only(bottom: 11),
                                    child: Row(
                                      children: [
                                        Obx(
                                          () => Container(
                                            padding: EdgeInsets.all(3),
                                            height: 20,
                                            width: 20,
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              border: Border.all(
                                                color: Colors.white54,
                                              ),
                                            ),
                                            child: CircleAvatar(
                                              backgroundColor:
                                                  transmissionController
                                                              .type.value ==
                                                          index
                                                      ? Colors.white54
                                                      : AppColors.trans,
                                            ),
                                          ),
                                        ),
                                        SizedBox(width: 15),
                                        CommonText(
                                          text: transmission[index],
                                          size: 16,
                                          color: AppColors.white,
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 20),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 15),
                            height: 50,
                            width: Get.width,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: Colors.white54,
                            ),
                            child: Obx(
                              () => DropdownButtonHideUnderline(
                                child: DropdownButton(
                                  onChanged: (val) {
                                    dropController.selectItem(val);
                                  },
                                  value: dropController.selectCatType.value,
                                  items: carType.map((e) {
                                    return DropdownMenuItem(
                                      value: e,
                                      child: Text(e),
                                    );
                                  }).toList(),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 20),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 15),
                            height: 50,
                            width: Get.width,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: Colors.white54,
                            ),
                            child: Obx(
                              () => DropdownButtonHideUnderline(
                                child: DropdownButton(
                                  onChanged: (val) {
                                    fuelController.selectedFuel(val);
                                  },
                                  value: fuelController.selectFuel.value,
                                  items: carFuel.map((e) {
                                    return DropdownMenuItem(
                                      value: e,
                                      child: Text(e),
                                    );
                                  }).toList(),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 30),
                          SizedBox(
                            height: 50,
                            width: 200,
                            child: RoundedLoadingButton(
                              color: Colors.black,
                              borderRadius: 100,
                              child: Text(
                                'Add',
                                style: TextStyle(color: Colors.white),
                              ),
                              controller: _btnController,
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  _btnController.start();
                                  addCarData(_btnController);
                                } else {
                                  _btnController.reset();
                                }
                              },
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  chooseImage() async {
    final pickedFile = await picker.pickMultiImage();

    pickedFile.forEach((element) {
      setState(() {
        _image.add(File(element.path));
      });
    });

    if (pickedFile == []) retrieveLostData();
  }

  Future<void> retrieveLostData() async {
    final LostData response = await picker.getLostData();
    if (response.isEmpty) {
      return;
    }
    if (response.file != null) {
      setState(() {
        _image.add(File(response.file!.path));
      });
    } else {
      print(response.file);
    }
  }

  Future uploadList(RoundedLoadingButtonController controller) async {
    int i = 1;
    String name = '${Random().nextInt(100000)}';

    try {
      for (var img in _image) {
        ref = firebase_storage.FirebaseStorage.instance
            .ref('images/$name${i.toString()}');
        await ref?.putFile(img).whenComplete(() async {
          await ref?.getDownloadURL().then((value) {
            carImage.add(value);
            i++;
            print('CARIMAGE$carImage');
          });
        });
      }
    } on firebase_storage.FirebaseException catch (e) {
      controller.reset();
    }
  }

  void addCarData(RoundedLoadingButtonController controller) async {
    try {
      await uploadList(controller).then(
        (value) => FirebaseFirestore.instance.collection('cars').add(
          {
            'sellerName': SellerPrefrenceManager.getName(),
            "CarImage": FieldValue.arrayUnion(carImage),
            "Time": DateTime.now(),
            'Available': true,
            "CarSellerId": firebaseAuth.currentUser!.uid,
            "CarName": carName.text.trim(),
            "CarBrand": carBrand.text.trim(),
            "CarColor": carColor.text.trim(),
            "CarSeat": carSeat.text.trim(),
            "CarPrice": carPrice.text.trim(),
            "CarType": dropController.selectCatType.value,
            "CarFuelType": fuelController.selectFuel.value,
            "CarTransmission":
                transmissionController.type.value == 0 ? "Automatic" : "Manual",
            "CarRentType": driverController.driver.value == 0
                ? "withDriver"
                : "withoutDriver",
            "CarDriverName":
                driverController.driver.value == 0 ? carDriver.text.trim() : "",
            "CarDriverNumber": driverController.driver.value == 0
                ? carDriverNumber.text.trim()
                : "",
            'isFavourite': [],
            "CarReview": "0",
            "CarRating": "0",
          },
        ).catchError(
          (e) {
            controller.reset();
          },
        ).then((value) {
          Get.back();
          controller.reset();

          userdataController.sendMessage(
              message:
                  '${SellerPrefrenceManager.getName()} added new ${carBrand.text.trim()} ${carName.text.trim()}');
        }),
      );
    } catch (e) {
      controller.reset();
    }
  }
}
