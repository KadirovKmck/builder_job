import 'package:flutter/material.dart';

class RegistrationScreen extends StatelessWidget {
  const RegistrationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xff1E1E1E),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: height * 0.019),
          child: Column(
            children: [
              const LogoWidget(),
              SizedBox(height: height * 0.05),
              const RegistrationForm(),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}

class LogoWidget extends StatelessWidget {
  const LogoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Column(
      children: [
        SizedBox(
          height: height * 0.07,
        ),
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
              onTap: () {},
              child: Column(
                children: [
                  Text(
                    'Регистрация',
                    style: TextStyle(
                      fontSize: height * 0.025,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: height * 0.005),
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
              onTap: () {},
              child: Text(
                'Вход',
                style: TextStyle(
                  fontSize: height * 0.025,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

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
              suffixIcon: const Icon(Icons.visibility_off),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25),
                borderSide: BorderSide(
                    color: _isPasswordValid ? Colors.grey : Colors.red,
                    width: 2),
              ),
            ),
            obscureText: true,
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
            decoration: InputDecoration(
              hintText: 'Ваш статус',
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25),
                borderSide: BorderSide(
                    color: _isStatusValid ? Colors.grey : Colors.red, width: 2),
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
                  _isStatusValid) {}
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
