import 'package:flutter/material.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';

class StopWatch extends StatefulWidget {
  const StopWatch({Key? key}) : super(key: key);

  @override
  _StopWatchState createState() => _StopWatchState();
}

class _StopWatchState extends State<StopWatch> {
  final StopWatchTimer _timer = StopWatchTimer();
  final _hours = true;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _timer.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        StreamBuilder<int>(
          initialData: _timer.rawTime.value,
          stream: _timer.rawTime,
          builder: (context, snapshot) {
            final value = snapshot.data;
            final displayTime =
                StopWatchTimer.getDisplayTime(value!, hours: _hours);
            return Text(
              displayTime,
              style: const TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.w600,
              ),
            );
          },
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(primary: Colors.green),
              onPressed: () {
                _timer.onExecute.add(StopWatchExecute.start);
              },
              child: const Text('Start'),
            ),
            const SizedBox(width: 18,),
            ElevatedButton(
              style: ElevatedButton.styleFrom(primary: Colors.red),
              onPressed: () {
                _timer.onExecute.add(StopWatchExecute.stop);
              },
              child: const Text('Stop'),
            ),
          ],
        )
      ],
    );
  }
}
