import 'package:escon_v2/app/modules/home/controllers/home_controller.dart';
import 'package:escon_v2/shared/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BarItem extends StatelessWidget {
  const BarItem({
    super.key,
    required this.image,
    required this.id,
    required this.isSelected,
    required this.title,
  });
  final String title;
  final String image;
  final int id;
  final int isSelected;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.find<HomeController>().selectedPage.value = id;
      },
      child: Column(
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 150),
            width: id == isSelected ? 30 : 0,
            height: 3,
            color: id == isSelected ? darkBlue : Colors.transparent,
          ),
          spaceV(12),
          Image.asset(
            image,
            width: 24,
            height: 24,
            color: id == isSelected ? darkBlue : Colors.grey,
          ),
          spaceV(5),
          Text(
            title,
            style: id == isSelected
                ? darkBlueText.copyWith(
                    fontSize: 14,
                    fontWeight: bold,
                  )
                : greyText.copyWith(
                    fontSize: 14,
                    fontWeight: bold,
                  ),
          )
        ],
      ),
    );
  }
}
