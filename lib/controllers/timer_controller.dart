import 'dart:async';

import 'package:get/get.dart';

class TimerController extends GetxController {
  RxString timeFormatted = '00:00:00'.obs;

  int _timeInMinutes = 0;
  int _timeInSeconds = 0;
  int _timeInMilliseconds = 0;

  Timer? _timer;

  void start() {
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

  void reset() {
    _timer?.cancel();
  }

  void lap() {}

  void clearLaps() {}
}
