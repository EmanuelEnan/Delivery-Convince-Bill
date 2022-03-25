import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shodaimama_bill/models/names.dart';
import 'package:shodaimama_bill/screens/login_page.dart';
import 'package:shodaimama_bill/screens/orders_ongoing.dart';
import 'package:shodaimama_bill/services/secure_storage.dart';
import 'package:shodaimama_bill/widgets/navigation_drawer.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  // final _key = GlobalKey<FormState>();
  String customerName = 'Customer name';
  String productName = 'Product name';
  String deliveryLoc = 'Delivery location:';

  final SecureStorage _secureStorage = SecureStorage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NavigationDrawer(),
      appBar: AppBar(
        title: const Text('Dashboard'),
        actions: [
          IconButton(
            onPressed: () async {
              await _secureStorage.deleteSecureData('OTP').whenComplete(
                    () => Navigator.pushReplacement(
                      context,
                      PageTransition(
                          child: const LoginPage(),
                          type: PageTransitionType.bottomToTop),
                    ),
                  );
            },
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: SingleChildScrollView(
        physics: const ScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset(
              'assets/3.jpg',
              height: 200,
            ),
            const SizedBox(
              height: 14,
            ),
            const Text(
              'Hello, Person',
              style: TextStyle(
                fontSize: 23,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            const Text(
              'Available Orders to take',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          Text(
                            names[index].productName.toString(),
                            style: const TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(names[index].name.toString()),
                          const SizedBox(
                            height: 7,
                          ),
                          Text(names[index].delivery.toString()),
                        ],
                      ),
                      SizedBox(
                        width: 200,
                        child: Row(
                          children: [
                            Expanded(
                              child: ElevatedButton(
                                onPressed: () async {
                                  final result =
                                      await Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (_) => OrdersOngoing(
                                        name: names[index].name,
                                        productName: names[index].productName,
                                      ),
                                    ),
                                  );
                                  ScaffoldMessenger.of(context)
                                    ..removeCurrentSnackBar()
                                    ..showSnackBar(
                                      SnackBar(
                                        content: Text('$result'),
                                      ),
                                    );
                                },
                                child: const Text('Take'),
                              ),
                            ),
                            const SizedBox(
                              width: 4,
                            ),
                            Expanded(
                              child: ElevatedButton(
                                onPressed: () {
                                  setState(
                                    () {
                                      names.removeAt(index);
                                    },
                                  );
                                },
                                child: const Text('Don\'t take'),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                },
                separatorBuilder: (context, index) => const Divider(
                      height: 10,
                    ),
                itemCount: names.length),
          ],
        ),
      ),
    );
  }
}
