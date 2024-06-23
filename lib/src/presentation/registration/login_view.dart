import 'package:builder_job/src/components/navbar.dart';
import 'package:builder_job/src/presentation/registration/registerview.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _showErrorMessage = false;

  void _login() {
    setState(() {
      _showErrorMessage =
          _phoneController.text.isEmpty || _passwordController.text.isEmpty;
    });

    if (_showErrorMessage) {
      Future.delayed(const Duration(seconds: 3), () {
        setState(() {
          _showErrorMessage = false;
        });
      });
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const NavbarView(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    double padding = screenWidth * 0.05;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: padding),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                SizedBox(height: screenHeight * 0.1),
                if (_showErrorMessage) const ErrorMessage(),
                SizedBox(height: screenHeight * 0.02),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Вход',
                      style: TextStyle(
                        fontSize: 30,
                        color: Color.fromARGB(255, 27, 105, 239),
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.02),
                    const Text(
                      'Номер телефона',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
                    ),
                    ContainerUiTextFild(
                      text: 'Введите номер телефона',
                      controller: _phoneController,
                    ),
                    SizedBox(height: screenHeight * 0.02),
                    const Text(
                      'Пароль',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
                    ),
                    ContainerUiTextFild(
                      text: 'Введите пароль',
                      controller: _passwordController,
                    ),
                  ],
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    'Забыл пароль?',
                    style: TextStyle(color: Color.fromARGB(255, 30, 139, 228)),
                  ),
                ),
                SizedBox(height: screenHeight * 0.04),
                GestureDetector(
                  onTap: _login,
                  child: Container(
                    height: 60,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.blueAccent),
                    child: const Center(
                      child: Text(
                        'Вход',
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: screenHeight * 0.02),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const RegistrationScreen(),
                        ));
                  },
                  child: Container(
                    height: 60,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                          color: const Color.fromARGB(255, 80, 127, 214),
                          width: 1.5),
                    ),
                    child: const Center(
                      child: Text(
                        'Регистрация',
                        style:
                            TextStyle(color: Colors.blueAccent, fontSize: 18),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ContainerUiTextFild extends StatelessWidget {
  const ContainerUiTextFild({
    super.key,
    required this.text,
    required this.controller,
  });

  final String text;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
            color: const Color.fromARGB(255, 208, 208, 208), width: 1),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Center(
        child: TextField(
          controller: controller,
          decoration: InputDecoration(
            hintText: text,
            border: InputBorder.none,
            contentPadding: const EdgeInsets.only(left: 15),
          ),
        ),
      ),
    );
  }
}

class ErrorMessage extends StatelessWidget {
  const ErrorMessage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 253, 140, 132),
        borderRadius: BorderRadius.circular(15),
        border: const Border(
          left: BorderSide(
            color: Color.fromARGB(255, 183, 15, 3),
            width: 5,
          ),
        ),
      ),
      child: const Row(
        children: [
          Icon(
            Icons.error,
            color: Color.fromARGB(255, 195, 29, 17),
          ),
          SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Ошибка',
                style: TextStyle(
                  color: Color(0xFF721C24),
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'Заполните все пустые поля',
                style: TextStyle(
                  color: Color(0xFF721C24),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
