// class SubscriptionDetailsViewModel extends GetxController {
//   ApiResponse _subscriptionDetailApiResponse =
//       ApiResponse.initial(message: 'Initialization');
//
//   ApiResponse get subscriptionDetailApiResponse => _subscriptionDetailApiResponse;
//
//   Future<void> subscriptionDetailsViewModel({Map<String, dynamic>? model}) async {
//     _subscriptionDetailApiResponse = ApiResponse.loading(message: 'Loading');
//     update();
//     try {
//       SubscriptionDetailsResponseModel response =
//           await SubscriptionDetailsRepo().subscriptionDetailsRepo(body: model);
//       print("SubscriptionDetailsResponseModel=response==>$response");
//
//       _subscriptionDetailApiResponse = ApiResponse.complete(response);
//     } catch (e) {
//       print("SubscriptionDetailsResponseModel=e==>$e");
//       _subscriptionDetailApiResponse = ApiResponse.error(message: 'error');
//     }
//     update();
//   }
// }
