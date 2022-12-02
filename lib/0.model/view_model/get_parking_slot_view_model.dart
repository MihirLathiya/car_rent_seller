// class GetParkingSlotViewModel extends GetxController {
//   ApiResponse _getParkingSlotApiResponse =
//       ApiResponse.initial(message: 'Initialization');
//
//   ApiResponse get getParkingSlotApiResponse => _getParkingSlotApiResponse;
//
//   Future<void> getParkingSlotViewModel({Map<String, dynamic>? model}) async {
//     _getParkingSlotApiResponse = ApiResponse.loading(message: 'Loading');
//     update();
//     try {
//       getParkingSlotResponseModel response =
//           await GetParkingSlotRepo().getParkingSlotRepo(body: model);
//       print("getParkingSlotResponseModel=response==>$response");
//
//       _getParkingSlotApiResponse = ApiResponse.complete(response);
//     } catch (e) {
//       print("getParkingSlotResponseModel=e==>$e");
//       _getParkingSlotApiResponse = ApiResponse.error(message: 'error');
//     }
//     update();
//   }
// }
