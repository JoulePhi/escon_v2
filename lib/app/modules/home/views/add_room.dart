import 'package:escon_v2/app/modules/home/controllers/add_room_controller.dart';
import 'package:escon_v2/shared/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddRoom extends GetWidget<AddRoomController> {
  const AddRoom({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      insetPadding: const EdgeInsets.all(0),
      backgroundColor: Colors.transparent,
      alignment: Alignment.center,
      content: Container(
        width: Get.width - 24,
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 25),
        decoration: BoxDecoration(
          color: bg,
          borderRadius: BorderRadius.circular(20),
        ),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Add Room',
                style: blackText.copyWith(
                  fontSize: 20,
                  fontWeight: bold,
                ),
              ),
              spaceV(20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () {
                      controller.decCounter();
                    },
                    icon: const Icon(
                      Icons.keyboard_arrow_left,
                      size: 20,
                    ),
                  ),
                  spaceH(10),
                  Obx(
                    () => Image.asset(
                      'assets/images/${controller.availableIcons[controller.counter.value]}',
                      width: 24,
                      color: donker,
                    ),
                  ),
                  spaceH(10),
                  IconButton(
                    onPressed: () {
                      controller.addCounter();
                    },
                    icon: const Icon(
                      Icons.keyboard_arrow_right,
                      size: 20,
                    ),
                  )
                ],
              ),
              spaceV(20),
              Container(
                width: double.infinity,
                height: 50,
                padding: const EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: darkBlue, width: 2),
                ),
                child: Row(
                  children: [
                    const Icon(
                      Icons.text_fields,
                      color: darkBlue,
                    ),
                    spaceH(10),
                    Expanded(
                      child: TextField(
                        cursorColor: donker,
                        controller: controller.deviceName,
                        decoration: InputDecoration.collapsed(
                          hintText: "Device Name",
                          hintStyle: blackText.copyWith(
                            fontWeight: medium,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              spaceV(20),
              Container(
                width: double.infinity,
                height: 50,
                padding: const EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: darkBlue, width: 2),
                ),
                child: Row(
                  children: [
                    const Icon(
                      Icons.numbers,
                      color: darkBlue,
                    ),
                    spaceH(10),
                    Expanded(
                      child: TextField(
                        cursorColor: donker,
                        keyboardType: TextInputType.number,
                        controller: controller.deviceId,
                        decoration: InputDecoration.collapsed(
                          hintText: "Device Id",
                          hintStyle: blackText.copyWith(
                            fontWeight: medium,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              spaceV(20),
              Container(
                width: double.infinity,
                height: 50,
                padding: const EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: darkBlue, width: 2),
                ),
                child: Row(
                  children: [
                    const Icon(
                      Icons.house_siding_rounded,
                      color: darkBlue,
                    ),
                    const SizedBox(width: 10),
                    Obx(
                      () => Expanded(
                        child: DropdownButton<String>(
                          iconEnabledColor: donker,
                          isExpanded: true,
                          underline: Container(),
                          items: <String>['Living Room', 'Bedroom', 'Bathroom']
                              .map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(
                                value,
                                style: blackText.copyWith(fontWeight: medium),
                              ),
                            );
                          }).toList(),
                          onChanged: (a) {
                            if (a != null) {
                              controller.selectedRoom.value = a;
                            }
                          },
                          value: controller.selectedRoom.value,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              spaceV(20),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                    onTap: () {
                      controller.addRoom();
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 25,
                        vertical: 10,
                      ),
                      decoration: BoxDecoration(
                        color: donker,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        'Add',
                        style: whiteText.copyWith(
                          fontSize: 14,
                          fontWeight: bold,
                        ),
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
