// ignore_for_file: prefer_final_fields

import 'dart:convert';
import 'dart:developer';
import 'package:get/get.dart';
import 'package:hotel_booking/common/snackbar.dart';
import 'package:hotel_booking/data/model/response/room.dart';
import 'package:hotel_booking/data/repository/room_repo.dart';

class RoomsController extends GetxController implements GetxService {
  final RoomRepo roomRepo;
  RoomsController({required this.roomRepo});

  List<Room> _roomList = [];
  bool _isLoading = false;

  bool get isLoading => _isLoading;
  List<Room> get roomList => _roomList;

  Future<void> init({bool reload = false}) async {
    if (_roomList.isEmpty || reload) {
      _isLoading = true;
      update();
      await getRoomList();
      _isLoading = false;
      update();
    }
  }

  getRoomList() async {
    var response = await roomRepo.getRoomList();
    if (response != null) {
      _roomList = (jsonDecode(response.body) as List)
          .map((e) => Room.fromJson(e))
          .toList();
    } else {
      errorMessage();
    }
    update();
  }

  static RoomsController get to => Get.find();
}
