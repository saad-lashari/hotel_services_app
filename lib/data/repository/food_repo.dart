import 'package:hotel_booking/data/api/api_client.dart';
import 'package:hotel_booking/utils/app_constants.dart';
import 'package:http/http.dart';

class FoodRepo {
  final ApiClient apiClient;
  FoodRepo({required this.apiClient});

  Future<Response?> getFoodList() async {
    return await apiClient.getData(AppConstants.getFoodListURL);
  }
}
