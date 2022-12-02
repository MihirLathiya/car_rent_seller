// class GetSubscriptionPlanViewModel extends GetxController {
//   ApiResponse _getSubscriptionPlanApiResponse =
//       ApiResponse.initial(message: 'Initialization');
//
//   ApiResponse get getSubscriptionPlanApiResponse => _getSubscriptionPlanApiResponse;
//
//   Future<void> getSubscriptionPlanViewModel({Map<String, dynamic>? model}) async {
//     _getSubscriptionPlanApiResponse = ApiResponse.loading(message: 'Loading');
//     update();
//     try {
//       GetSubscriptionPlanResponseModel response =
//           await GetSubscriptionPlanRepo().getSubscriptionPlanRepo(body: model);
//       print("GetSubscriptionPlanResponseModel=response==>$response");
//
//       _getSubscriptionPlanApiResponse = ApiResponse.complete(response);
//     } catch (e) {
//       print("GetSubscriptionPlanResponseModel=e==>$e");
//       _getSubscriptionPlanApiResponse = ApiResponse.error(message: 'error');
//     }
//     update();
//   }
// }
