import 'package:hotel_booking/controller/auth_controller.dart';
import 'package:hotel_booking/data/api/api_client.dart';
import 'package:hotel_booking/utils/app_constants.dart';
import 'package:http/http.dart';

class OrderRepo {
  final ApiClient apiClient;
  OrderRepo({required this.apiClient});

  Future<Response?> getOrders() async {
    return await apiClient.postData(AppConstants.getOrderList, {
      'user_id': AuthController.to.appUser!.id,
    });
  }

  Future<Response?> getOrderDetails(int id) async {
    return await apiClient.postData(AppConstants.getOrderDetails, {
      'order_id': id,
    });
  }
}
