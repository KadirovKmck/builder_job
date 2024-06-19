import 'package:builder_job/src/utils/media_utils/media_utils.dart';
import 'package:flutter/material.dart';

class AuthView extends StatefulWidget {
  const AuthView({super.key});

  @override
  State<AuthView> createState() => _AuthViewState();
}

class _AuthViewState extends State<AuthView> {
  @override
  Widget build(BuildContext context) {
    final height = MediaUtils.height(context);
    final width = MediaUtils.width(context);
    return Scaffold(
      backgroundColor: const Color(0xff1E1E1E),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: width * 0.08),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset('assets/images/logoHorizontal.png'),
            SizedBox(
              height: height * 0.02,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Регистрация',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(
                  width: width * 0.04,
                ),
                const Text(
                  'Вход',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w700,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

class RegistrationScreen extends StatelessWidget {
  const RegistrationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            const LogoWidget(),
            const SizedBox(height: 40.0),
            const RegistrationForm(),
            const SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                // Handle the registration logic here
              },
              style: ElevatedButton.styleFrom(
                // primary: Colors.yellow,
                // onPrimary: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                minimumSize: const Size(double.infinity, 56.0),
              ),
              child: const Text('Далее'),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}

class LogoWidget extends StatelessWidget {
  const LogoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset('assets/images/logoHorizontal.png',
            height: 80.0), // Replace with your logo asset
        const SizedBox(height: 8.0),
        const Text(
          'Builder Job',
          style: TextStyle(
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 40.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {},
              child: Column(
                children: [
                  const Text(
                    'Регистрация',
                    style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 2.0),
                  Container(
                    height: 2.0,
                    width: 60.0,
                    color: Colors.yellow,
                  ),
                ],
              ),
            ),
            const SizedBox(width: 40.0),
            GestureDetector(
              onTap: () {},
              child: const Text(
                'Вход',
                style: TextStyle(
                  fontSize: 18.0,
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

class RegistrationForm extends StatelessWidget {
  const RegistrationForm({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        TextField(
          decoration: InputDecoration(
            hintText: 'Email',
          ),
        ),
        SizedBox(height: 16.0),
        TextField(
          decoration: InputDecoration(
            hintText: 'Пароль',
            suffixIcon: Icon(Icons.visibility_off),
          ),
          obscureText: true,
        ),
        SizedBox(height: 16.0),
        TextField(
          decoration: InputDecoration(
            hintText: 'Номер телефона',
          ),
        ),
        SizedBox(height: 16.0),
        // DropdownButtonFormField<String>(
        //   items: [
        //     DropdownMenuItem(
        //       child: Text('Ваш статус'),
        //       value: '',
        //     ),
        //     // Add other dropdown items here
        //   ],
        //   onChanged: (value) {},
        //   decoration: InputDecoration(
        //     hintText: 'Ваш статус',
        //   ),
        // ),
      ],
    );
  }
}
