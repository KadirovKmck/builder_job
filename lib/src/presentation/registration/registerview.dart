import 'package:builder_job/src/presentation/registration/login_view.dart';
import 'package:builder_job/src/presentation/registration/verification/verification_view.dart';
import 'package:flutter/material.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _surnameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool isViewChanges = true;

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    double padding = screenWidth * 0.05;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: const Text(
            'Регистрация',
            style: TextStyle(
                fontSize: 30, fontWeight: FontWeight.w900, color: Colors.black),
          ),
          centerTitle: true,
          elevation: 0,
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: padding),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: screenHeight * 0.02),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          isViewChanges = true;
                        });
                      },
                      child: Container(
                        width: screenWidth * 0.4,
                        height: screenHeight * 0.06,
                        decoration: ShapeDecoration(
                          color: isViewChanges
                              ? Colors.blue.shade600
                              : Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        child: Center(
                          child: Text(
                            'Пользователь',
                            style: TextStyle(
                              color: isViewChanges
                                  ? Colors.white
                                  : const Color(0xff150B3D),
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: screenWidth * 0.05),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          isViewChanges = false;
                        });
                      },
                      child: Container(
                        width: screenWidth * 0.4,
                        height: screenHeight * 0.06,
                        decoration: ShapeDecoration(
                          color: isViewChanges
                              ? Colors.white
                              : Colors.blue.shade600,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        child: Center(
                          child: Text(
                            'Перевозчик',
                            style: TextStyle(
                              color:
                                  isViewChanges ? Colors.black : Colors.white,
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: screenHeight * 0.03),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Имя',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
                    ),
                    SizedBox(height: screenHeight * 0.015),
                    ContainerUiTextFild(
                      text: 'Введите имя',
                      controller: _nameController,
                    ),
                    SizedBox(height: screenHeight * 0.03),
                    const Text(
                      'Фамилия',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
                    ),
                    SizedBox(height: screenHeight * 0.015),
                    ContainerUiTextFild(
                      text: 'Введите фамилию',
                      controller: _surnameController,
                    ),
                    SizedBox(height: screenHeight * 0.03),
                    const Text(
                      'Номер телефона',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
                    ),
                    SizedBox(height: screenHeight * 0.015),
                    ContainerUiTextFild(
                      text: 'Введите номер телефона',
                      controller: _phoneController,
                    ),
                    SizedBox(height: screenHeight * 0.03),
                    const Text(
                      'Выберите страну',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
                    ),
                    SizedBox(height: screenHeight * 0.015),
                    DropdownButtonFormField<String>(
                      decoration: const InputDecoration(
                        labelText: 'Выберите страну',
                        border: OutlineInputBorder(),
                      ),
                      items: <String>[
                        'Россия',
                        'Казахстан',
                      ].map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (_) {},
                    ),
                    SizedBox(height: screenHeight * 0.03),
                    const Text(
                      'Введите пароль',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
                    ),
                    SizedBox(height: screenHeight * 0.015),
                    ContainerUiTextFild(
                      text: 'Введите пароль',
                      controller: _passwordController,
                    ),
                  ],
                ),
                SizedBox(height: screenHeight * 0.05),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const VerificationView(),
                      ),
                    );
                  },
                  child: Container(
                    width: screenWidth * 0.6,
                    height: screenHeight * 0.07,
                    decoration: ShapeDecoration(
                      color: Colors.blue.shade600,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    child: const Center(
                      child: Text(
                        'Регистрация',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                        ),
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
