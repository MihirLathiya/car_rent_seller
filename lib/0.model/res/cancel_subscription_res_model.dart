// // To parse this JSON data, do
// //
// //     final cancelSubscriptionResponseModel = cancelSubscriptionResponseModelFromJson(jsonString);
//
// import 'dart:convert';
//
// CancelSubscriptionResponseModel cancelSubscriptionResponseModelFromJson(String str) => CancelSubscriptionResponseModel.fromJson(json.decode(str));
//
// String cancelSubscriptionResponseModelToJson(CancelSubscriptionResponseModel data) => json.encode(data.toJson());
//
// class CancelSubscriptionResponseModel {
//   CancelSubscriptionResponseModel({
//     this.status,
//     this.message,
//   });
//
//   bool status;
//   String message;
//
//   factory CancelSubscriptionResponseModel.fromJson(Map<String, dynamic> json) => CancelSubscriptionResponseModel(
//     status: json["status"],
//     message: json["message"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "status": status,
//     "message": message,
//   };
// }
