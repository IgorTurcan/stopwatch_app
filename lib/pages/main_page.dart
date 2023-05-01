import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stopwatch_app/controllers/timer_controller.dart';

class MainPage extends GetView<TimerController> {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    controller.start();

    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(
              () => Text(controller.timeFormatted.value),
            ),
          ],
        ),
      ),
    );
  }
}
