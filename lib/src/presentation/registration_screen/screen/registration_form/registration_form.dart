import 'package:builder_job/src/components/navbar.dart';
import 'package:flutter/material.dart';

class RegistrationForm extends StatefulWidget {
  const RegistrationForm({super.key});

  @override
  _RegistrationFormState createState() => _RegistrationFormState();
}

class _RegistrationFormState extends State<RegistrationForm> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _phoneController = TextEditingController();
  String? _selectedStatus;
  bool _isEmailValid = true;
  bool _isPasswordValid = true;
  bool _isPhoneValid = true;
  bool _isStatusValid = true;
  bool _isPasswordVisible = false;

  void _validateFields() {
    setState(() {
      _isEmailValid = _validateEmail(_emailController.text);
      _isPasswordValid = _validatePassword(_passwordController.text);
      _isPhoneValid = _validatePhone(_phoneController.text);
      _isStatusValid = _selectedStatus != null;
    });
  }

  bool _validateEmail(String value) {
    return value.isNotEmpty && RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value);
  }

  bool _validatePassword(String value) {
    return value.isNotEmpty && value.length >= 6;
  }

  bool _validatePhone(String value) {
    return value.isNotEmpty && RegExp(r'^\+?[0-9]{10,13}$').hasMatch(value);
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
          TextFormField(
            controller: _phoneController,
            decoration: InputDecoration(
              hintText: 'Номер телефона',
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25),
                borderSide: BorderSide(
                    color: _isPhoneValid ? Colors.grey : Colors.red, width: 2),
              ),
            ),
            style: TextStyle(fontSize: height * 0.02),
          ),
          SizedBox(height: height * 0.02),
          DropdownButtonFormField<String>(
            menuMaxHeight: 100,
            decoration: InputDecoration(
              hintText: 'Ваш статус',
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25),
                borderSide: BorderSide(
                  color: _isStatusValid ? Colors.grey : Colors.red,
                  width: 2,
                ),
              ),
            ),
            items: const [
              DropdownMenuItem(
                  value: 'Пользователь', child: Text('Пользователь')),
              DropdownMenuItem(value: 'Специалист', child: Text('Специалист')),
            ],
            onChanged: (value) {
              setState(() {
                _selectedStatus = value;
              });
            },
            value: _selectedStatus,
          ),
          SizedBox(height: height * 0.06),
          ElevatedButton(
            onPressed: () {
              _validateFields();
              if (_isEmailValid &&
                  _isPasswordValid &&
                  _isPhoneValid &&
                  _isStatusValid) {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const NavbarView(),
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
