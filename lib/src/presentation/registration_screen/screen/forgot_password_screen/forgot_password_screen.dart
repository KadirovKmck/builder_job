import 'package:builder_job/src/presentation/profile_view/profile_view.dart';
import 'package:flutter/material.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  _ForgotPasswordScreenState createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final _passwordController = TextEditingController();
  bool _isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: const Color(0xFF1E1E1E),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: height * 0.02, vertical: 150),
        child: Column(
          children: [
            Text(
              'Забыли пароль?',
              style: TextStyle(
                color: Colors.white,
                fontSize: height * 0.057,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: height * 0.07),
            TextFormField(
              controller: _passwordController,
              decoration: InputDecoration(
                hintText: 'Введите новый пароль',
                hintStyle: const TextStyle(color: Colors.grey),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                  borderSide: BorderSide.none,
                ),
                suffixIcon: IconButton(
                  icon: Icon(
                    _isPasswordVisible
                        ? Icons.visibility
                        : Icons.visibility_off,
                    color: Colors.grey,
                  ),
                  onPressed: () {
                    setState(() {
                      _isPasswordVisible = !_isPasswordVisible;
                    });
                  },
                ),
              ),
              obscureText: !_isPasswordVisible,
              style: TextStyle(fontSize: height * 0.02),
            ),
            SizedBox(height: height * 0.15),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ProfileView(),
                    ));
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
                'Сохранить и продолжить',
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
      ),
    );
  }
}
