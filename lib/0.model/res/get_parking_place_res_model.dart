// // To parse this JSON data, do
// //
// //     final getParkingPlaceResponseModel = getParkingPlaceResponseModelFromJson(jsonString);
//
// import 'dart:convert';
//
// GetParkingPlaceResponseModel getParkingPlaceResponseModelFromJson(String str) => GetParkingPlaceResponseModel.fromJson(json.decode(str));
//
// String getParkingPlaceResponseModelToJson(GetParkingPlaceResponseModel data) => json.encode(data.toJson());
//
// class GetParkingPlaceResponseModel {
//   GetParkingPlaceResponseModel({
//     this.status,
//     this.message,
//     this.data,
//   });
//
//   bool status;
//   String message;
//   List<Datum> data;
//
//   factory GetParkingPlaceResponseModel.fromJson(Map<String, dynamic> json) => GetParkingPlaceResponseModel(
//     status: json["status"],
//     message: json["message"],
//     data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
//   );
//
//   Map<String, dynamic> toJson() => {
//     "status": status,
//     "message": message,
//     "data": List<dynamic>.from(data.map((x) => x.toJson())),
//   };
// }
//
// class Datum {
//   Datum({
//     this.id,
//     this.name,
//     this.baseAmount,
//   });
//
//   int id;
//   String name;
//   String baseAmount;
//
//   factory Datum.fromJson(Map<String, dynamic> json) => Datum(
//     id: json["id"],
//     name: json["name"],
//     baseAmount: json["base_amount"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "id": id,
//     "name": name,
//     "base_amount": baseAmount,
//   };
// }
