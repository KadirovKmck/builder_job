import 'package:builder_job/src/presentation/registration_screen/screen/entrance_from/entrance_from.dart';
import 'package:builder_job/src/presentation/registration_screen/screen/registration_form/registration_form.dart';
import 'package:flutter/material.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  bool isRegistrationSelected = true;

  void toggleTab(bool isRegistration) {
    setState(() {
      isRegistrationSelected = isRegistration;
    });
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xff1E1E1E),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: height * 0.019),
          child: SingleChildScrollView(
            // Added SingleChildScrollView here
            child: Column(
              children: [
                SizedBox(height: height * 0.07),
                Image.asset(
                  'assets/images/logoHorizontal.png',
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: height * 0.19,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () => toggleTab(true),
                      child: Column(
                        children: [
                          Text(
                            'Регистрация',
                            style: TextStyle(
                              fontSize: height * 0.025,
                              color: Colors.white,
                              fontWeight: isRegistrationSelected
                                  ? FontWeight.bold
                                  : FontWeight.normal,
                            ),
                          ),
                          if (isRegistrationSelected)
                            Container(
                              height: 2.0,
                              width: width * 0.2,
                              color: Colors.yellow,
                            ),
                        ],
                      ),
                    ),
                    SizedBox(width: width * 0.1),
                    GestureDetector(
                      onTap: () => toggleTab(false),
                      child: Column(
                        children: [
                          Text(
                            'Вход',
                            style: TextStyle(
                              fontSize: height * 0.025,
                              color: Colors.white,
                              fontWeight: !isRegistrationSelected
                                  ? FontWeight.bold
                                  : FontWeight.normal,
                            ),
                          ),
                          if (!isRegistrationSelected)
                            Container(
                              height: 2.0,
                              width: width * 0.2,
                              color: Colors.yellow,
                            ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: height * 0.05),
                isRegistrationSelected
                    ? const RegistrationForm()
                    : const EntranceForm(),
                SizedBox(
                    height: height *
                        0.05), // Add a SizedBox to add spacing at the bottom
              ],
            ),
          ),
        ),
      ),
    );
  }
}
