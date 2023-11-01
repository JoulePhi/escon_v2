import 'package:escon_v2/app/modules/home/views/add_room.dart';
import 'package:escon_v2/app/modules/home/views/baritem.dart';
import 'package:escon_v2/app/modules/home/views/rooms.dart';
import 'package:escon_v2/shared/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: bg,
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Row(
                children: [
                  const CircleAvatar(
                    radius: 25,
                    backgroundColor: darkBlue,
                    backgroundImage: NetworkImage(
                        'https://a.espncdn.com/combiner/i?img=/i/headshots/soccer/players/full/45843.png&w=350&h=254'),
                  ),
                  spaceH(10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Welcome Home,',
                        style: greyText.copyWith(
                          fontSize: 14,
                          fontWeight: medium,
                        ),
                      ),
                      Text(
                        'John Doe',
                        style: blackText.copyWith(
                          fontSize: 18,
                          fontWeight: bold,
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: () {
                      controller.clearRooms();
                    },
                    child: Image.asset(
                      'assets/images/bell.png',
                      width: 26,
                    ),
                  ),
                  spaceH(24),
                  GestureDetector(
                    onTap: () {
                      controller.showSlideUpDialog(context);
                    },
                    child: Image.asset(
                      'assets/images/add.png',
                      width: 26,
                    ),
                  ),
                ],
              ),
              Container(
                margin: const EdgeInsets.only(top: 24, bottom: 32),
                padding: const EdgeInsets.all(14),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          'Energy Usage',
                          style: blackText.copyWith(
                            fontSize: 16,
                            fontWeight: medium,
                          ),
                        ),
                        const Spacer(),
                        GestureDetector(
                          onTap: () {
                            controller.changeDate();
                          },
                          child: Row(
                            children: [
                              Image.asset(
                                'assets/images/date.png',
                                width: 18,
                              ),
                              spaceH(6),
                              Obx(
                                () => Text(
                                  DateFormat('dd MMM, y')
                                      .format(controller.selectedDate.value)
                                      .toString(),
                                  style: blackText.copyWith(
                                    fontSize: 14,
                                    fontWeight: medium,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        spaceH(8),
                        const Icon(
                          Icons.keyboard_arrow_down_rounded,
                          size: 16,
                        )
                      ],
                    ),
                    spaceV(32),
                    Row(
                      children: [
                        Flexible(
                          flex: 1,
                          child: Container(
                            color: Colors.white,
                            child: Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    'assets/images/cable.png',
                                    width: 24,
                                  ),
                                  spaceH(10),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Today',
                                        style: greyText.copyWith(
                                          fontSize: 14,
                                          fontWeight: medium,
                                        ),
                                      ),
                                      Text(
                                        '28.6 kMh',
                                        style: blackText.copyWith(
                                          fontSize: 18,
                                          fontWeight: bold,
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        Flexible(
                          flex: 1,
                          child: Container(
                            color: Colors.white,
                            child: Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    'assets/images/energy.png',
                                    width: 24,
                                  ),
                                  spaceH(10),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'This Month',
                                        style: greyText.copyWith(
                                          fontSize: 14,
                                          fontWeight: medium,
                                        ),
                                      ),
                                      Text(
                                        '345 kWh',
                                        style: blackText.copyWith(
                                          fontSize: 18,
                                          fontWeight: bold,
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
              Obx(
                () => SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  child: Row(
                    children: controller.rooms
                        .map((e) => RoomCard(
                              title: e,
                              id: controller.rooms.indexOf(e),
                              isSelected: controller.selectedRoom.value,
                            ))
                        .toList(),
                  ),
                ),
              ),
              spaceV(40),
              GetBuilder(
                init: HomeController(),
                builder: (c) => c.cards.isEmpty
                    ? Expanded(
                        child: Center(
                          child: Text(
                            'Your room still empty',
                            style: greyText.copyWith(
                              fontSize: 20,
                              fontWeight: bold,
                            ),
                          ),
                        ),
                      )
                    : Expanded(
                        child: GridView.builder(
                            physics: const BouncingScrollPhysics(),
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisSpacing: 15,
                              crossAxisSpacing: 15,
                            ),
                            itemCount: c.cards.length,
                            itemBuilder: (context, index) {
                              return AnimatedContainer(
                                duration: const Duration(milliseconds: 200),
                                padding: const EdgeInsets.all(15),
                                decoration: BoxDecoration(
                                  color: c.cards[index]['state'] == true
                                      ? donker
                                      : Colors.white,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: 32,
                                      height: 32,
                                      padding: const EdgeInsets.all(5),
                                      decoration: BoxDecoration(
                                        color: c.cards[index]['state'] == true
                                            ? darkCyan
                                            : lightCyan,
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      child: Image.asset(
                                        'assets/images/${c.cards[index]['icon']}',
                                        color: c.cards[index]['state'] == true
                                            ? Colors.white
                                            : donker,
                                      ),
                                    ),
                                    spaceV(10),
                                    Text(
                                      c.cards[index]['name'].toString(),
                                      style: c.cards[index]['state'] == true
                                          ? whiteText.copyWith(
                                              fontSize: 18,
                                              fontWeight: bold,
                                            )
                                          : donkerText.copyWith(
                                              fontSize: 18,
                                              fontWeight: bold,
                                            ),
                                    ),
                                    spaceV(5),
                                    Text(
                                      c.cards[index]['id'].toString(),
                                      style: c.cards[index]['state'] == true
                                          ? cyanText.copyWith(
                                              fontSize: 14,
                                              fontWeight: medium,
                                            )
                                          : greyText.copyWith(
                                              fontSize: 14,
                                              fontWeight: medium,
                                            ),
                                    ),
                                    const Spacer(),
                                    CupertinoSwitch(
                                      value: c.cards[index]['state'] == true
                                          ? true
                                          : false,
                                      onChanged: (a) {
                                        c.cards[index]['state'] = a;
                                        c.update();
                                      },
                                      activeColor: green,
                                      thumbColor: Colors.white,
                                      trackColor: donker,
                                    ),
                                  ],
                                ),
                              );
                            }),
                      ),
              )
            ],
          ),
        ),
        bottomNavigationBar: Container(
            color: Colors.white,
            height: 90,
            child: Obx(
              () => Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    BarItem(
                      image: 'assets/images/home.png',
                      id: 0,
                      isSelected: controller.selectedPage.value,
                      title: 'Home',
                    ),
                    BarItem(
                      image: 'assets/images/sun.png',
                      id: 1,
                      isSelected: controller.selectedPage.value,
                      title: 'Smart',
                    ),
                    BarItem(
                      image: 'assets/images/profile.png',
                      id: 2,
                      isSelected: controller.selectedPage.value,
                      title: 'Profile',
                    ),
                  ],
                ),
              ),
            )),
      ),
    );
  }
}
