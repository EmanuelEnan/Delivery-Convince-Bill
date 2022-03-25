import 'package:flutter/material.dart';
import 'package:pinput/pin_put/pin_put.dart';
import 'package:shodaimama_bill/screens/home_screen.dart';

class OTPScreen extends StatefulWidget {
  TextEditingController phone = TextEditingController();

  OTPScreen({Key? key, required this.phone}) : super(key: key);

  @override
  _OTPScreenState createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  final TextEditingController _otpController = TextEditingController();
  final FocusNode _otpFocus = FocusNode();

  bool _validate = false;

  final BoxDecoration otpDecoration = BoxDecoration(
    color: Colors.blue[200],
    borderRadius: BorderRadius.circular(12),
    border: Border.all(
      color: Colors.grey,
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('OTP Verification'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            'assets/2.jpg',
            height: 200,
            width: 200,
          ),
          const SizedBox(
            height: 12,
          ),
          Container(
            padding: const EdgeInsets.only(top: 18),
            child: const Center(
              child: Text(
                'Verification Code:',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w500,
                ),
              ),
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
              controller: _otpController,
              // validator: (value) {
              //   _validate ? 'provide the code' : null;
              // },
              onSubmit: (pin) {},
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          ElevatedButton(
            onPressed: () {
              _otpController.text.isEmpty
                  ? showDialog(
                      context: context,
                      builder: (context) {
                        return const AlertDialog(
                          content: Text('Please prove the OTP code'),
                        );
                      },
                    )
                  :
                   Navigator.of(context).push(
                      MaterialPageRoute(builder: (_) => const HomeScreen()),
                    );
            },
            child: const Text('Submit'),
          ),
        ],
      ),
    );
  }
}
