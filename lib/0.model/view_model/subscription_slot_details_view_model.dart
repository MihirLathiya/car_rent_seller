//
//
// class SubscriptionSlotDetailsViewModel extends GetxController {
//   ApiResponse _subSlotDetailApiResponse =
//   ApiResponse.initial(message: 'Initialization');
//
//   ApiResponse get subSlotDetailApiResponse => _subSlotDetailApiResponse;
//
//   Future<void> subscriptionSlotDetailsViewModel({Map<String, dynamic>? model}) async {
//     _subSlotDetailApiResponse = ApiResponse.loading(message: 'Loading');
//     update();
//     try {
//       subscriptionSlotDetailsResponseModel response =
//       await SubscriptionSlotDetailsRepo().subscriptionSlotDetailsRepo(body: model);
//       print("subscriptionSlotDetailsResponseModel=response==>$response");
//
//       _subSlotDetailApiResponse = ApiResponse.complete(response);
//     } catch (e) {
//       print("subscriptionSlotDetailsResponseModel=e==>$e");
//       _subSlotDetailApiResponse = ApiResponse.error(message: 'error');
//     }
//     update();
//   }
// }
