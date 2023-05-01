import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stopwatch_app/controllers/timer_controller.dart';
import 'package:stopwatch_app/pages/timer_button.dart';

import 'lap.dart';

class MainPage extends GetView<TimerController> {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Obx(
          () => Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(flex: 2, child: Container()),
              Text(
                controller.timeFormatted.value,
                style: const TextStyle(fontSize: 30),
              ),
              Flexible(child: Container()),
              Container(
                height: MediaQuery.of(context).size.height * 0.3,
                margin: const EdgeInsets.symmetric(horizontal: 100),
                color: Colors.grey.shade100,
                child: Scrollbar(
                  child: ListView.separated(
                    shrinkWrap: true,
                    reverse: true,
                    itemCount: controller.laps.length,
                    separatorBuilder: (_, __) => Container(
                      height: 1,
                      color: Colors.grey.shade400,
                    ),
                    itemBuilder: (_, index) => Lap(number: index, text: controller.laps[index]),
                  ),
                ),
              ),
              Flexible(child: Container()),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  if (controller.isCounting.value) ...[
                    TimerButton(text: 'Stop', onPressed: controller.stop),
                  ] else ...[
                    TimerButton(text: 'Start', onPressed: controller.start),
                  ],
                  if (controller.isCounting.value) ...[
                    TimerButton(text: 'Lap', onPressed: controller.lap),
                  ] else ...[
                    TimerButton(text: 'Reset', onPressed: controller.reset),
                  ],
                ],
              ),
              Flexible(child: Container()),
            ],
          ),
        ),
      ),
    );
  }
}
