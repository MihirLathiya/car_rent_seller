// class EditSlotDetailViewModel extends GetxController {
//   ApiResponse _editSlotDetailApiResponse =
//       ApiResponse.initial(message: 'Initialization');
//
//   ApiResponse get editSlotDetailApiResponse => _editSlotDetailApiResponse;
//
//   Future<void> editSlotDetailViewModel({Map<String, dynamic>? model}) async {
//     _editSlotDetailApiResponse = ApiResponse.loading(message: 'Loading');
//     update();
//     try {
//       EditSlotDetailsResponseModel response =
//           await EditSlotDetailRepo().editSlotDetailRepo(body: model);
//       print("GetParkingPlaceResponseModel=response==>$response");
//
//       _editSlotDetailApiResponse = ApiResponse.complete(response);
//     } catch (e) {
//       print("GetParkingPlaceResponseModel=e==>$e");
//       _editSlotDetailApiResponse = ApiResponse.error(message: 'error');
//     }
//     update();
//   }
// }
