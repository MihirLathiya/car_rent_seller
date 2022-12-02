// class GetParkingPlaceViewModel extends GetxController {
//   ApiResponse _getParkingPlaceApiResponse =
//       ApiResponse.initial(message: 'Initialization');
//
//   ApiResponse get getParkingPlaceApiResponse => _getParkingPlaceApiResponse;
//
//   Future<void> getParkingPlaceViewModel({Map<String, dynamic>? model}) async {
//     _getParkingPlaceApiResponse = ApiResponse.loading(message: 'Loading');
//     update();
//     try {
//       GetParkingPlaceResponseModel response =
//           await GetParkingPlaceRepo().getParkingPlaceRepo(body: model);
//       print("GetParkingPlaceResponseModel=response==>$response");
//
//       _getParkingPlaceApiResponse = ApiResponse.complete(response);
//     } catch (e) {
//       print("GetParkingPlaceResponseModel=e==>$e");
//       _getParkingPlaceApiResponse = ApiResponse.error(message: 'error');
//     }
//     update();
//   }
// }
