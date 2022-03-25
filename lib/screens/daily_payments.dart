import 'package:flutter/material.dart';
import 'package:shodaimama_bill/services/calender.dart';

class DailyPayments extends StatefulWidget {
  const DailyPayments({Key? key}) : super(key: key);

  @override
  State<DailyPayments> createState() => _DailyPaymentsState();
}

class _DailyPaymentsState extends State<DailyPayments> {
  final TextEditingController _oilConsumption = TextEditingController();

  final TextEditingController _distanceController = TextEditingController();
  final TextEditingController _othersController = TextEditingController();

  double totalBill = 0.0;
  bool _validate = false;

  MyHomePage myHomePage = MyHomePage();

  @override
  void dispose() {
    _oilConsumption.dispose();
    _distanceController.dispose();
    _othersController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Daily payments'),
      ),
      body: Container(
        padding: const EdgeInsets.all(34),
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const MyHomePage(),
                ),
              ),
              child: const Text('Calendar'),
            ),
            Row(
              children: [
                const Text(
                  'Oil consumption rate: ',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Expanded(
                  child: TextField(
                    keyboardType: TextInputType.number,
                    controller: _oilConsumption,
                    decoration: InputDecoration(
                      hintText: 'KM/litre',
                      errorText: _validate ? 'can\'t be blank' : null,
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                const Text(
                  'Distance covered today: ',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Expanded(
                  child: TextField(
                    keyboardType: TextInputType.number,
                    controller: _distanceController,
                    decoration: InputDecoration(
                      errorText: _validate ? 'can\'t be blank' : null,
                    ),
                  ),
                )
              ],
            ),
            Row(
              children: [
                const Text(
                  'Others: ',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Expanded(
                  child: TextField(
                    keyboardType: TextInputType.number,
                    controller: _othersController,
                    decoration: InputDecoration(
                      errorText: _validate ? 'can\'t be blank' : null,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 40,
            ),
            Text(
              totalBill.toString() + ' ' + 'tk',
              style: const TextStyle(fontSize: 24),
            ),
            const SizedBox(
              height: 12,
            ),
            SizedBox(
              height: 32,
              width: 140,
              child: ElevatedButton(
                onPressed: () {
                  var hal = int.parse(_oilConsumption.text);
                  var nick = int.parse(_distanceController.text);
                  var gent = int.parse(_othersController.text);

                  setState(
                    () {
                      // _distanceController.text.isEmpty
                      //     ? _validate = true
                      //     : _oilConsumption.text.isEmpty
                      //         ? _validate = true
                      //         : _othersController.text.isEmpty
                      //             ? _validate = true
                      //             :
                      totalBill = ((90 * nick) / hal) + gent;
                    },
                  );
                },
                child: const Text(
                  'calculate',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
