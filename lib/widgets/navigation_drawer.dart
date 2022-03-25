import 'package:flutter/material.dart';
import 'package:shodaimama_bill/screens/daily_payments.dart';
import 'package:shodaimama_bill/screens/geolocation_screen.dart';
import 'package:shodaimama_bill/screens/orders_ongoing.dart';
import 'package:shodaimama_bill/screens/weekly_payments.dart';
import 'package:shodaimama_bill/services/location_api.dart';

class NavigationDrawer extends StatefulWidget {
  const NavigationDrawer({Key? key}) : super(key: key);

  @override
  State<NavigationDrawer> createState() => _NavigationDrawerState();
}

class _NavigationDrawerState extends State<NavigationDrawer> {
  String dropDownValue = 'Payments';

  GeolocationScreen geolocationScreen = GeolocationScreen();

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Container(
                    width: double.infinity,
                    height: 100,
                    color: Colors.blue[300],
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: const [
                        Padding(
                          padding: EdgeInsets.only(
                            left: 14,
                            bottom: 8,
                          ),
                          child: Text(
                            'Mr. Person',
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 40,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 14),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InkWell(
                      splashColor: Colors.blue,
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (_) => const GeolocationScreen(),
                          ),
                        );
                      },
                      child: Row(
                        children: const [
                          Icon(
                            Icons.location_history,
                            color: Colors.blue,
                          ),
                          SizedBox(
                            width: 13,
                          ),
                          Text(
                            'Show current position',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Icon(
                            Icons.arrow_forward_ios_rounded,
                            color: Colors.blue,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 55,
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.fastfood,
                          color: Colors.blue,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        GestureDetector(
                          onTap: () {
                            // Navigator.of(context).push(
                            //   MaterialPageRoute(
                            //     builder: (_) => OrdersOngoing(),
                            //   ),
                            // );
                          },
                          child: const Text(
                            'Orders ongoing',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 28,
                    ),
                    Row(
                      children: const [
                        Icon(
                          Icons.food_bank_rounded,
                          color: Colors.blue,
                        ),
                        SizedBox(
                          width: 13,
                        ),
                        Text(
                          'Orders completed',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 28,
                    ),
                    // DropdownButtonHideUnderline(
                    //   child: DropdownButton(
                    //     dropdownColor: Colors.white,
                    //     value: dropDownValue,
                    //     style: const TextStyle(
                    //       fontSize: 18,
                    //       fontWeight: FontWeight.w400,
                    //       color: Colors.black,
                    //     ),
                    //     icon: const Icon(Icons.arrow_drop_down),
                    //     // elevation: 16,
                    //     // style: const TextStyle(color: Colors.deepPurple),

                    //     onChanged: (String? newValue) {
                    //       setState(() {
                    //         dropDownValue = newValue!;
                    //       });
                    //     },
                    //     items: [
                    //       'Payments',
                    //       'Daily payments',
                    //       'Weekly payments',
                    //       'Monthly payments'
                    //     ].map<DropdownMenuItem<String>>((String value) {
                    //       return DropdownMenuItem<String>(
                    //         value: value,
                    //         child: Text(value),
                    //       );
                    //     }).toList(),
                    //   ),
                    // ),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (_) => DailyPayments(),
                          ),
                        );
                      },
                      child: Row(
                        children: const [
                          Icon(
                            Icons.money_off_rounded,
                            color: Colors.blue,
                          ),
                          SizedBox(
                            width: 13,
                          ),
                          Text(
                            'daily payments',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 28,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (_) => const WeeklyPayments(),
                          ),
                        );
                      },
                      child: Row(
                        children: const [
                          Icon(
                            Icons.money,
                            color: Colors.blue,
                          ),
                          SizedBox(
                            width: 13,
                          ),
                          Text(
                            'Weekly payments',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 28,
                    ),
                    Row(
                      children: const [
                        Icon(
                          Icons.monetization_on,
                          color: Colors.blue,
                        ),
                        SizedBox(
                          width: 13,
                        ),
                        Text(
                          'Monthly payments',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(
                      height: 270,
                    ),
                    Row(
                      children: const [
                        Icon(
                          Icons.settings,
                          color: Colors.blue,
                        ),
                        SizedBox(
                          width: 13,
                        ),
                        Text(
                          'Settings',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 28,
                    ),
                    Row(
                      children: const [
                        Icon(
                          Icons.logout,
                          color: Colors.blue,
                        ),
                        SizedBox(
                          width: 13,
                        ),
                        Text(
                          'Logout',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 23,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
