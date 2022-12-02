// // To parse this JSON data, do
// //
// //     final getSubscriptionPlanResponseModel = getSubscriptionPlanResponseModelFromJson(jsonString);
//
// import 'dart:convert';
//
// List<GetSubscriptionPlanResponseModel> getSubscriptionPlanResponseModelFromJson(String str) => List<GetSubscriptionPlanResponseModel>.from(json.decode(str).map((x) => GetSubscriptionPlanResponseModel.fromJson(x)));
//
// String getSubscriptionPlanResponseModelToJson(List<GetSubscriptionPlanResponseModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));
//
// class GetSubscriptionPlanResponseModel {
//   GetSubscriptionPlanResponseModel({
//     this.id,
//     this.placeId,
//     this.prize,
//     this.planType,
//     this.planTime,
//     this.parkingServices,
//     this.createdAt,
//     this.updatedAt,
//   });
//
//   int id;
//   int placeId;
//   String prize;
//   String planType;
//   String planTime;
//   String parkingServices;
//   dynamic createdAt;
//   dynamic updatedAt;
//
//   factory GetSubscriptionPlanResponseModel.fromJson(Map<String, dynamic> json) => GetSubscriptionPlanResponseModel(
//     id: json["id"],
//     placeId: json["place_id"],
//     prize: json["prize"],
//     planType: json["plan_type"],
//     planTime: json["plan_time"],
//     parkingServices: json["parking_services"],
//     createdAt: json["created_at"],
//     updatedAt: json["updated_at"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "id": id,
//     "place_id": placeId,
//     "prize": prize,
//     "plan_type": planType,
//     "plan_time": planTime,
//     "parking_services": parkingServices,
//     "created_at": createdAt,
//     "updated_at": updatedAt,
//   };
// }
