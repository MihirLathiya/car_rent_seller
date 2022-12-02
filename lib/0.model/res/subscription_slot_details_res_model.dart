// // To parse this JSON data, do
// //
// //     final subscriptionSlotDetailsResponseModel = subscriptionSlotDetailsResponseModelFromJson(jsonString);
//
// import 'dart:convert';
//
// SubscriptionSlotDetailsResponseModel subscriptionSlotDetailsResponseModelFromJson(String str) => SubscriptionSlotDetailsResponseModel.fromJson(json.decode(str));
//
// String subscriptionSlotDetailsResponseModelToJson(SubscriptionSlotDetailsResponseModel data) => json.encode(data.toJson());
//
// class SubscriptionSlotDetailsResponseModel {
//   SubscriptionSlotDetailsResponseModel({
//     this.status,
//     this.message,
//     this.data,
//   });
//
//   bool status;
//   String message;
//   List<Datum> data;
//
//   factory SubscriptionSlotDetailsResponseModel.fromJson(Map<String, dynamic> json) => SubscriptionSlotDetailsResponseModel(
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
//     this.createdAt,
//     this.updatedAt,
//     this.accountNumber,
//     this.placeId,
//     this.slotQuantity,
//     this.strtDate,
//     this.endDate,
//     this.subscriptionAmount,
//     this.parkingNumber,
//     this.paymentStatus,
//     this.autoRenewal,
//     this.active,
//     this.subscriptionId,
//     this.parkingType,
//     this.parkingName,
//     this.accessControl,
//     this.stratDate,
//     this.vehicleType,
//   });
//
//   int id;
//   dynamic createdAt;
//   dynamic updatedAt;
//   int accountNumber;
//   int placeId;
//   String slotQuantity;
//   dynamic strtDate;
//   dynamic endDate;
//   String subscriptionAmount;
//   dynamic parkingNumber;
//   int paymentStatus;
//   int autoRenewal;
//   int active;
//   int subscriptionId;
//   String parkingType;
//   dynamic parkingName;
//   String accessControl;
//   dynamic stratDate;
//   String vehicleType;
//
//   factory Datum.fromJson(Map<String, dynamic> json) => Datum(
//     id: json["id"],
//     createdAt: json["created_at"],
//     updatedAt: json["updated_at"],
//     accountNumber: json["account_number"],
//     placeId: json["place_id"],
//     slotQuantity: json["slot_quantity"],
//     strtDate: json["strt_date"],
//     endDate: json["end_date"],
//     subscriptionAmount: json["subscription_amount"],
//     parkingNumber: json["parking_number"],
//     paymentStatus: json["payment_status"],
//     autoRenewal: json["auto_renewal"],
//     active: json["active"],
//     subscriptionId: json["subscription_id"],
//     parkingType: json["parking_type"] == null ? null : json["parking_type"],
//     parkingName: json["parking_name"],
//     accessControl: json["access_control"] == null ? null : json["access_control"],
//     stratDate: json["strat_date"],
//     vehicleType: json["vehicle_type"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "id": id,
//     "created_at": createdAt,
//     "updated_at": updatedAt,
//     "account_number": accountNumber,
//     "place_id": placeId,
//     "slot_quantity": slotQuantity,
//     "strt_date": strtDate,
//     "end_date": endDate,
//     "subscription_amount": subscriptionAmount,
//     "parking_number": parkingNumber,
//     "payment_status": paymentStatus,
//     "auto_renewal": autoRenewal,
//     "active": active,
//     "subscription_id": subscriptionId,
//     "parking_type": parkingType == null ? null : parkingType,
//     "parking_name": parkingName,
//     "access_control": accessControl == null ? null : accessControl,
//     "strat_date": stratDate,
//     "vehicle_type": vehicleType,
//   };
// }
