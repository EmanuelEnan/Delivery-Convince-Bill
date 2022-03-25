import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:shodaimama_bill/screens/splash_screen.dart';
import 'package:shodaimama_bill/services/secure_storage.dart';

// Future<void> backgroundHandler(RemoteMessage message) async {
//   print(message.data.toString());
//   print(message.notification!.title);
// }

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  // FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;
  // FirebaseMessaging.onBackgroundMessage(backgroundHandler);

  try {
    String? token = await FirebaseMessaging.instance.getToken();
    var device = await SecureStorage().write1SecureData("deviceId", token!);
    // (device);

    // print(obj);
  } on Exception {
    ("Home Screen (Token): $Exception");
  }

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String? deviceToken;
  String? isFirstTime;

  Future<dynamic> loadFromFuture() async {
    // await Future.delayed(Duration(seconds: 3));

    try {
      deviceToken = await SecureStorage().read1SecureData("deviceToken");
    } on Exception catch (e) {
      ("Main DeviceToken: $e");
    }

    try {
      isFirstTime = await SecureStorage().read1SecureData("isFirstTime");
    } on Exception catch (e) {
      ("Main DeviceToken: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:
          // deviceToken == null
          //     ? const Text('value needed')
          //     :
          const SplashScreen(),
    );
  }
}
