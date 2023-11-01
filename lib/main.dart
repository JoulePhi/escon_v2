import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'app/routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox('rooms_box');
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Escon",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
}
