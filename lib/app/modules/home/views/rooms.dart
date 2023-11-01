import 'package:escon_v2/app/modules/home/controllers/home_controller.dart';
import 'package:escon_v2/shared/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RoomCard extends StatelessWidget {
  const RoomCard(
      {super.key,
      required this.title,
      required this.isSelected,
      required this.id});
  final String title;
  final int isSelected;
  final int id;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.find<HomeController>().selectedRoom.value = id;
        if (Get.find<HomeController>().box.get('rooms') != null) {
          if (title != 'All Rooms') {
            Get.find<HomeController>().cards = Get.find<HomeController>()
                .box
                .get('rooms')
                .where((element) =>
                    element['room'] == Get.find<HomeController>().rooms[id])
                .toList();
          } else {
            Get.find<HomeController>().cards =
                Get.find<HomeController>().box.get('rooms');
          }
        }

        Get.find<HomeController>().update();
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 100),
        width: 100,
        child: Column(
          children: [
            Text(
              title,
              style: id == isSelected
                  ? blackText.copyWith(
                      fontSize: 16,
                      fontWeight: bold,
                    )
                  : greyText.copyWith(
                      fontSize: 16,
                      fontWeight: bold,
                    ),
            ),
            spaceV(10),
            AnimatedContainer(
              duration: const Duration(milliseconds: 150),
              height: 3,
              width: id == isSelected ? 90 : 0,
              decoration: BoxDecoration(
                color: id == isSelected ? darkBlue : Colors.transparent,
                borderRadius: BorderRadius.circular(50),
              ),
            )
          ],
        ),
      ),
    );
  }
}
