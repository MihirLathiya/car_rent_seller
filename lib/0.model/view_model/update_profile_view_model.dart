//
//
// class UpdateProfileViewModel extends GetxController {
//   ApiResponse _updateProfileApiResponse =
//   ApiResponse.initial(message: 'Initialization');
//
//   ApiResponse get updateProfileApiResponse => _updateProfileApiResponse;
//
//   Future<void> sendGiftViewModel({Map<String, dynamic>? model}) async {
//     _updateProfileApiResponse = ApiResponse.loading(message: 'Loading');
//     update();
//     try {
//       UpdateProfileResponseModel response =
//       await UpdateProfileRepo().updateProfileRepo(body: model);
//       print("UpdateProfileResponseModel=response==>$response");
//
//       _updateProfileApiResponse = ApiResponse.complete(response);
//     } catch (e) {
//       print("UpdateProfileResponseModel=e==>$e");
//       _updateProfileApiResponse = ApiResponse.error(message: 'error');
//     }
//     update();
//   }
// }
