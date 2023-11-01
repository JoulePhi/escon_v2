import 'package:escon_v2/app/modules/home/views/add_room.dart';
import 'package:escon_v2/shared/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

class HomeController extends GetxController {
  final selectedRoom = 0.obs;
  final selectedPage = 0.obs;
  final rooms = ['All Rooms', 'Living Room', 'Bedroom', 'Bathroom'];
  final selectedDate = DateTime.now().obs;
  List cards = [];
  final box = Hive.box('rooms_box');
  @override
  void onInit() async {
    super.onInit();
    List allRooms = await box.get('rooms', defaultValue: []);
    cards = allRooms;
    update();
  }

  changeDate() {
    showDatePicker(
      context: Get.context!,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime.now(),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
                primary: donker, // <-- SEE HERE
                onPrimary: Colors.white, // <-- SEE HERE
                onSurface: donker // <-- SEE HERE
                ),
          ),
          child: child!,
        );
      },
    ).then((value) => value != null ? selectedDate.value = value : null);
  }

  void showSlideUpDialog(BuildContext context) {
    Get.dialog(const AddRoom());
  }

  void clearRooms() async {
    await box.delete('rooms');
    cards.clear();
    update();
  }
}
