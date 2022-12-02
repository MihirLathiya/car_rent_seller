// // To parse this JSON data, do
// //
// //     final updateProfileResponseModel = updateProfileResponseModelFromJson(jsonString);
//
// import 'dart:convert';
//
// UpdateProfileResponseModel updateProfileResponseModelFromJson(String str) => UpdateProfileResponseModel.fromJson(json.decode(str));
//
// String updateProfileResponseModelToJson(UpdateProfileResponseModel data) => json.encode(data.toJson());
//
// class UpdateProfileResponseModel {
//   UpdateProfileResponseModel({
//     this.status,
//     this.message,
//     this.user,
//   });
//
//   bool status;
//   String message;
//   int user;
//
//   factory UpdateProfileResponseModel.fromJson(Map<String, dynamic> json) => UpdateProfileResponseModel(
//     status: json["status"],
//     message: json["message"],
//     user: json["user"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "status": status,
//     "message": message,
//     "user": user,
//   };
// }
