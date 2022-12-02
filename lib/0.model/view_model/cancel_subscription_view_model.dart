// class CancelSubscriptionViewModel extends GetxController {
//   ApiResponse _cancelSubscriptionApiResponse =
//       ApiResponse.initial(message: 'Initialization');
//
//   ApiResponse get cancelSubscriptionApiResponse => _cancelSubscriptionApiResponse;
//
//   Future<void> cancelSubscriptionViewModel({Map<String, dynamic>? model}) async {
//     _cancelSubscriptionApiResponse = ApiResponse.loading(message: 'Loading');
//     update();
//     try {
//       CancelSubscriptionResponseModel response =
//           await CancelSubscriptionRepo().cancelSubscriptionRepo(body: model);
//       print("GetParkingPlaceResponseModel=response==>$response");
//
//       _cancelSubscriptionApiResponse = ApiResponse.complete(response);
//     } catch (e) {
//       print("GetParkingPlaceResponseModel=e==>$e");
//       _cancelSubscriptionApiResponse = ApiResponse.error(message: 'error');
//     }
//     update();
//   }
// }
