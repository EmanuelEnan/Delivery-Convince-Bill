import 'package:flutter/material.dart';
import 'package:shodaimama_bill/widgets/stop_watch.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';

class OrdersOngoing extends StatefulWidget {
  String? name;
  String? productName;

  OrdersOngoing({
    required this.name,
    required this.productName,
  });

  @override
  State<OrdersOngoing> createState() => _OrdersOngoingState();
}

class _OrdersOngoingState extends State<OrdersOngoing> {
  String? delivery;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('orders ongoing'),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 80,
            child: Card(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        widget.name!,
                        style: const TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(widget.productName!),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                onPressed: () {
                  // Navigator.pop(
                  //     context,
                  //     PageRouteBuilder(
                  //         opaque: false,
                  //         pageBuilder: (BuildContext context, _, __) {
                  //           return Center(
                  //             child: AlertDialog(
                  //               content: Text('top'),
                  //             ),
                  //           );
                  //         },),);
                  Navigator.pop(context, 'You can select new task');
                },
                child: const Text('Task completed'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context, 'Choose a new task');
                },
                child: const Text('Cancel this task'),
              ),
            ],
          ),
          const SizedBox(
            height: 170,
          ),
          const Text(
            'Times passed:',
            style: TextStyle(fontSize: 18),
          ),
          const SizedBox(
            height: 14,
          ),
          const StopWatch(),
        ],
      ),
    );
  }
}
