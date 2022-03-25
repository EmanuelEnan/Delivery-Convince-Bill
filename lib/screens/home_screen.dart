import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:shodaimama_bill/screens/dashboard_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
        // actions: [
        //   IconButton(
        //     onPressed: () {
        //       Navigator.pop(context);
        //     },
        //     icon: const Icon(Icons.logout),
        //   ),
        // ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'assets/3.jpg',
              height: 300,
              width: 300,
            ),
            const Center(
                child: Text(
              'Complete your profile',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w500,
              ),
            )),
            Container(
              width: 350,
              padding: const EdgeInsets.all(8),
              child: FormBuilder(
                key: _formKey,
                child: Column(
                  children: [
                    FormBuilderTextField(
                      name: 'field1',
                      decoration: const InputDecoration(
                        hintText: 'name',
                      ),
                      validator: FormBuilderValidators.required(
                        context,
                        errorText: 'Please enter your name',
                      ),
                    ),
                    FormBuilderTextField(
                      name: 'field2',
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        hintText: 'phone no',
                      ),
                      validator: FormBuilderValidators.required(
                        context,
                        errorText: 'Please enter your phone no',
                      ),
                    ),
                    FormBuilderTextField(
                      name: 'field3',
                      decoration: const InputDecoration(
                        hintText: 'bike license no',
                      ),
                      validator: FormBuilderValidators.required(
                        context,
                        errorText: 'Please enter your bike license no',
                      ),
                    ),
                    FormBuilderTextField(
                      name: 'field3',
                      decoration: const InputDecoration(
                        hintText: 'bike model',
                      ),
                      validator: FormBuilderValidators.required(
                        context,
                        errorText: 'Please enter your bike model',
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        _formKey.currentState?.save();
                        if (_formKey.currentState!.validate()) {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (_) => DashboardScreen(),
                            ),
                          );
                        }
                      },
                      child: const Text('Submit'),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
