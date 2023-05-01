import 'dart:async';

import 'package:get/get.dart';

class TimerController extends GetxController {
  Rx<String> timeFormatted = '00:00:00'.obs;
  RxList<String> laps = <String>[].obs;
  RxBool isCounting = false.obs;

  int _timeInMinutes = 0;
  int _timeInSeconds = 0;
  int _timeInMilliseconds = 0;

  Timer? _timer;

  void start() {
    isCounting.value = true;
    _timer = Timer.periodic(
      const Duration(milliseconds: 1),
      (_) {
        _timeInMilliseconds++;
        if (_timeInMilliseconds >= 1000) {
          _timeInSeconds++;
          _timeInMilliseconds -= 1000;
        }
        if (_timeInSeconds >= 60) {
          _timeInMinutes++;
          _timeInSeconds -= 60;
        }
        String minutesFormatted = '$_timeInMinutes'.padLeft(2, '0');
        String secondsFormatted = '$_timeInSeconds'.padLeft(2, '0');
        String millisecondsFormatted = '${_timeInMilliseconds ~/ 10}'.padLeft(2, '0');
        timeFormatted.value = '$minutesFormatted:$secondsFormatted:$millisecondsFormatted';
      },
    );
  }

  void stop() {
    _timer?.cancel();
    isCounting.value = false;
  }

  void reset() {
    _timeInMilliseconds = 0;
    _timeInSeconds = 0;
    _timeInMinutes = 0;
    timeFormatted.value = '00:00:00';
    isCounting.value = false;
    _timer?.cancel();
    laps.value = [];
  }

  void lap() {
    laps.add(timeFormatted.value);
  }
}
