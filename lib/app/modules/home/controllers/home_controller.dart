import 'package:get/get.dart';

class HomeController extends GetxController {
  final selectedRoom = 0.obs;
  final selectedPage = 0.obs;
  final rooms = ['All Room', 'Living Room', 'Bedroom', 'Bathroom'];

  final cards = [
    {
      'image': 'assets/images/living.png',
      'title': 'Living Room',
      'id': 1000001,
      'state': true
    },
    {
      'image': 'assets/images/bathroom.png',
      'title': 'Bathroom',
      'id': 1000002,
      'state': false
    },
    {
      'image': 'assets/images/dining.png',
      'title': 'Dining Room',
      'id': 1000003,
      'state': false
    },
    {
      'image': 'assets/images/bedroom.png',
      'title': 'Bedroom',
      'id': 1000004,
      'state': false
    },
  ];
}
