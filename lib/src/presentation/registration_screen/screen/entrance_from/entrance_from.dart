import 'package:builder_job/src/presentation/registration_screen/screen/forgot_password_screen/forgot_password_screen.dart';
import 'package:builder_job/src/presentation/registration_screen/screen/verification_screen/verification_screen.dart';
import 'package:flutter/material.dart';

class EntranceForm extends StatefulWidget {
  const EntranceForm({super.key});

  @override
  _EntranceFormState createState() => _EntranceFormState();
}

class _EntranceFormState extends State<EntranceForm> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isPasswordVisible = false;
  bool _isEmailValid = true;
  bool _isPasswordValid = true;

  void _validateFields() {
    setState(() {
      _isEmailValid = _validateEmail(_emailController.text);
      _isPasswordValid = _validatePassword(_passwordController.text);
    });
  }

  bool _validateEmail(String value) {
    return value.isNotEmpty && RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value);
  }

  bool _validatePassword(String value) {
    return value.isNotEmpty && value.length >= 6;
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            controller: _emailController,
            decoration: InputDecoration(
              hintText: 'Email',
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25),
                borderSide: BorderSide(
                    color: _isEmailValid ? Colors.grey : Colors.red, width: 2),
              ),
            ),
            style: TextStyle(fontSize: height * 0.02),
          ),
          SizedBox(height: height * 0.02),
          TextFormField(
            controller: _passwordController,
            decoration: InputDecoration(
              hintText: 'Пароль',
              suffixIcon: IconButton(
                icon: Icon(
                  _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                ),
                onPressed: () {
                  setState(() {
                    _isPasswordVisible = !_isPasswordVisible;
                  });
                },
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25),
                borderSide: BorderSide(
                    color: _isPasswordValid ? Colors.grey : Colors.red,
                    width: 2),
              ),
            ),
            obscureText: !_isPasswordVisible,
            style: TextStyle(fontSize: height * 0.02),
          ),
          SizedBox(height: height * 0.02),
          Padding(
            padding: const EdgeInsets.only(
              right: 240,
            ),
            child: TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ForgotPasswordScreen(),
                  ),
                );
              },
              child: const Text(
                'Забыли пароль?',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          SizedBox(height: height * 0.03),
          ElevatedButton(
            onPressed: () {
              _validateFields();
              if (_isEmailValid && _isPasswordValid) {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const VerificationScreen(),
                    ));
              }
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFFFEE1F),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
              ),
              padding: EdgeInsets.symmetric(vertical: height * 0.02),
              minimumSize: Size(double.infinity, height * 0.08),
            ),
            child: const Text(
              'Далее',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                fontSize: 22,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
