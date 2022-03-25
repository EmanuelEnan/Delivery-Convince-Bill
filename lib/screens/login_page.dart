import 'dart:developer';

import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:pinput/pin_put/pin_put.dart';
import 'package:shodaimama_bill/screens/dashboard_screen.dart';

import 'package:shodaimama_bill/services/firebase_utils.dart';
import 'package:shodaimama_bill/services/first_run.dart';
import 'package:shodaimama_bill/services/register_api.dart';

import 'package:shodaimama_bill/services/secure_storage.dart';
import 'package:shodaimama_bill/services/send_api.dart';
import 'package:shodaimama_bill/services/verify_api.dart';

String? phoneNo, otpNo;

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String dialCode = '+00';
  final bool _validate = false;
  // late ProductModel _model;
  String? errorMessage;
  bool? isLoading;
  String _message = '';

  final FocusNode _otpFocus = FocusNode();

  SecureStorage secureStorage = SecureStorage();

  // bool _validate1 = false;

  final BoxDecoration otpDecoration = BoxDecoration(
    color: Colors.blue[200],
    borderRadius: BorderRadius.circular(12),
    border: Border.all(
      color: Colors.grey,
    ),
  );

  TextEditingController phoneController = TextEditingController();
  TextEditingController otpController = TextEditingController();
  TextEditingController typeController = TextEditingController();

  @override
  void initState() {
    super.initState();
    FirstRun().init();
    errorMessage = '';
  }

  @override
  void setState(VoidCallback fn) {
    if (mounted) {
      super.setState(fn);
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    FirebaseUtils.updateFirebaseToken();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Page'),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'assets/1.jpg',
              height: 250,
              width: 250,
              colorBlendMode: BlendMode.clear,
            ),
            const SizedBox(
              height: 30,
            ),
            const Center(
              child: Text(
                'Phone Verification',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            SizedBox(
              width: 300,
              height: 70,
              // child: TextField(
              //   controller: phoneController,
              // ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CountryCodePicker(
                    // onChanged: (CountryCode) {
                    //   dialCode = CountryCode.dialCode!;
                    // },
                    initialSelection: 'Bangladesh',
                    showCountryOnly: true,
                  ),
                  Expanded(
                    child: TextFormField(
                      textInputAction: TextInputAction.next,
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(
                          RegExp(r'[0-9-]'),
                        ),
                      ],
                      decoration: InputDecoration(
                        alignLabelWithHint: true,
                        hintText: 'phone number',
                        errorText: _validate
                            ? 'Please provide your phone number'
                            : null,
                      ),
                      controller: phoneController,
                      keyboardType: TextInputType.number,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () async {
                // await secureStorage.write1SecureData(
                //     'phone', phoneController.text);

                String type = "Customer";

                await apiService3().registerApi(type);

                // setState(
                //   () {
                //     phoneController.text.isEmpty
                //         ? _validate = true
                //         : Navigator.of(context).push(
                //             MaterialPageRoute(
                //               builder: (_) => OTPScreen(
                //                 phone: phoneController,
                //               ),
                //             ),
                //           );
                //   },
                // );
              },
              child: const Text('Next'),
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
              padding: const EdgeInsets.all(8),
              width: 300,
              child: Column(
                children: [
                  Row(
                    children: [
                      const Text(
                        'Your role:  ',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Expanded(
                        child: TextField(
                          decoration: const InputDecoration(
                            alignLabelWithHint: true,
                            hintText: 'type \'delivery\'',
                          ),
                          controller: typeController,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      var phone = phoneController.text;
                      // var type = typeController.toString();

                      await apiService1().sendApi(phone, 'Customer');

                      // void _submitButton(String number) async {
                      // print(number);
                      // Map<String, dynamic>? map;

                      // try {
                      //   map = await apiService1().sendApi(phone, type);
                      // } on Exception {
                      //   log("OTP Screen(API): $Exception");
                      // }

                      // if (map!["message"]["type"] == "SUCCESS") {
                      //   // print(map["data"]["item"]["otp"]);
                      //   FocusScope.of(context).unfocus();
                      // } else {
                      //   setState(() {
                      //     errorMessage = map!["message"]["message"];
                      //   });
                      // }

                      // setState(() {
                      //   _model = user!;
                      // });

                      log('all');

                      // await sendApi(phone, type);
                      // await registerApi(type);
                    },
                    child: const Text('Next'),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            const Text(
              'Verification Code:',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w500,
              ),
            ),
            Container(
              padding: const EdgeInsets.all(8),
              width: 280,
              child: PinPut(
                fieldsCount: 6,
                eachFieldWidth: 25,
                eachFieldHeight: 30,
                submittedFieldDecoration: otpDecoration,
                selectedFieldDecoration: otpDecoration,
                followingFieldDecoration: otpDecoration,
                pinAnimationType: PinAnimationType.rotation,
                focusNode: _otpFocus,
                controller: otpController,
                // validator: (value) {
                //   _validate1 ? 'provide the code' : null;
                // },
                onSubmit: (pin) {},
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            ElevatedButton(
              onPressed: () async {
                // void _verifyButton(BuildContext context) async {
                // Map<String, dynamic>? map;

                // var phone = phoneController.text;
                // var type = typeController.toString();
                // var otp = otpController.text;

                // try {
                //   // print(_pin);
                //   map = await apiService2().verifyApi(phone, otp, type);
                // } on Exception {
                //   ("OTP Verify: $Exception");
                //   setState(() {
                //     _message = "Invalid OTP";
                //     isLoading = false;
                //   });
                // }

                // // print(map);
                // if (map!["message"]["type"] == "SUCCESS") {
                //   try {
                //     await SecureStorage().write1SecureData("isLoggedIn", "Yes");
                //     await SecureStorage().write1SecureData(
                //         "userToken", map["data"]["userToken"]);
                //     await SecureStorage().write1SecureData(
                //         "sessionToken", map["data"]["sessionToken"]);
                //     await SecureStorage()
                //         .write1SecureData("userType", map["data"]["type"]);
                //   } catch (e) {
                //     ("API Call: $e");
                //     setState(() {
                //       _message = "Invalid OTP";
                //       isLoading = false;
                //     });
                //   }
                // }

                // onPressed: () async {
                //   secureStorage.write1SecureData('OTP', otpController.text);

                //   Navigator.of(context).push(
                //     MaterialPageRoute(
                //       builder: (_) => DashboardScreen(),
                //     ),
                //   );

                //   var phone = phoneController.toString();
                //   var type = typeController.toString();
                //   var otp = int.parse(otpController.toString());

                //   await apiService2().verifyApi(phone, otp, type);
                //   log('cool');

                // setState(() {
                //   _model = user1!;
                // });

                // await verifyApi(phone, otp, type);

                otpController.text.isEmpty
                    ? showDialog(
                        context: context,
                        builder: (context) {
                          return const AlertDialog(
                            content: Text('Please provide the OTP code'),
                          );
                        },
                      )
                    : Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (_) => const DashboardScreen(),
                        ),
                      );
              },

              // }
              // };
              child: const Text('Submit'),
            ),
            const SizedBox(
              height: 15,
            ),
          ],
        ),
      ),
    );
  }
}
