import 'package:escon_v2/app/modules/home/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

class AddRoomController extends GetxController {
  final selectedIcon = 'living.png'.obs;
  final deviceName = TextEditingController();
  final deviceId = TextEditingController();
  final selectedRoom = 'Living Room'.obs;
  final counter = 0.obs;
  List availableIcons = [
    'living.png',
    'bathroom.png',
    'bedroom.png',
    'dining.png',
  ];

  void addCounter() {
    counter.value++;
    if (counter.value > availableIcons.length - 1) {
      counter.value = 0;
    }
  }

  void decCounter() {
    counter.value--;
    if (counter.value < 0) {
      counter.value = availableIcons.length - 1;
    }
  }

  void addRoom() async {
    final box = Hive.box('rooms_box');
    List allRooms = await box.get('rooms', defaultValue: []);
    allRooms.add({
      'icon': availableIcons[counter.value],
      'name': deviceName.text,
      'id': deviceId.text,
      'room': selectedRoom.value
    });
    await box.put('rooms', allRooms);
    Get.back();
    Get.find<HomeController>().cards = allRooms;
    Get.find<HomeController>().update();
    deviceName.text = "";
    deviceId.text = "";
    selectedIcon.value = 'living.png';
    counter.value = 0;
  }
}
