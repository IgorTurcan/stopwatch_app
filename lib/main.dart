import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stopwatch_app/controllers/timer_controller.dart';

import 'pages/main_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(TimerController());

    return const GetMaterialApp(
      title: 'Flutter Demo',
      home: MainPage(),
    );
  }
}
